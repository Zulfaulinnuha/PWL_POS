<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="csrf-token" content="{{ csrf_token() }}">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet"> <!-- Menambahkan font Poppins -->
    <title>TOSERBA</title>
    <style>
        body {
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            background-color: #f8f9fa;
            font-family: 'Poppins', sans-serif; /* Menggunakan font Poppins untuk seluruh body */
        }
        .header {
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            display: flex;
            align-items: center;
            justify-content: space-between;
            padding: 5px 20px;
            background-color: #dfdfdf;
            z-index: 1; /* Pastikan header berada di atas gambar */
        }
        .logo {
            width: 100vw; /* Memperbesar gambar untuk menutupi seluruh background */
            height: 100vh;
            object-fit: cover; /* Membuat gambar menutupi area dengan proporsi yang sesuai */
            opacity: 0.7;
        }
        .store-name {
            font-size: 1.5rem;
            font-weight: bold;
            color: #205989;
        }
        .login-link {
            color: #205989;
            text-decoration: none;
            font-weight: bold;
            font-size: 1.2rem;
            padding: 5px 10px;
            border-radius: 5px;
            transition: background-color 0.3s;
        }
        .login-link:hover {
            text-decoration: underline;
            background-color: rgba(32, 89, 137, 0.1);
        }
        .main-content {
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-47%, -47%);
            z-index: 0; /* Agar tetap di belakang header */
        }
    </style>
</head>

<body>
    <div class="header">
        <div class="d-flex align-items-center">
            <div class="store-name">TOSERBA</div> <!-- Nama Toko -->
        </div>
        <div class="login-button">
            <a href="{{ url('/login') }}" class="login-link">Login</a> <!-- Teks link login -->
        </div>
    </div>
    
    <div class="main-content">
        <img src="{{ asset('asset/tampilanawal.png') }}" alt="Tampilan" class="tampilan">
    </div>

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
