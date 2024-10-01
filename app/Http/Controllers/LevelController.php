<?php

namespace App\Http\Controllers;

// use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use App\Models\LevelModel;
use Illuminate\Http\Request;
use Yajra\DataTables\Facades\DataTables;

class LevelController extends Controller
{
    // Menampilkan halaman awal Level
    public function index()
    {
        $breadcrumb = (object) [
            'title' => 'Daftar Level',
            'list' => ['Home', 'Level']
        ];

        $page = (object) [
            'title' => 'Daftar Level yang terdaftar dalam sistem'
        ];

        $activeMenu = 'level'; // set menu yang sedang aktif
        $level = LevelModel::all(); // ambil data level untuk filter level
        return view('level.index', [
            'breadcrumb' => $breadcrumb, 
            'page' => $page, 
            'level' => $level,
            'activeMenu' => $activeMenu]);
    }

    public function list(Request $request)
    {
        $level = LevelModel::select('level_id', 'level_kode', 'level_nama');


        return DataTables::of($level)
            ->addIndexColumn()
            ->addColumn('aksi', function ($level) { // menambahkan kolom aksi
                $btn = '';
                $btn .= '<a href="' . url('/level/' . $level->level_id . '/edit') . '" class="btn btn-warning btn-sm">Edit</a>';
                $btn .= '<form class="d-inline-block" method="POST" action="' . url('/level/' . $level->level_id) . '">
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
            'title' => 'Tambah Level',
            'list' => ['Home', 'Level', 'Tambah']
        ];

        $page = (object) [
            'title' => 'Tambah level baru'
        ];

        $level = LevelModel::all(); 
        $activeMenu = 'level'; 

        return view('level.create', [
            'breadcrumb' => $breadcrumb, 
            'page' => $page, 
            'level' => $level, 
            'activeMenu' => $activeMenu]);
    }

    public function store(Request $request)
    {
        $request->validate([
            // Levelname harus diisi, berupa string, minimal 3 karakter, dan bernilai unik di tabel Level kolom Levelname
            'level_kode' => 'required|string|min:3|unique:m_Level,level_kode',

            // nama harus diisi, berupa string, dan maksimal 100 karakter
            'level_nama' => 'required|string|max:100',



        ]);

        LevelModel::create([
            'level_kode' => $request->level_kode,
            'level_nama' => $request->level_nama,
            
        ]);
        return redirect('/level')->with('success', 'Data Level berhasil disimpan');
    }

    // Menampilkan halaman form edit Level
    public function edit(string $id)
    {
        $level = LevelModel::find($id);

        $breadcrumb = (object) [
            'title' => 'Edit Level',
            'list' => ['Home', 'Level', 'Edit']
        ];

        $page = (object) [
            'title' => 'Edit level'
        ];

        $activeMenu = 'level'; // set menu yang sedang aktif

        return view('level.edit', ['breadcrumb' => $breadcrumb, 'page' => $page, 'level' => $level, 'activeMenu' => $activeMenu]);
    }

    // Menyimpan perubahan data Level
    public function update(Request $request, string $id)
    {
        $request->validate([
            // Levelname harus diisi, berupa string, minimal 3 karakter,
            // dan bernilai unik di tabel m_Level kolom Levelname kecuali untuk Level dengan id yang sedang diedit
            'level_kode' => 'required|string|min:3',

            'level_nama' => 'required|string|max:100', // nama harus diisi, berupa string, dan maksimal 100 karakter

        ]);

        LevelModel::find($id)->update([
            'level_kode' => $request->level_kode,
            'level_nama' => $request->level_nama,
            
        ]);

        return redirect('/level')->with('success', 'Data Level berhasil diubah');
    }

    // Menghapus data Level
    public function destroy(string $id)
    {
        $check = LevelModel::find($id);

        if (!$check) {
            // untuk mengecek apakah data Level dengan id yang dimaksud ada atau tidak
            return redirect('/level')->with('error', 'Data Level tidak ditemukan');
        }

        try {
            LevelModel::destroy($id); // Hapus data level

            return redirect('/level')->with('success', 'Data Level berhasil dihapus');
        } catch (\Illuminate\Database\QueryException $e) {
            // Jika terjadi error ketika menghapus data, redirect kembali ke halaman dengan membawa pesan error
            return redirect('/level')->with('error', 'Data Level gagal dihapus karena masih terdapat tabel lain yang terkait dengan data ini');
        }
    }
}

// class LevelController extends Controller
// {
    // public function index()
    // {
    //     // Insert
    //     // DB::insert('insert into m_level(level_kode, level_nama, created_at) values (?, ?, ?)', ['CUS', 'Pelanggan', now()]);

    //     // return 'Insert data baru berhasil!';

    //     // edit
    //     // $row = DB::update('update m_level set level_nama = ? where level_kode = ?', ['Customer', 'CUS']);

    //     // return 'Update data berhasil. Jumlah data yang diupdate: ' . $row . ' baris';

    //     // Delete
    //     // $row = DB::delete('delete from m_level where level_kode = ?', ['CUS']);
    //     // return 'Delete data berhasil. Jumlah data yang dihapus: ' . $row . ' baris';

    //     $data = DB::select('select * from m_level');
    //     return view('level', ['data' => $data]);
    // }

    
// }

