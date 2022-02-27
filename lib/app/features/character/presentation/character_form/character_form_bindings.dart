import 'package:flutterrickandmorty/app/features/episode/presentation/episode_form_lite/episode_form_lite_bindings.dart';
import 'package:get/get.dart';

import 'character_form_controller.dart';

class CharacterFormBindings extends Bindings {
  @override
  void dependencies() {
    //! Controller
    Get.put(CharacterFormController());
  }
}
