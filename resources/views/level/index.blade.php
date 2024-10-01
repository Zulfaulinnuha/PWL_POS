@extends('layouts.template')

@section('content')
<div class="card card-outline card-primary">
    <div class="card-header">
        <h3 class="card-title">{{ $page->title }}</h3>

        <div class="card-tools">
            <a class="btn btn-sm btn-primary mt-1" href="{{ url('level/create') }}">Tambah</a>
        </div>
    </div>

    <div class="card-body">
    @if (session('success'))
    <div class="alert alert-success">{{ session('success') }}</div>
    @endif
    @if (session('error'))
        <div class="alert alert-danger">{{ session('error') }}</div>
    @endif
    <table class="table table-bordered table-striped table-hover table-sm" id="table_level">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Kode</th>
                    <th>Nama</th>
                    <th>Aksi</th>
                </tr>
            </thead>
        </table>
    </div>
</div>
@endsection

@push('css')
@endpush

@push('js')
<script>
$(document).ready(function() {
    var dataLevel = $('#table_level').DataTable({
        // serverside: true, jika ingin menggunakan server side processing
        serverSide: true,
        ajax: {
            "url": "{{ url('level/list') }}",
            "type": "POST",
            "dataType": "json",
        },
        columns: [
           {
            // nomor urut dari laravel datatable addIndexColumn()
        
            data: "DT_RowIndex",
            className: "text-center",
            orderable: false,
            searchable: false
        }, {
            data: "level_kode",
            className: "",
            // orderable: true, jika ingin kolom ini bisa diurutkan
            orderable: true,
            // searchable: true, jika ingin kolom ini bisa dicari
            searchable: true
        }, {
            data: "level_nama",
            className: "",
            orderable: true,
            searchable: true
        }, {
            data: "aksi",
            className: "",
            orderable: false,
            searchable: false
        }
        ]
    });
    
});
</script>
@endpush