import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import '../character_item/character_item_load_widget.dart';
import 'character_list_controller.dart';

class CharacterListPage extends GetView<CharacterListController> {
  final PagingController<int, String> pagingController;

  CharacterListPage({Key? key})
      : pagingController = PagingController<int, String>(
          firstPageKey: 0,
        ),
        super(key: key) {
    pagingController.addPageRequestListener(
      (pageKey) => controller.updateCharacterUrl(
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
        itemBuilder: (context, item, index) => CharacterItemLoadWidget(
          url: item,
        ),
      ),
    );
  }
}
