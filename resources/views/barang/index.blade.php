@extends('layouts.template')

@section('content')
    <div class="card">
        <div class="card-header">
            <h3 class="card-title">Daftar Barang</h3>
            <div class="card-tools">
                <button onclick="modalAction(`{{ url('/barang/import') }}`)" class="btn btn-info btn-sm">Import Barang</button>
                <a href="{{ url('/barang/export_excel') }}" class="btn btn-primary"><i class="fa fa-file-excel"></i> Export Barang</a>
                <a href="{{ url('/barang/export_pdf') }}" class="btn btn-warning"><i class="fa fa-filepdf"></i> Export Barang (pdf)</a>
                <button onclick="modalAction('{{ url('/barang/create_ajax') }}')" class="btn btn-success btn-sm">Tambah Ajax</button>
            </div>
        </div>
        <div class="card-body">
            <!-- Filter Data -->
            <div id="filter" class="form-horizontal p-2 mb-2 border-bottom">
                <div class="row">
                    <div class="col-md-12">
                        <div class="form-group row">
                            <label for="filter_kategori" class="col-md-1 col-form-label">Filter</label>
                            <div class="col-md-3">
                                <select name="filter_kategori" class="form-control form-control-sm filter_kategori">
                                    <option value="">- Semua -</option>
                                    @foreach ($kategori as $l)
                                        <option value="{{ $l->kategori_id }}">{{ $l->kategori_nama }}</option>
                                    @endforeach
                                </select>
                                <small class="form-text text-muted">Kategori Barang</small>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Pesan sukses/gagal -->
            @if (session('success'))
                <div class="alert alert-success">{{ session('success') }}</div>
            @endif
            @if (session('error'))
                <div class="alert alert-danger">{{ session('error') }}</div>
            @endif

            <!-- Tabel Barang -->
            <table class="table table-bordered table-sm table-striped table-hover" id="table-barang">
                <thead>
                    <tr>
                        <th>No</th>
                        <th>Kode Barang</th>
                        <th>Harga Beli</th>
                        <th>Harga Jual</th>
                        <th>Kategori</th>
                        <th>Aksi</th>
                    </tr>
                </thead>
                <tbody></tbody>
            </table>
        </div>
    </div>

    <!-- Modal -->
    <div id="myModal" class="modal fade" tabindex="-1" data-backdrop="static" data-keyboard="false" data-width="75%">
    </div>
@endsection

@push('js')
    <script>
        function modalAction(url = '') {
            $('#myModal').load(url, function() {
                $('#myModal').modal('show');
            });
        }

        var tableBarang;
        $(document).ready(function() {
            tableBarang = $('#table-barang').DataTable({
                processing: true,
                serverSide: true,
                ajax: {
                    url: "{{ url('barang/list') }}",
                    type: "POST",
                    data: function(d) {
                        d.filter_kategori = $('.filter_kategori').val();
                    }
                },
                columns: [
                    { data: "DT_RowIndex", className: "text-center", orderable: false, searchable: false },
                    { data: "barang_kode", className: "", orderable: true, searchable: true },
                    { data: "harga_beli", className: "", render: function(data) {
                            return new Intl.NumberFormat('id-ID').format(data);
                        }
                    },
                    { data: "harga_jual", className: "", render: function(data) {
                            return new Intl.NumberFormat('id-ID').format(data);
                        }
                    },
                    { data: "kategori.kategori_nama", className: "" },
                    { data: "aksi", className: "text-center", orderable: false, searchable: false }
                ]
            });

            $('#table-barang_filter input').unbind().bind('keyup', function(e) {
                if (e.keyCode == 13) { // tekan enter
                    tableBarang.search(this.value).draw();
                }
            });

            $('.filter_kategori').change(function() {
                tableBarang.draw();
            });
        });
    </script>
@endpush
