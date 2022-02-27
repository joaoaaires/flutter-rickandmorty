import 'package:dartz/dartz.dart';
import 'package:get/get.dart';

import '../../../../core/error/failure.dart';
import '../../domain/entities/episode.dart';
import '../../domain/usecases/get_episode.dart';

class EpisodeItemController extends GetxController {
  final String url;
  final GetEpisode getEpisode;

  EpisodeItemController({
    required this.url,
    required GetEpisode episode,
  }) : getEpisode = episode;

  final loading = true.obs;

  Episode? episode;

  void updateItem() {
    final params = EpisodeParams(url);
    getEpisode(params)
        .then((response) => setEpisode(response))
        .then((_) => setLoading(false));
  }

  setLoading(bool value) => loading.value = value;

  void setEpisode(Either<Failure, Episode> response) =>
      response.fold((l) => throw l, (r) => episode = r);
}
