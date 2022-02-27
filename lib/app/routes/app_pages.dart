import 'package:get/get.dart';

import '../features/character/presentation/character_form/character_form_bindings.dart';
import '../features/character/presentation/character_form/character_form_page.dart';
import '../features/character/presentation/character_list/character_list_bindings.dart';
import '../features/character/presentation/character_list/character_list_page.dart';
import '../features/home/home_bindings.dart';
import '../features/home/home_page.dart';
import 'app_routes.dart';

class AppPages {
  static final pages = [
    GetPage(
      name: AppRoutes.init,
      page: () => const HomePage(),
      binding: HomeBindings(),
    ),
    GetPage(
      name: AppRoutes.characterList,
      page: () => const CharacterListPage(),
      binding: CharacterListBindings(),
    ),
    GetPage(
      name: AppRoutes.characterForm,
      page: () => const CharacterFormPage(),
      binding: CharacterFormBindings(),
    ),
  ];
}