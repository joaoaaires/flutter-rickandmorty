import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'home_controller.dart';
import 'home_drawer_widget.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: controller.keyScaffold,
      appBar: buildAppBar(),
      drawer: const HomeDrawerWidget(),
      body: buildBody(),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      title: const Text("Rick and Morty"),
    );
  }

  Widget buildBody() {
    return Obx(() {
      final items = controller.drawerItems;
      final drawerIndex = controller.drawerIndex.value;

      return items[drawerIndex].loadPage();
    });
  }
}
