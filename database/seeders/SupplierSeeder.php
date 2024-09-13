<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

use Illuminate\Support\Facades\DB;
use Illuminate\Support\Carbon;

class SupplierSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $data = [
            [
                'supplier_id' => 1,
                'supplier_kode' => 001,
                'supplier_nama' => 'Supplier 1',
                'supplier_alamat' => 'Jl. Widuri No.14',
                'created_at' => Carbon::now(),
                'updated_at' => Carbon::now(),
            ],
            [
                'supplier_id' => 2,
                'supplier_kode' => 002,
                'supplier_nama' => 'Supplier 2',
                'supplier_alamat' => 'Jl. Pacar No.18',
                'created_at' => Carbon::now(),
                'updated_at' => Carbon::now(),
            ],
            [
                'supplier_id' => 3,
                'supplier_kode' => 003,
                'supplier_nama' => 'Supplier 3',
                'supplier_alamat' => 'Jl. Kembang No.29',
                'created_at' => Carbon::now(),
                'updated_at' => Carbon::now(),
            ],
        ];

        DB::table('m_supplier')->insert($data);
    }
}