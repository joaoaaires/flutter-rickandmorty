import 'package:flutter/material.dart';
import 'package:flutterrickandmorty/app/features/character/domain/entities/character.dart';
import 'package:flutterrickandmorty/app/features/home/home_item_widget.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import 'home_controller.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: buildBody(),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      title: const Text("Rick and Morty"),
    );
  }

  Widget buildBody() {
    return PagedListView<int, Character>(
      padding: const EdgeInsets.all(13.0),
      pagingController: controller.pagingController,
      builderDelegate: PagedChildBuilderDelegate<Character>(
        itemBuilder: (context, item, index) => HomeItemWidget(
          character: item,
        ),
      ),
    );
  }
}
