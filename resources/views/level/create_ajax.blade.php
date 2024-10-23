<form action="{{ url('/level/ajax') }}" method="POST" id="form-tambah">
    @csrf
    <div id="modal-master" class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Tambah Data level</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
            </div>
            <div class="modal-body">
                <div class="form-group">
                    <label>Level Kode</label>
                    <input value="" type="text" name="level_kode" id="level_kode" class="form-control" required>
                    <small id="error-level_kode" class="error-text form-text text-danger"></small>
                </div>
                <div class="form-group">
                    <label>Nama Level</label>
                    <input value="" type="text" name="level_nama" id="level_nama" class="form-control" required>
                    <small id="error-level_nama" class="error-text form-text text-danger"></small>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" data-dismiss="modal" class="btn btn-warning">Batal</button>
                <button type="submit" class="btn btn-primary">Simpan</button>
            </div>
        </div>
    </div>
</form>
<script>
    // Menunggu dokumen siap di-load, lalu menjalankan kode di dalamnya
    $(document).ready(function() {
        // Memvalidasi form dengan id "form-tambah" menggunakan jQuery validate
        $("#form-tambah").validate({
            // Menetapkan aturan validasi untuk field level_kode dan level_nama
            rules: {
                level_kode: {
                    required: true,  // level_kode harus diisi
                    minlength: 3,    // level_kode minimal harus 3 karakter
                    maxlength: 20    // level_kode maksimal 20 karakter
                },
                level_nama: {
                    required: true,  // level_nama harus diisi
                    minlength: 3,    // level_nama minimal harus 3 karakter
                    maxlength: 100   // level_nama maksimal 100 karakter
                }
            },
            // Jika validasi berhasil, maka form akan dikirim menggunakan AJAX
            submitHandler: function(form) {
                $.ajax({
                    // Mengambil URL dari action form yang akan diproses
                    url: form.action,
                    // Mengambil metode HTTP yang digunakan (POST, GET, dsb.)
                    type: form.method,
                    // Mengirimkan data form dengan serialize untuk dikirim ke server
                    data: $(form).serialize(),
                    // Fungsi callback ketika AJAX sukses
                    success: function(response) {
                        // Jika status response dari server sukses
                        if (response.status) {
                            // Menyembunyikan modal setelah sukses
                            $('#myModal').modal('hide');
                            // Menampilkan notifikasi sukses dengan SweetAlert
                            Swal.fire({
                                icon: 'success',
                                title: 'Berhasil',
                                text: response.message
                            });
                            // Melakukan reload tabel data menggunakan dataLevel.ajax
                            dataLevel.ajax.reload();
                        } else {
                            // Jika gagal, hapus pesan error lama
                            $('.error-text').text('');
                            // Tampilkan pesan error pada input yang bermasalah
                            $.each(response.msgField, function(prefix, val) {
                                $('#error-' + prefix).text(val[0]);
                            });
                            // Menampilkan notifikasi kesalahan dengan SweetAlert
                            Swal.fire({
                                icon: 'error',
                                title: 'Terjadi Kesalahan',
                                text: response.message
                            });
                        }
                    }
                });
                return false; // Menghentikan pengiriman form secara tradisional
            },
            // Pengaturan elemen error, pesan error akan ditampilkan di dalam elemen span
            errorElement: 'span',
            // Menempatkan pesan error di dekat elemen form yang error
            errorPlacement: function(error, element) {
                error.addClass('invalid-feedback');  // Menambahkan class untuk styling error
                element.closest('.form-group').append(error);  // Menempatkan pesan error setelah elemen input
            },
            // Jika validasi gagal, tambahkan class 'is-invalid' ke elemen input
            highlight: function(element, errorClass, validClass) {
                $(element).addClass('is-invalid');
            },
            // Jika validasi sukses, hapus class 'is-invalid' dari elemen input
            unhighlight: function(element, errorClass, validClass) {
                $(element).removeClass('is-invalid');
            }
        });
    });
</script>
