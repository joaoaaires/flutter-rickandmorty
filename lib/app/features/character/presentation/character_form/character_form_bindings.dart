import 'package:get/get.dart';

import '../../../location/presentation/location_item/location_item_bindings.dart';
import 'character_form_controller.dart';

class CharacterFormBindings extends Bindings {
  @override
  void dependencies() {
    //! Bindings
    LocationItemBindings().dependencies();

    //! Controller
    Get.put(CharacterFormController());
  }
}
