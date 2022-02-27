import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skeleton_loader/skeleton_loader.dart';

import 'location_item_controller.dart';

class LocationItemWidget extends StatelessWidget {
  final bool showCard;
  final LocationItemController controller;

  LocationItemWidget({
    Key? key,
    this.showCard = true,
    required String url,
  })  : controller = LocationItemController(
          url: url,
          location: Get.find(),
        ),
        super(key: key) {
    controller.updateItem();
  }

  @override
  Widget build(BuildContext context) {
    if (showCard) {
      return Card(
        child: buildBody(),
      );
    } else {
      return buildBody();
    }
  }

  Widget buildBody() {
    return Obx(() {
      final location = controller.location;
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
        title: Text(location?.name ?? ""),
        subtitle: Text(
          (location?.type ?? "") + " - " + (location?.dimension ?? ""),
        ),
      );
    });
  }
}
