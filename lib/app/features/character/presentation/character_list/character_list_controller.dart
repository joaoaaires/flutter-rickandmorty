import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import '../../../../routes/app_routes.dart';
import '../../domain/entities/character.dart';
import '../../domain/usecases/get_characters.dart';

class CharacterListController extends GetxController {
  final GetCharacters getCharacters;

  CharacterListController({
    required GetCharacters characters,
  }) : getCharacters = characters;

  Future<void> updateCharacter(
    int pageKey,
    PagingController<int, Character> pagingController,
  ) async {
    final pageKeyAddOne = pageKey + 1;

    final params = CharactersParams(page: pageKeyAddOne);
    final response = await getCharacters(params);
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

  Future<void> updateCharacterUrl(
    int pageKey,
    PagingController<int, String> pagingController,
  ) async {
    final args = Get.arguments;
    final argsNotNull = args ?? [];
    pagingController.appendLastPage(
      List<String>.from(
        argsNotNull.map((e) => e.toString()).toList(),
      ),
    );
  }

  void toCharacterForm(Character character) {
    Get.toNamed(
      AppRoutes.characterForm,
      arguments: character,
    );
  }
}
