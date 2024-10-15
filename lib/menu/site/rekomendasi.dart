import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';
import 'package:tugas2_putri/menu/favorite/controllers/favorite_controller.dart';
import 'package:tugas2_putri/menu/site/sitemodel.dart';

class SitusPage extends StatelessWidget {
  final FavoriteController favoriteController = Get.find();

  SitusPage({super.key}) {
    // Initialize the favorites list with the same length as rekomendasiList
    favoriteController.initializeFavorites(rekomendasiList.length);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFBF8F4),
      appBar: AppBar(
        backgroundColor: const Color(0xFFFBF8F4),
        centerTitle: true,
        title: const Text('Situs Rekomendasi'),
      ),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, childAspectRatio: 0.7),
        itemCount: rekomendasiList.length,
        itemBuilder: (context, index) {
          SitusRekomendasi wisata = rekomendasiList[index];
          return Card(
            child: Container(
              decoration: const BoxDecoration(
                  color: Color(0xff583e12),
                  borderRadius: BorderRadius.all(Radius.circular(12))),
              child: Column(
                children: [
                  SizedBox(
                      height: 125,
                      width: double.infinity,
                      child: Image(
                        image: AssetImage(wisata.assetImages),
                        fit: BoxFit.cover,
                      )),
                  Text(
                    wisata.name,
                    style:
                        const TextStyle(color: Color(0xffFBF8F4), fontSize: 20),
                  ),
                  SizedBox(
                    height: 80,
                    child: Text(
                      wisata.alamat,
                      style: const TextStyle(
                          color: Color(0xffFBF8F4), fontSize: 12),
                    ),
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 50,
                        child: Obx(() {
                          return IconButton(
                            onPressed: () {
                              favoriteController.toggleFavorite(index);
                            },
                            icon: favoriteController.isFavorited(index)
                                ? const Icon(
                                    Icons.favorite,
                                    color: Colors.red,
                                  )
                                : const Icon(
                                    Icons.favorite_border_outlined,
                                  ),
                            color: Colors.white,
                          );
                        }),
                      ),
                      SizedBox(
                        width: 135,
                        child: ElevatedButton(
                            onPressed: () {},
                            style: ButtonStyle(
                              // ignore: deprecated_member_use
                              shape: MaterialStatePropertyAll(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                              backgroundColor: const WidgetStatePropertyAll(
                                  Color(0xff774C18)),
                              foregroundColor: const WidgetStatePropertyAll(
                                  Color(0xffFBF8F4)),
                            ),
                            child: const Text('Google Maps')),
                      ),
                    ],
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
