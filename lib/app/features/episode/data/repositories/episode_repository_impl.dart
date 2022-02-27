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
  Future<Either<Failure, Page<Episode>>> readAllForPage(int? page) async {
    try {
      final response = await remoteDataSource.getAllEpisodes(page);
      return Right(response);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, Episode>> readOneByIdForUrl(String url) async {
    try {
      final response = await remoteDataSource.getASingleEpisode(url);
      return Right(response);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
