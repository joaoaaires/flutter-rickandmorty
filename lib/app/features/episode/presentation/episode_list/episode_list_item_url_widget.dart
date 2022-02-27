import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'episode_list_item_url_controller.dart';

// ignore: must_be_immutable
class EpisodeListItemUrlWidget extends StatelessWidget {
  EpisodeListItemUrlWidget({
    Key? key,
    required String url,
  }) : super(key: key) {
    controller = EpisodeListItemUrlController(
      episode: Get.find(),
      url: url,
    );
  }

  late EpisodeListItemUrlController controller;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Obx(() {
        final error = controller.error.value;
        final loading = controller.loading.value;
        final episode = controller.episode;

        if (loading) {
          return const Center(
            child: Padding(
              padding: EdgeInsets.all(10),
              child: CircularProgressIndicator(),
            ),
          );
        }

        if (episode == null) {
          return const ListTile(
            title: Text("Episode not found."),
          );
        }

        return ListTile(
          title: Text(episode.name ?? ""),
          subtitle: Text(episode.episode ?? ""),
        );
      }),
    );
  }
}
