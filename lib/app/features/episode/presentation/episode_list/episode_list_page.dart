import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'episode_load_build_body.dart';
import 'episode_list_controller.dart';

class EpisodeListPage extends GetView<EpisodeListController> {
  const EpisodeListPage({Key? key}) : super(key: key);

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

}
