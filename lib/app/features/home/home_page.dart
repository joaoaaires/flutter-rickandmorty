import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../character/presentation/character_list/character_list_page.dart';
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
    return CharacterListPage();
  }
}
