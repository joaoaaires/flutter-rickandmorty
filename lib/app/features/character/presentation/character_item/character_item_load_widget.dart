import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skeleton_loader/skeleton_loader.dart';

import 'character_item_controller.dart';

class CharacterItemLoadWidget extends StatelessWidget {
  final CharacterItemController controller;

  CharacterItemLoadWidget({Key? key, required String url})
      : controller = CharacterItemController(
          character: Get.find(),
          url: url,
        ),
        super(key: key) {
    controller.updateItem();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Obx(() {
        final character = controller.character;
        final loading = controller.loading.value;

        if (loading) {
          return SkeletonLoader(
            builder: ListTile(
              title: Container(
                width: double.infinity,
                height: 10,
                color: Colors.white,
              ),
              subtitle: Container(
                width: double.infinity,
                height: 10,
                color: Colors.white,
              ),
            ),
          );
        }

        return ListTile(
          title: Text(character?.name ?? ""),
          subtitle: Text(
            (character?.status ?? "") + " - " + (character?.gender ?? ""),
          ),
        );
      }),
    );
  }
}
