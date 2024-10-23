<?php

namespace App\Http\Controllers;

use App\Models\BarangModel;
use App\Models\TransaksiDetailModel;
use App\Models\TransaksiModel;
use App\Models\UserModel;
use Barryvdh\DomPDF\Facade\Pdf;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use Yajra\DataTables\Facades\DataTables;

class TransaksiController extends Controller
{
    public function index()
    {
        $breadcrumb = (object) [
            'title' => 'Daftar Transaksi',
            'list' => ['Home', 'Transaksi']
        ];

        $page = (object) [
            'title' => 'Daftar transaksi yang terdaftar dalam sistem'
        ];

        $activeMenu = 'transaksi';

        $transaksi = TransaksiModel::all();

        return view('transaksi.index', compact('breadcrumb', 'page', 'transaksi', 'activeMenu'));
    }

    public function list(Request $request)
    {
        $transaksis = TransaksiModel::select('penjualan_id', 'user_id', 'pembeli', 'penjualan_kode', 'penjualan_tanggal')->with('user');

        return DataTables::of($transaksis)
            ->addIndexColumn()
            ->addColumn('aksi', function ($transaksi) { 
                $btn = '<button onclick="modalAction(\'' . url('/transaksi/' . $transaksi->penjualan_id . '/show_ajax') . '\')" class="btn btn-info btn-sm">Detail</button> ';
                $btn .= '<button onclick="modalAction(\'' . url('/transaksi/' . $transaksi->penjualan_id . '/edit_ajax') . '\')" class="btn btn-warning btn-sm">Edit</button> ';
                $btn .= '<button onclick="modalAction(\'' . url('/transaksi/' . $transaksi->penjualan_id . '/delete_ajax') . '\')"  class="btn btn-danger btn-sm">Hapus</button> ';
                return $btn;
            })
            ->rawColumns(['aksi'])
            ->make(true);
    }

    public function destroy(string $id)
    {
        $check = TransaksiModel::find($id);
        if (!$check) {
            return redirect('/transaksi')->with('error', 'Data transaksi tidak ditemukan');
        }

        try {
            TransaksiDetailModel::where('penjualan_id', $id)->delete();
            TransaksiModel::destroy($id);
    
            return redirect('/transaksi')->with('success', 'Data transaksi berhasil dihapus');
        } catch (\Illuminate\Database\QueryException $e) {
            return redirect('/transaksi')->with('error', 'Data transaksi gagal dihapus karena masih terdapat tabel lain yang terkait dengan data ini');
        }
    }

    public function show_ajax(string $id)
    {
        $transaksi = TransaksiModel::with(['user', 'transaksiDetail.barang'])->find($id);

        return view('transaksi.show_ajax', ['transaksi' => $transaksi]);
    }

    public function create_ajax()
    {
        $user = UserModel::select('user_id', 'nama')->get();
        $barang = BarangModel::select('barang_id', 'barang_nama')->get();

        return view('transaksi.create_ajax', compact('user', 'barang'));
    }

    public function store_ajax(Request $request)
    {
        if ($request->ajax() || $request->wantsJson()) {
            $rules = [
                'user_id' => 'required|integer',
                'pembeli' => 'required|string|max:100',
                'penjualan_kode' => 'required|string|max:20|min:3|unique:t_penjualan,penjualan_kode',
                'penjualan_tanggal' => 'required|date',
                'transaksi_details.*.barang_id' => 'required|integer',
                'transaksi_details.*.jumlah' => 'required|integer',
                'transaksi_details.*.harga' => 'required|numeric',
            ];

            $validator = Validator::make($request->all(), $rules);

            if ($validator->fails()) {
                return response()->json([
                    'status' => false,
                    'message' => 'Validasi Gagal',
                    'msgField' => $validator->errors(),
                ]);
            }

            $transaksi = TransaksiModel::create($request->only(['user_id', 'pembeli', 'penjualan_kode', 'penjualan_tanggal']));

            foreach ($request->transaksi_details as $detail) {
                TransaksiDetailModel::create([
                    'penjualan_id' => $transaksi->penjualan_id,
                    'barang_id' => $detail['barang_id'],
                    'harga' => $detail['harga'],
                    'jumlah' => $detail['jumlah'],
                ]);
            }

            return response()->json([
                'status' => true,
                'message' => 'Transaksi berhasil disimpan'
            ]);
        }

        return redirect('/');
    }

