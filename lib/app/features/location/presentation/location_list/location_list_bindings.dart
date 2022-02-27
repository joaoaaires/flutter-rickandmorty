import 'package:flutterrickandmorty/app/features/location/presentation/location_list/location_list_controller.dart';
import 'package:get/get.dart';

class LocationListBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LocationListController());
  }
}