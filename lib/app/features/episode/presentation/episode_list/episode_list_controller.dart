import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import '../../domain/entities/episode.dart';
import '../../domain/usecases/get_episodes.dart';

class EpisodeListController extends GetxController {
  final GetEpisodes getEpisodes;

  EpisodeListController({
    required GetEpisodes episodes,
  })  : getEpisodes = episodes;

  bool episodeListIsUrl = false;

  Future<void> updateEpisode(
    int pageKey,
    PagingController<int, Episode> pagingController,
  ) async {
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

  Future<void> updateEpisodeUrl(
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
}
