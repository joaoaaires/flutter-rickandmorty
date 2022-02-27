import 'package:get/get.dart';

import '../character/presentation/character_list/character_list_bindings.dart';
import 'home_controller.dart';

class HomeBindings extends Bindings {
  @override
  void dependencies() {
    //!Controller
    Get.put(
      HomeController(),
    );
  }
}
