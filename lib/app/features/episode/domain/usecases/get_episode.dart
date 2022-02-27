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
    return await repository.readOneById(params.id);
  }
}

class EpisodeParams {
  final int id;

  EpisodeParams(this.id);
}
