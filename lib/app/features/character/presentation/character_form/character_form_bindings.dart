import 'package:get/get.dart';

import 'character_form_controller.dart';

class CharacterFormBindings extends Bindings {
  @override
  void dependencies() {
    //! Controller
    Get.put(CharacterFormController());
  }
}
