import 'package:dartz/dartz.dart';
import 'package:get/get.dart';

import '../../../../core/error/failure.dart';
import '../../domain/entities/episode.dart';
import '../../domain/usecases/get_episode.dart';

class EpisodeListItemUrlController extends GetxController {
  final String getUrl;
  final GetEpisode getEpisode;

  EpisodeListItemUrlController({
    required String url,
    required GetEpisode episode,
  })  : getEpisode = episode,
        getUrl = url {
    setLoading(true);
    final params = EpisodeParams(getUrl);
    getEpisode(params)
        .then((response) => setEpisode(response))
        .then((_) => setLoading(false))
        .onError((error, stackTrace) => print(error));
  }

  final error = Rxn<String>();
  final loading = false.obs;

  Episode? episode;

  @override
  void onInit() {
    super.onInit();
  }

  setEpisode(Either<Failure, Episode> response) =>
      response.fold((l) => throw l, (r) => episode = r);

  setLoading(bool value) => loading.value = value;
}
