import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'home_controller.dart';

class HomeDrawerWidget extends StatelessWidget {
  const HomeDrawerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          const UserAccountsDrawerHeader(
            currentAccountPicture: CircleAvatar(),
            accountName: Text("Rick"),
            accountEmail: Text("Morty"),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: buildItems(),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildItems() {
    final controller = Get.find<HomeController>();
    return Obx(() {
      final items = controller.drawerItems;
      final drawerIndex = controller.drawerIndex.value;
      return Column(
        children: List.generate(
          items.length,
          (index) {
            final item = items[index];
            return ListTile(
              selected: index == drawerIndex,
              title: Text(item.title),
              onTap: () => controller.changeDrawerIndex(index),
            );
          },
        ),
      );
    });
  }
}
