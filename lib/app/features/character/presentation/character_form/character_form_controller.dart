import 'package:get/get.dart';

import '../../domain/entities/character.dart';

class CharacterFormController extends GetxController {
  late Character character;

  @override
  void onInit() {
    super.onInit();
    final args = Get.arguments;
    character = args;
  }
}
