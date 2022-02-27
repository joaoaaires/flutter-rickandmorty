import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import '../../domain/entities/episode.dart';
import '../../domain/usecases/get_episode.dart';
import '../../domain/usecases/get_episodes.dart';

class EpisodeListController extends GetxController {
  final GetEpisode getEpisode;
  final GetEpisodes getEpisodes;

  EpisodeListController({
    required GetEpisode episode,
    required GetEpisodes episodes,
  })  : getEpisodes = episodes,
        getEpisode = episode;

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
}
