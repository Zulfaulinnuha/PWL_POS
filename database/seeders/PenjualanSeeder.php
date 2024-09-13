<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class PenjualanSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $penjualanData = [
            ['user_id' => 1, 'pembeli' => 'Zulfa', 'penjualan_kode' => 'PJ12345', 'penjualan_tanggal' => now()],
            ['user_id' => 1, 'pembeli' => 'Arzy', 'penjualan_kode' => 'PJ12346', 'penjualan_tanggal' => now()],
            ['user_id' => 1, 'pembeli' => 'Ulin', 'penjualan_kode' => 'PJ12347', 'penjualan_tanggal' => now()],
            ['user_id' => 1, 'pembeli' => 'Nuha', 'penjualan_kode' => 'PJ12348', 'penjualan_tanggal' => now()],
            ['user_id' => 1, 'pembeli' => 'Iqbal', 'penjualan_kode' => 'PJ12349', 'penjualan_tanggal' => now()],
            ['user_id' => 1, 'pembeli' => 'Rahmat', 'penjualan_kode' => 'PJ12350', 'penjualan_tanggal' => now()],
            ['user_id' => 1, 'pembeli' => 'Sari', 'penjualan_kode' => 'PJ12351', 'penjualan_tanggal' => now()],
            ['user_id' => 1, 'pembeli' => 'Bunga', 'penjualan_kode' => 'PJ12352', 'penjualan_tanggal' => now()],
            ['user_id' => 1, 'pembeli' => 'Marni', 'penjualan_kode' => 'PJ12353', 'penjualan_tanggal' => now()],
            ['user_id' => 1, 'pembeli' => 'Fia', 'penjualan_kode' => 'PJ12354', 'penjualan_tanggal' => now()],
        ];

        DB::table('t_penjualan')->insert($penjualanData);
    }
}