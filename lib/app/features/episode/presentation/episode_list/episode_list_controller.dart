import 'package:flutterrickandmorty/app/features/episode/domain/usecases/get_episodes.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class EpisodeListController extends GetxController {
  final GetEpisodes getEpisodes;
  final PagingController<int, dynamic> pagingController;

  EpisodeListController({
    required GetEpisodes episodes,
  })  : pagingController = PagingController(firstPageKey: 0),
        getEpisodes = episodes;

  bool episodeListIsUrl = false;

  @override
  void onInit() {
    super.onInit();
    final args = Get.arguments;
    if (args != null) episodeListIsUrl = true;
    pagingController.addPageRequestListener(episodeListIsUrl
        ? (page) => _updateUrl(args)
        : (page) => _updateEpisode(page));
  }

  Future<void> _updateEpisode(int pageKey) async {
    final pageKeyAddOne = pageKey + 1;
    final params = EpisodesParams(page: pageKeyAddOne);

    final response = await getEpisodes(params);
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

  Future<void> _updateUrl(List<dynamic> episodes) async {
    final episodesString = episodes.map((e) => e.toString()).toList();
    pagingController.appendLastPage(episodesString);
  }
}
