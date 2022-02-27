import 'package:flutterrickandmorty/app/features/character/domain/entities/character.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import '../character/domain/usecases/get_all_character.dart';

class HomeController extends GetxController {
  final GetAllCharacter getAllCharacter;
  final PagingController<int, Character> pagingController;

  HomeController({
    required GetAllCharacter allCharacter,
  })  : pagingController = PagingController(firstPageKey: 0),
        getAllCharacter = allCharacter;

  @override
  void onInit() {
    super.onInit();
    pagingController.addPageRequestListener((page) => _init(page));
  }

  Future<void> _init(int pageKey) async {
    final pageNotZero = pageKey != 0 ? pageKey : null;
    final params = AllCharacterParams(page: pageNotZero);

    final response = await getAllCharacter(params);
    response.fold(
      (l) => pagingController.error = "ERROR",
      (response) {
        final list = response.results;
        final isLastPage = pageKey > response.pages;
        if (isLastPage) {
          pagingController.appendLastPage(list);
        } else {
          pagingController.appendPage(list, pageKey + 1);
        }
      },
    );
  }
}
