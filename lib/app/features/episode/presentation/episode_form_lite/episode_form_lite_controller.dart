import 'package:dartz/dartz.dart';
import 'package:get/get.dart';

import '../../../../core/error/failure.dart';
import '../../domain/entities/episode.dart';
import '../../domain/usecases/get_episode.dart';

class EpisodeFormLiteController extends GetxController {
  final int getId;
  final GetEpisode getEpisode;

  EpisodeFormLiteController({
    required int id,
    required GetEpisode episode,
  })  : getEpisode = episode,
        getId = id;

  final error = Rxn<String>();
  final loading = false.obs;

  late Episode? episode;

  @override
  void onInit() {
    super.onInit();
    setLoading(true);
    final params = EpisodeParams(getId);
    getEpisode(params)
        .then((response) => setEpisode(response))
        .then((_) => setLoading(false));
  }

  setEpisode(Either<Failure, Episode> response) =>
      response.fold((l) => throw l, (r) => episode = r);

  setLoading(bool value) => loading.value = value;
}
