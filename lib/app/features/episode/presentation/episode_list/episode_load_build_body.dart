import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import 'episode_list_controller.dart';
import 'episode_list_item_url_widget.dart';

Widget buildBody() {
  final controller = Get.find<EpisodeListController>();
  final episodeListIsUrl = controller.episodeListIsUrl;

  return PagedListView<int, dynamic>(
    padding: const EdgeInsets.all(13.0),
    pagingController: controller.pagingController,
    builderDelegate: episodeListIsUrl
        ? getPagedChildBuilderDelegateString()
        : getPagedChildBuilderDelegateEpisode(),
  );
}

PagedChildBuilderDelegate getPagedChildBuilderDelegateString() {
  return PagedChildBuilderDelegate(
    itemBuilder: (context, item, index) => EpisodeListItemUrlWidget(
      url: "$item",
    ),
  );
}

PagedChildBuilderDelegate getPagedChildBuilderDelegateEpisode() {
  return PagedChildBuilderDelegate(
    itemBuilder: (context, item, index) => Text("$item"),
  );
}
