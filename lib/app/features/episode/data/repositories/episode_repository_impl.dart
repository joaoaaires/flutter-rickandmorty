import 'package:dartz/dartz.dart';

import '../../../../core/error/exception.dart';
import '../../../../core/error/failure.dart';
import '../../../shared/domain/entities/page.dart';
import '../../domain/entities/episode.dart';
import '../../domain/repositories/episode_repository.dart';
import '../datasources/episode_remote_data_source.dart';

class EpisodeRepositoryImpl extends EpisodeRepository {
  final EpisodeRemoteDataSource remoteDataSource;

  EpisodeRepositoryImpl({
    required this.remoteDataSource,
  });

  @override
  Future<Either<Failure, Page<Episode>>> readAllForPage(int? page) {
    // TODO: implement readAllForPage
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Episode>> readOneById(int id) async {
    try {
      final response = await remoteDataSource.getASingleEpisode(id);
      return Right(response);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
