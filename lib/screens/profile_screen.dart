import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_firebase/controllers/profile_controller.dart';
import '../Service/Auth.dart';
import 'editprofile_screen.dart';

class ProfileFireBase extends StatelessWidget {
  final ProfileControllerFB controller = Get.find();
  final AuthService _authService = AuthService();

  @override
  Widget build(BuildContext context) {
    controller.fetchProfile();

    return Scaffold(
      appBar: AppBar(
        title: Text('ProfileFireBase'),
        backgroundColor: Color(0xFFB2D3C2),
        automaticallyImplyLeading: false,
      ),
      body: Container(
        color: Color(0xFFF5F5DC),
        child: ListView(
          padding: EdgeInsets.all(20),
          children: [
            CircleAvatar(
              radius: 60,
              backgroundColor: Color(0xFFB2D3C2),
              child: ClipOval(
                child: Image.network(
                  'https://lh3.googleusercontent.com/a/ACg8ocJPlHdLVFmob1OsaReHyUavuO5_KgYEDm3a7WoFcarrCTfRKg=s96-c',
                  width: 120, // Sesuaikan lebar gambar sesuai kebutuhan
                  height: 120, // Sesuaikan tinggi gambar sesuai kebutuhan
                  fit: BoxFit
                      .cover, // Sesuaikan bagaimana gambar akan diisi dalam avatar
                ),
              ),
            ),
            SizedBox(height: 20),
            Card(
              elevation: 8,
              color: Color(0xFFE8F5E9),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  children: [
                    ListTile(
                      leading: Icon(Icons.person, color: Color(0xFFB2D3C2)),
                      title: Text(
                        'Nama Lengkap',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFFB2D3C2),
                        ),
                      ),
                      subtitle: Obx(() => Text(
                            controller.name.value,
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.black87,
                            ),
                          )),
                    ),
                    Divider(),
                    ListTile(
                      leading: Icon(Icons.email, color: Color(0xFFB2D3C2)),
                      title: Text(
                        'Email',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFFB2D3C2),
                        ),
                      ),
                      subtitle: Obx(() => Text(
                            controller.email.value,
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.black87,
                            ),
                          )),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 30),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  Get.to(() => EditProfilePage());
                },
                child: Text(
                  'Edit Profil',
                  style: TextStyle(fontSize: 18),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFFB2D3C2),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
        SizedBox(
          width: double.infinity,
          height: 50,
          child: ElevatedButton.icon(
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    backgroundColor: Color(0xFFF9F9F9), // Warna lembut untuk latar belakang
                    title: Row(
                      children: [
                        Icon(Icons.logout, color: Color(0xFFD9534F)),
                        SizedBox(width: 10),
                        Text(
                          'Logout?',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF333333), // Warna gelap untuk teks
                          ),
                        ),
                      ],
                    ),
                    content: Text(
                      'Apakah Anda yakin ingin logout? Semua sesi akan diakhiri.',
                      style: TextStyle(
                        fontSize: 16,
                        color: Color(0xFF666666), // Warna abu-abu elegan
                      ),
                    ),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop(); // Tutup dialog
                        },
                        child: Text(
                          'BATAL',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF5A9BD5), // Warna biru pastel
                          ),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop(); // Tutup dialog
                          _authService.signOut(); // Logout
                        },
                        child: Text(
                          'LOGOUT',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFFD9534F), // Warna merah lembut untuk tombol logout
                          ),
                        ),
                      ),
                    ],
                  );
                },
              );
            },
            icon: Icon(Icons.logout),
            label: Text(
              'Logout',
              style: TextStyle(fontSize: 18),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        )
        ],
        ),
      ),
    );
  }
}
