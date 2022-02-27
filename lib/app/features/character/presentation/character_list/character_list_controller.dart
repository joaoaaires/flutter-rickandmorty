import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import '../../../../routes/app_routes.dart';
import '../../domain/entities/character.dart';
import '../../domain/usecases/get_all_character.dart';

class CharacterListController extends GetxController {
  final GetAllCharacter getAllCharacter;
  final PagingController<int, Character> pagingController;

  CharacterListController({
    required GetAllCharacter allCharacter,
  })  : pagingController = PagingController(firstPageKey: 0),
        getAllCharacter = allCharacter;

  @override
  void onInit() {
    super.onInit();
    pagingController.addPageRequestListener((page) => _update(page));
  }

  Future<void> _update(int pageKey) async {
    final pageKeyAddOne = pageKey + 1;
    final params = AllCharacterParams(page: pageKeyAddOne);

    final response = await getAllCharacter(params);
    response.fold(
      (l) => pagingController.error = "ERROR",
      (response) {
        final list = response.results;
        final isLastPage = pageKeyAddOne > response.pages;
        if (isLastPage) {
          pagingController.appendLastPage(list);
        } else {
          pagingController.appendPage(list, pageKey + 1);
        }
      },
    );
  }

  void toCharacterForm(Character character) {
    Get.toNamed(
      AppRoutes.characterForm,
      arguments: character,
    );
  }
}
