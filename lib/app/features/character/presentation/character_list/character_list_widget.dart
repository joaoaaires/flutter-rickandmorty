import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import '../../domain/entities/character.dart';
import 'character_list_controller.dart';
import 'character_list_item_widget.dart';

class CharacterListWidget extends GetWidget<CharacterListController> {
  final PagingController<int, Character> pagingController;

  CharacterListWidget({Key? key})
      : pagingController = PagingController<int, Character>(
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
    return PagedListView<int, Character>(
      padding: const EdgeInsets.all(13.0),
      pagingController: pagingController,
      builderDelegate: PagedChildBuilderDelegate<Character>(
        itemBuilder: (context, item, index) => CharacterListItemWidget(
          character: item,
        ),
      ),
    );
  }
}
