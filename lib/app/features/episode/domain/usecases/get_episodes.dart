import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/usecases/usecase.dart';
import '../../../shared/domain/entities/page.dart';
import '../entities/episode.dart';
import '../repositories/episode_repository.dart';

class GetEpisodes extends UseCase<Page<Episode>, EpisodesParams> {
  final EpisodeRepository repository;

  GetEpisodes(this.repository);

  @override
  Future<Either<Failure, Page<Episode>>> call(EpisodesParams params) async {
    return await repository.readAllForPage(params.page);
  }
}

class EpisodesParams extends Equatable {
  final int? page;

  const EpisodesParams({
    required this.page,
  });

  @override
  List<Object?> get props => [page];
}
