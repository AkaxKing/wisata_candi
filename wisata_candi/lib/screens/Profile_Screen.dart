import 'package:flutter/material.dart';
import 'package:wisata_candi/data/auth_service.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final name = AuthService.currentName;
    final username = AuthService.currentUsername ?? '-';

    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: const Text(
          'Profil Pengguna',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.deepPurple,
        elevation: 0,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 500),
            child: Column(
              children: [
                // Header melengkung dengan Avatar
                Stack(
                  clipBehavior: Clip.none,
                  alignment: Alignment.center,
                  children: [
                    Container(
                      height: 110,
                      width: double.infinity,
                      decoration: const BoxDecoration(
                        color: Colors.deepPurple,
                        borderRadius: BorderRadius.vertical(
                          bottom: Radius.circular(32),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 50,
                      child: Container(
                        padding: const EdgeInsets.all(4),
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black12,
                              blurRadius: 10,
                              offset: Offset(0, 4),
                            ),
                          ],
                        ),
                        child: CircleAvatar(
                          radius: 52,
                          backgroundColor: Colors.deepPurple.shade50,
                          child: const Icon(
                            Icons.person,
                            size: 56,
                            color: Colors.deepPurple,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 65),

                // Nama dan Username Utama
                Text(
                  name.isNotEmpty ? name : 'Pengguna',
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  '@$username',
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.grey[600],
                  ),
                ),
                const SizedBox(height: 24),

                // Kartu Detail Informasi Akun
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Card(
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Column(
                      children: [
                        ListTile(
                          leading: const Icon(Icons.badge, color: Colors.deepPurple),
                          title: const Text(
                            'Nama Lengkap',
                            style: TextStyle(fontSize: 12, color: Colors.grey),
                          ),
                          subtitle: Text(
                            name.isNotEmpty ? name : '-',
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Colors.black87,
                            ),
                          ),
                        ),
                        const Divider(height: 1, indent: 16, endIndent: 16),
                        ListTile(
                          leading: const Icon(Icons.alternate_email, color: Colors.amber),
                          title: const Text(
                            'Username',
                            style: TextStyle(fontSize: 12, color: Colors.grey),
                          ),
                          subtitle: Text(
                            username,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Colors.black87,
                            ),
                          ),
                        ),
                        const Divider(height: 1, indent: 16, endIndent: 16),
                        const ListTile(
                          leading: Icon(Icons.verified_user, color: Colors.green),
                          title: Text(
                            'Status Akun',
                            style: TextStyle(fontSize: 12, color: Colors.grey),
                          ),
                          subtitle: Text(
                            'Aktif',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Colors.green,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 28),

                // Tombol Sign Out
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: SizedBox(
                    width: double.infinity,
                    height: 48,
                    child: OutlinedButton.icon(
                      icon: const Icon(Icons.logout, color: Colors.red),
                      label: const Text(
                        'Sign Out',
                        style: TextStyle(
                          color: Colors.red,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      style: OutlinedButton.styleFrom(
                        side: const BorderSide(color: Colors.red),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      onPressed: () {
                        AuthService.signOut();
                        Navigator.pushNamedAndRemoveUntil(
                          context,
                          '/signin',
                          (route) => false,
                        );
                      },
                    ),
                  ),
                ),
                const SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
