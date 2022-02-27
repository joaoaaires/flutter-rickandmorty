import 'package:get/get.dart';

import '../../../../routes/app_routes.dart';
import '../../domain/entities/character.dart';

class CharacterFormController extends GetxController {
  late Character character;

  @override
  void onInit() {
    super.onInit();
    final args = Get.arguments;
    character = args;
  }

  void toEpisodeList() {
    final episode = character.episode;
    Get.toNamed(
      AppRoutes.episodeList,
      arguments: episode,
    );
  }
}
