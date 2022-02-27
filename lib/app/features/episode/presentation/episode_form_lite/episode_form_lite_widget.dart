import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'episode_form_lite_controller.dart';

// ignore: must_be_immutable
class EpisodeFormLiteWidget extends StatelessWidget {
  EpisodeFormLiteWidget({
    Key? key,
    required int id,
  }) : super(key: key) {
    controller = EpisodeFormLiteController(
      episode: Get.find(),
      id: id,
    );
  }

  late EpisodeFormLiteController controller;

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
