import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skeleton_loader/skeleton_loader.dart';

import 'episode_item_controller.dart';

class EpisodeItemWidget extends StatelessWidget {
  final EpisodeItemController controller;

  EpisodeItemWidget({Key? key, required String url})
      : controller = EpisodeItemController(
          episode: Get.find(),
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
        final episode = controller.episode;
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
          title: Text(episode?.name ?? ""),
          subtitle: Text(
            (episode?.episode ?? "") + " - " + (episode?.airDate ?? ""),
          ),
        );
      }),
    );
  }
}
