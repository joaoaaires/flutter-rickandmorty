import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import '../../domain/entities/character.dart';
import 'character_list_controller.dart';
import 'character_list_item_widget.dart';

class CharacterListPage extends GetView<CharacterListController> {
  const CharacterListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //body: buildBody(),
      body: Container(),
    );
  }

  // Widget buildBody() {
  //   return PagedListView<int, Character>(
  //     padding: const EdgeInsets.all(13.0),
  //     pagingController: controller.pagingController,
  //     builderDelegate: PagedChildBuilderDelegate<Character>(
  //       itemBuilder: (context, item, index) => CharacterListItemWidget(
  //         character: item,
  //       ),
  //     ),
  //   );
  // }
}
