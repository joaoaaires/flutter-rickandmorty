import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import '../../domain/entities/episode.dart';
import 'episode_list_controller.dart';

class EpisodeListWidget extends GetWidget<EpisodeListController> {
  final PagingController<int, Episode> pagingController;

  EpisodeListWidget({Key? key})
      : pagingController = PagingController<int, Episode>(
          firstPageKey: 0,
        ),
        super(key: key) {
    pagingController.addPageRequestListener(
      (pageKey) => controller.updateEpisode(
        pageKey,
        pagingController,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return PagedListView<int, Episode>(
      padding: const EdgeInsets.all(13.0),
      pagingController: pagingController,
      builderDelegate: PagedChildBuilderDelegate<Episode>(
        itemBuilder: (context, item, index) => itemBuild(item),
      ),
    );
  }

  Widget itemBuild(Episode episode) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: ListTile(
        title: Text(episode.name ?? ""),
        subtitle: Text(
          (episode.episode ?? "") + " - " + (episode.airDate ?? ""),
        ),
      ),
    );
  }
}
