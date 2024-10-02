<?php
namespace App\Http\Controllers;
// use Illuminate\Support\Facades\Hash;
use Illuminate\Http\Request;
use App\Models\BarangModel;
use App\Models\KategoriModel;
use Yajra\DataTables\Facades\DataTables;
class BarangController extends Controller
{
    
    public function index()
    {
        $breadcrumb = (object) [
            'title' => 'Daftar Barang',
            'list' => ['Home', 'Barang']
        ];
        $page = (object) [
            'title' => 'Daftar barang yang terdaftar dalam sistem'
        ];
        $activeMenu = 'barang'; // set menu yang sedang aktif
        $kategori = KategoriModel::all(); // ambil data kategori untuk filter kategori
        return view('barang.index', [
            'breadcrumb' => $breadcrumb, 
            'page' => $page, 
            'kategori' => $kategori,
            'activeMenu' => $activeMenu]);
    }
    public function list(Request $request)
    {
        $barangs = BarangModel::select('kategori_id','barang_id', 'barang_kode', 'barang_nama', 'kategori_id')
            ->with('kategori');
        // Filter data barang berdasarkan kategori_id
        if ($request->kategori_id) {
            $barangs->where('kategori_id', $request->kategori_id);
        }
        return DataTables::of($barangs)
            ->addIndexColumn()
            ->addColumn('aksi', function ($barang) { // menambahkan kolom aksi
                $btn = '<a href="' . url('/barang/' . $barang->barang_id) . '" class="btn btn-info btn-sm">Detail</a>';
                $btn .= '<a href="' . url('/barang/' . $barang->barang_id . '/edit') . '" class="btn btn-warning btn-sm">Edit</a>';
                $btn .= '<form class="d-inline-block" method="POST" action="' . url('/barang/' . $barang->barang_id) . '">
                            ' . csrf_field() . '
                            <button type="submit" class="btn btn-danger btn-sm" onclick="return confirm(\'Apakah Anda yakin menghapus data ini?\');">Hapus</button>
                        </form>';
                return $btn;
            })
            ->rawColumns(['aksi']) 
            ->make(true);
    }
  
    public function create()
    {
        $breadcrumb = (object) [
            'title' => 'Tambah barang',
            'list' => ['Home', 'barang', 'Tambah']
        ];
        $page = (object) [
            'title' => 'Tambah barang baru'
        ];
        $kategori = KategoriModel::all(); 
        $activeMenu = 'barang'; 
        return view('barang.create', [
            'breadcrumb' => $breadcrumb, 
            'page' => $page, 
            'kategori' => $kategori, 
            'activeMenu' => $activeMenu]);
    }
    public function store(Request $request)
    {
        $request->validate([
            'barang_kode' => 'required|string|max:10|unique:m_barang,barang_kode',
            'barang_nama' => 'required|string|max:100',
            'kategori_id' => 'required|integer',
            'harga_jual' => 'required|integer',
            'harga_beli' => 'required|integer'
        ]);
        BarangModel::create([
            'barang_kode' => $request->barang_kode,
            'barang_nama' => $request->barang_nama,
            'kategori_id' => $request->kategori_id,
            'harga_jual' => $request->harga_jual,
            'harga_beli' => $request->harga_beli
        ]);
        return redirect('/barang')->with('success', 'Data barang berhasil disimpan');
    }
    
    public function show(string $id)
    {
        $barang = BarangModel::with('kategori')->find($id);
        $breadcrumb = (object) [
            'title' => 'Detail barang',
            'list' => ['Home', 'Barang', 'Detail']
        ];
        $page = (object) [
            'title' => 'Detail barang'
        ];
        $activeMenu = 'barang'; // set menu yang sedang aktif
        return view('barang.show', ['breadcrumb' => $breadcrumb, 'page' => $page, 'barang' => $barang, 'activeMenu' => $activeMenu]);
    }
    // Menampilkan halaman form edit barang
    public function edit(string $id)
    {
        $barang = BarangModel::find($id);
        $kategori = KategoriModel::all();
        $breadcrumb = (object) [
            'title' => 'Edit barang',
            'list' => ['Home', 'barang', 'Edit']
        ];
        $page = (object) [
            'title' => 'Edit barang'
        ];
        $activeMenu = 'barang'; // set menu yang sedang aktif
        return view('barang.edit', ['breadcrumb' => $breadcrumb, 'page' => $page, 'barang' => $barang, 'kategori' => $kategori, 'activeMenu' => $activeMenu]);
    }
    // Menyimpan perubahan data barang
    public function update(Request $request, string $id)
{
    $request->validate([
        'barang_kode' => 'required|string|max:10',
        'barang_nama' => 'required|string|max:100',
        'kategori_id' => 'required|integer',
        'harga_jual' => 'required|integer',
        'harga_beli' => 'required|integer'
    ]);
    // Update data barang
    $barang = BarangModel::find($id);
    if (!$barang) {
        return redirect('/barang')->with('error', 'Data barang tidak ditemukan');
    }
    $barang->update([
        'barang_kode' => $request->barang_kode,
        'barang_nama' => $request->barang_nama,
        'kategori_id' => $request->kategori_id,
        'harga_jual' => $request->harga_jual,
        'harga_beli' => $request->harga_beli
    ]);
    return redirect('/barang')->with('success', 'Data barang berhasil diubah');
}
    // Menghapus data barang
    public function destroy(string $id)
    {
        $check = BarangModel::find($id);
        if (!$check) {
            // untuk mengecek apakah data barang dengan id yang dimaksud ada atau tidak
            return redirect('/barang')->with('error', 'Data barang tidak ditemukan');
        }
        try {
            BarangModel::destroy($id); // Hapus data kategori
            return redirect('/barang')->with('success', 'Data barang berhasil dihapus');
        } catch (\Illuminate\Database\QueryException $e) {
            // Jika terjadi error ketika menghapus data, redirect kembali ke halaman dengan membawa pesan error
            return redirect('/barang')->with('error', 'Data barang gagal dihapus karena masih terdapat tabel lain yang terkait dengan data ini');
        }
    }
}