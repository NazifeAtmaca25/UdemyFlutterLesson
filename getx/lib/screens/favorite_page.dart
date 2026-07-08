import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/controller/favorite_controller.dart';

// ignore: must_be_immutable
class FavoritePage extends StatelessWidget {
  FavoriteController favoriController;

  FavoritePage({super.key, required this.favoriController});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Favori Listesini ara")),
      body: Center(
        child: Column(
          children: [
            TextField(
              onChanged: (value) {
                favoriController.searchText.value = value;
              },
              decoration: InputDecoration(
                hintText: "Favori ürünleri ara",
                border: OutlineInputBorder(),
              ),
            ),
            Expanded(
              child: Obx(
                () => ListView.builder(
                  itemCount: favoriController.filterFavorite().length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(
                        favoriController.filterFavorite()[index].name,
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
