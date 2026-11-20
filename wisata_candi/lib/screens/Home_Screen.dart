import 'package:flutter/material.dart';
import 'package:wisata_candi/data/auth_service.dart';
import 'package:wisata_candi/data/wisata_candi.dart';
import 'package:wisata_candi/models/candi.dart';
import 'package:wisata_candi/screens/details_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  void _openDetail(Candi candi) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => DetailScreen(candi: candi),
      ),
    ).then((_) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Wisata Candi',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 850),
          child: GridView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 14,
              mainAxisSpacing: 14,
              mainAxisExtent: 345,
            ),
            itemCount: candiList.length,
            itemBuilder: (context, index) {
              final Candi candi = candiList[index];
              final bool isFav = AuthService.isFavorite(candi.name);

              return Card(
                margin: EdgeInsets.zero,
                elevation: 3,
                clipBehavior: Clip.antiAlias,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      children: [
                        GestureDetector(
                          onTap: () => _openDetail(candi),
                          child: Image.asset(
                            candi.imageAsset,
                            width: double.infinity,
                            height: 175,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) {
                              return Image.asset(
                                'assets/images/placeholder_image.png',
                                width: double.infinity,
                                height: 175,
                                fit: BoxFit.cover,
                              );
                            },
                          ),
                        ),
                        Positioned(
                          top: 8,
                          right: 8,
                          child: Material(
                            color: Colors.white.withOpacity(0.9),
                            shape: const CircleBorder(),
                            elevation: 2,
                            child: InkWell(
                              customBorder: const CircleBorder(),
                              onTap: () async {
                                AuthService.toggleFavorite(candi.name);
                                setState(() {});
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Icon(
                                  isFav
                                      ? Icons.favorite
                                      : Icons.favorite_border,
                                  color: isFav ? Colors.red : Colors.grey,
                                  size: 20,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Expanded(
                      child: InkWell(
                        onTap: () => _openDetail(candi),
                        child: Padding(
                          padding: const EdgeInsets.all(12),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                candi.name,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Row(
                                children: [
                                  const Icon(
                                    Icons.location_on,
                                    color: Colors.deepPurple,
                                    size: 15,
                                  ),
                                  const SizedBox(width: 4),
                                  Expanded(
                                    child: Text(
                                      candi.location,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        fontSize: 13,
                                        color: Colors.grey.shade700,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 8),
                              Text(
                                candi.description,
                                maxLines: 3,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  fontSize: 13,
                                  height: 1.35,
                                ),
                              ),
                              const Spacer(),
                              const Divider(height: 12),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: Text(
                                      'Dibangun: ${candi.built}',
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: const TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.deepPurple,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 8),
                                  Text(
                                    candi.type,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.grey.shade800,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
