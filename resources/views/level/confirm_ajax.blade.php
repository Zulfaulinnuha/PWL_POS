@empty($level)
    <!-- Jika variabel $level kosong, tampilkan modal error -->
    <div id="modal-master" class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <!-- Judul modal untuk menampilkan kesalahan -->
                <h5 class="modal-title" id="exampleModalLabel">Kesalahan</h5>
                <!-- Tombol untuk menutup modal -->
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <!-- Pesan kesalahan jika data tidak ditemukan -->
                <div class="alert alert-danger">
                    <h5><i class="icon fas fa-ban"></i> Kesalahan!!!</h5>
                    Data yang anda cari tidak ditemukan
                </div>
                <!-- Tombol untuk kembali ke halaman level -->
                <a href="{{ url('/level') }}" class="btn btn-warning">Kembali</a>
            </div>
        </div>
    </div>
@else
    <!-- Jika variabel $level tidak kosong, tampilkan form konfirmasi hapus -->
    <form action="{{ url('/level/' . $level->level_id . '/delete_ajax') }}" method="POST" id="form-delete">
        @csrf
        @method('DELETE')
        <div id="modal-master" class="modal-dialog modal-lg" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <!-- Judul modal untuk konfirmasi penghapusan data level -->
                    <h5 class="modal-title" id="exampleModalLabel">Hapus Data Level</h5>
                    <!-- Tombol untuk menutup modal -->
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <!-- Pesan konfirmasi untuk penghapusan data -->
                    <div class="alert alert-warning">
                        <h5><i class="icon fas fa-ban"></i> Konfirmasi !!!</h5>
                        Apakah Anda ingin menghapus data seperti di bawah ini?
                    </div>
                    <!-- Tabel yang menampilkan data level yang akan dihapus -->
                    <table class="table table-sm table-bordered table-striped">
                        <tr>
                            <!-- Kode level yang akan dihapus -->
                            <th class="text-right col-3">Level Kode :</th>
                            <td class="col-9">{{ $level->level_kode }}</td>
                        </tr>
                        <tr>
                            <!-- Nama level yang akan dihapus -->
                            <th class="text-right col-3">Nama Level :</th>
                            <td class="col-9">{{ $level->level_nama }}</td>
                        </tr>
                    </table>
                </div>
                <div class="modal-footer">
                    <!-- Tombol untuk membatalkan penghapusan -->
                    <button type="button" data-dismiss="modal" class="btn btn-warning">Batal</button>
                    <!-- Tombol untuk menyetujui penghapusan data -->
                    <button type="submit" class="btn btn-primary">Ya, Hapus</button>
                </div>
            </div>
        </div>
    </form>

    <!-- Script jQuery untuk validasi form dan mengirimkan request AJAX -->
    <script>
        $(document).ready(function() {
            // Validasi form penghapusan menggunakan jQuery validate
            $("#form-delete").validate({
                rules: {},
                // Jika validasi berhasil, submit form secara AJAX
                submitHandler: function(form) {
                    $.ajax({
                        // URL dan metode pengiriman form
                        url: form.action,
                        type: form.method,
                        // Data dari form yang dikirimkan
                        data: $(form).serialize(),
                        // Fungsi callback jika request berhasil
                        success: function(response) {
                            if (response.status) {
                                // Jika penghapusan berhasil, tutup modal dan tampilkan pesan sukses
                                $('#myModal').modal('hide');
                                Swal.fire({
                                    icon: 'success',
                                    title: 'Berhasil',
                                    text: response.message
                                });
                                // Reload tabel data setelah penghapusan berhasil
                                dataLevel.ajax.reload();
                            } else {
                                // Jika terjadi kesalahan, tampilkan pesan error di bidang form yang bermasalah
                                $('.error-text').text('');
                                $.each(response.msgField, function(prefix, val) {
                                    $('#error-' + prefix).text(val[0]);
                                });
                                // Tampilkan notifikasi kesalahan menggunakan SweetAlert
                                Swal.fire({
                                    icon: 'error',
                                    title: 'Terjadi Kesalahan',
                                    text: response.message
                                });
                            }
                        }
                    });
                    return false;
                },
                // Pengaturan penampilan pesan error di form
                errorElement: 'span',
                errorPlacement: function(error, element) {
                    error.addClass('invalid-feedback');
                    element.closest('.form-group').append(error);
                },
                // Jika input error, tambahkan class is-invalid
                highlight: function(element, errorClass, validClass) {
                    $(element).addClass('is-invalid');
                },
                // Jika input sudah benar, hapus class is-invalid
                unhighlight: function(element, errorClass, validClass) {
                    $(element).removeClass('is-invalid');
                }
            });
        });
    </script>
@endempty
