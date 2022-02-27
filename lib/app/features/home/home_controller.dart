import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../character/presentation/character_list/character_list_bindings.dart';
import '../character/presentation/character_list/character_list_page.dart';

class HomeController extends GetxController {
  final drawerIndex = 0.obs;

  late List<DrawerItem> drawerItems;
  late GlobalKey<ScaffoldState> keyScaffold;

  @override
  void onInit() {
    super.onInit();
    keyScaffold = GlobalKey<ScaffoldState>();
    drawerItems = [
      DrawerItem(
        title: "Character",
        loadPage: () {
          CharacterListBindings().dependencies();
          return const CharacterListPage();
        },
      ),
      DrawerItem(
        title: "Location",
        loadPage: () => Container(),
      ),
      DrawerItem(
        title: "Episode",
        loadPage: () => Container(),
      ),
    ];
  }

  void changeDrawerIndex(int index) {
    keyScaffold.currentState?.openEndDrawer();
    drawerIndex.value = index;
  } 
}

class DrawerItem {
  final String title;
  final Widget Function() loadPage;

  DrawerItem({
    required this.title,
    required this.loadPage,
  });
}
