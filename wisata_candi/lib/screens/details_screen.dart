import 'package:flutter/material.dart';
import 'package:wisata_candi/models/candi.dart';

class DetailScreen extends StatelessWidget {
  // 1. Deklarasikan variabel candi sebagai properti class
  final Candi candi;

  // 2. Gunakan satu constructor yang valid dan arahkan ke variabel di atas
  const DetailScreen({super.key, required this.candi});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: ClipRRect(
              // 3. Ubah BorderRadiusGeometry menjadi BorderRadius
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(
                // 4. Pastikan imageAsset adalah properti string (bukan method fungsi)
                candi.imageAsset, 
                width: double.infinity,
                height: 300,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
