<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\LevelController;
use App\Http\Controllers\KategoriController;
use App\Http\Controllers\UserController;
use App\Http\Controllers\WelcomeController;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "web" middleware group. Make something great!
|
*/

Route::get('/', function () {
    return view('welcome');
});

// Route::get('/level', [LevelController::class, 'index']);
// Route::get('/kategori', [KategoriController::class, 'index']);
// Route::get('/user', [UserController::class, 'index']);
// Route::get('/user/tambah', [UserController::class, 'tambah']);
// Route::post('/user/tambah_simpan', [UserController::class, 'tambah_simpan']);
// Route::get('/user/ubah/{id}', [UserController::class, 'ubah']);
// Route::put('/user/ubah_simpan/{id}', [UserController::class, 'ubah_simpan']);
// Route::get('/user/hapus/{id}', [UserController::class, 'hapus']);

// jobsheet 5
Route::get('/', [WelcomeController::class, 'index']);

Route::group(['prefix' => 'user'], function () {
    // menampilkan halaman awal user
    Route::get('/', [UserController::class, 'index']);

    // menampilkan data user dalam bentuk json untuk datatables
    Route::post('/list', [UserController::class, 'list']);

    // menampilkan halaman form tambah user
    Route::get('/create', [UserController::class, 'create']);

    // menyimpan data user baru
    Route::post('/', [UserController::class, 'store']);

    // menampilkan detail user
    Route::get('/{id}', [UserController::class, 'show']);

    // menampilkan halaman form edit user
    Route::get('/{id}/edit', [UserController::class, 'edit']);

    // menyimpan perubahan data user
    Route::put('/{id}', [UserController::class, 'update']);

    // menghapus data user
    Route::post('/{id}', [UserController::class, 'destroy']);
});