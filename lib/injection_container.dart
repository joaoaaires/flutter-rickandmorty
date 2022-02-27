import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class InjectionContainer extends Bindings {
  @override
  void dependencies() async {
    //! External
    Get.put(http.Client());
  }
}