    public function edit_ajax(string $id)
    {
        $transaksi = TransaksiModel::with(['transaksiDetail.barang'])->find($id);
        $user = UserModel::select('user_id', 'nama')->get();
        $barang = BarangModel::select('barang_id', 'barang_nama')->get();

        return view('transaksi.edit_ajax', compact('transaksi', 'user', 'barang'));
    }

    public function update_ajax(Request $request, $id)
    {
        if ($request->ajax() || $request->wantsJson()) {
            $rules = [
                'user_id' => 'required|integer',
                'pembeli' => 'required|string|max:100',
                'penjualan_kode' => 'required|string|max:20|min:3|unique:t_penjualan,penjualan_kode,' . $id . ',penjualan_id',
                'penjualan_tanggal' => 'required|date',
                'transaksi_details.*.barang_id' => 'required|integer',
                'transaksi_details.*.jumlah' => 'required|integer',
                'transaksi_details.*.harga' => 'required|numeric',
            ];

            $validator = Validator::make($request->all(), $rules);

            if ($validator->fails()) {
                return response()->json([
                    'status' => false,
                    'message' => 'Validasi gagal.',
                    'msgField' => $validator->errors(),
                ]);
            }

            $transaksi = TransaksiModel::find($id);
            if (!$transaksi) {
                return response()->json([
                    'status' => false,
                    'message' => 'Data tidak ditemukan',
                ]);
            }

            $transaksi->update($request->only(['user_id', 'pembeli', 'penjualan_kode', 'penjualan_tanggal']));

            $existingDetailIds = $transaksi->transaksiDetail->pluck('detail_id')->toArray();
            $incomingDetailIds = array_keys($request->transaksi_details);

            $toDelete = array_diff($existingDetailIds, $incomingDetailIds);
            TransaksiDetailModel::destroy($toDelete);

            foreach ($request->transaksi_details as $detailId => $detailData) {
                if (in_array($detailId, $existingDetailIds)) {
                    TransaksiDetailModel::where('detail_id', $detailId)->update($detailData);
                } else {
                    TransaksiDetailModel::create([
                        'penjualan_id' => $transaksi->penjualan_id,
                        'barang_id' => $detailData['barang_id'],
                        'harga' => $detailData['harga'],
                        'jumlah' => $detailData['jumlah'],
                    ]);
                }
            }

            return response()->json([
                'status' => true,
                'message' => 'Data transaksi berhasil diubah.',
            ]);
        }
    }

    public function confirm_ajax(string $id)
    {
        $transaksi = TransaksiModel::with(['user', 'transaksiDetail.barang'])->find($id);

        return view('transaksi.confirm_ajax', compact('transaksi'));
    }

    public function delete_ajax(Request $request, string $id)
    {
        if ($request->ajax() || $request->wantsJson()) {
            $transaksi = TransaksiModel::find($id);

            if ($transaksi) {
                TransaksiDetailModel::where('penjualan_id', $transaksi->penjualan_id)->delete();
                $transaksi->delete();

                return response()->json([
                    'status' => true,
                    'message' => 'Data berhasil dihapus'
                ]);
            } else {
                return response()->json([
                    'status' => false,
                    'message' => 'Data tidak ditemukan'
                ]);
            }
        }
    }

    public function export_pdf()
    {
        $transaksi = TransaksiModel::select('user_id', 'penjualan_kode', 'penjualan_tanggal', 'pembeli')
            ->with('user')
            ->get();

        $pdf = Pdf::loadView('transaksi.export_pdf', ['transaksi' => $transaksi]);

        return $pdf->stream();
    }
}
