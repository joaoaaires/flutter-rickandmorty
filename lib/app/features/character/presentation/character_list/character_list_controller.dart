import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import '../../../../routes/app_routes.dart';
import '../../../episode/domain/usecases/get_episodes.dart';
import '../../domain/entities/character.dart';
import '../../domain/usecases/get_character.dart';
import '../../domain/usecases/get_characters.dart';

class CharacterListController extends GetxController {
  final GetCharacter getCharacter;
  final GetCharacters getCharacters;

  CharacterListController({
    required GetCharacter character,
    required GetCharacters characters,
  })  : getCharacters = characters,
        getCharacter = character;

  Future<void> updateEpisode(
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

  void toCharacterForm(Character character) {
    Get.toNamed(
      AppRoutes.characterForm,
      arguments: character,
    );
  }
}
