import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/episode.dart';
import '../repositories/episode_repository.dart';

class GetEpisode extends UseCase<Episode, EpisodeParams> {
  final EpisodeRepository repository;

  GetEpisode(this.repository);

  @override
  Future<Either<Failure, Episode>> call(EpisodeParams params) async {
    return await repository.readOneByIdForUrl(params.url);
  }
}

class EpisodeParams {
  final String url;

  EpisodeParams(this.url);
}
