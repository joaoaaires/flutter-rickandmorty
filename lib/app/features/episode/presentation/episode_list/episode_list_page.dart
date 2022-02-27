import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import '../episode_item/episode_item_widget.dart';
import 'episode_list_controller.dart';

class EpisodeListPage extends GetView<EpisodeListController> {
  final PagingController<int, String> pagingController;

  EpisodeListPage({Key? key})
      : pagingController = PagingController<int, String>(
          firstPageKey: 0,
        ),
        super(key: key) {
    pagingController.addPageRequestListener(
      (pageKey) => controller.updateEpisodeUrl(
        pageKey,
        pagingController,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: buildBody(),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      title: const Text("Episodes"),
    );
  }

  Widget buildBody() {
    return PagedListView<int, String>(
      padding: const EdgeInsets.all(13.0),
      pagingController: pagingController,
      builderDelegate: PagedChildBuilderDelegate<String>(
        itemBuilder: (context, item, index) => EpisodeItemWidget(
          url: item,
        ),
      ),
    );
  }
}
