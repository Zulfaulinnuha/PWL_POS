<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class StokSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $stokData = [
            ['barang_id' => 1, 'user_id' => 1, 'stok_tanggal' => now(), 'stok_jumlah' => 20],
            ['barang_id' => 2, 'user_id' => 1, 'stok_tanggal' => now(), 'stok_jumlah' => 25],
            ['barang_id' => 3, 'user_id' => 1, 'stok_tanggal' => now(), 'stok_jumlah' => 30],
            ['barang_id' => 4, 'user_id' => 1, 'stok_tanggal' => now(), 'stok_jumlah' => 15],
            ['barang_id' => 5, 'user_id' => 1, 'stok_tanggal' => now(), 'stok_jumlah' => 18],
            ['barang_id' => 6, 'user_id' => 1, 'stok_tanggal' => now(), 'stok_jumlah' => 40],
            ['barang_id' => 7, 'user_id' => 1, 'stok_tanggal' => now(), 'stok_jumlah' => 10],
            ['barang_id' => 8, 'user_id' => 1, 'stok_tanggal' => now(), 'stok_jumlah' => 35],
            ['barang_id' => 9, 'user_id' => 1, 'stok_tanggal' => now(), 'stok_jumlah' => 28],
            ['barang_id' => 10,'user_id' => 1, 'stok_tanggal' => now(), 'stok_jumlah' => 22],
            ['barang_id' => 11,'user_id' => 1, 'stok_tanggal' => now(), 'stok_jumlah' => 32],
            ['barang_id' => 12,'user_id' => 1, 'stok_tanggal' => now(), 'stok_jumlah' => 27],
            ['barang_id' => 13,'user_id' => 1, 'stok_tanggal' => now(), 'stok_jumlah' => 15],
            ['barang_id' => 14,'user_id' => 1, 'stok_tanggal' => now(), 'stok_jumlah' => 50],
            ['barang_id' => 15,'user_id' => 1, 'stok_tanggal' => now(), 'stok_jumlah' => 45],
        ];

        DB::table('t_stok')->insert($stokData);
    }
}