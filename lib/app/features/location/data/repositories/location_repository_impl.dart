import 'package:dartz/dartz.dart';

import '../../../../core/error/exception.dart';
import '../../../../core/error/failure.dart';
import '../../../shared/domain/entities/page.dart';
import '../../domain/entities/location.dart';
import '../../domain/repositories/location_repository.dart';
import '../datasources/location_remote_data_source.dart';

class LocationRepositoryImpl extends LocationRepository {
  final LocationRemoteDataSource remoteDataSource;

  LocationRepositoryImpl({
    required this.remoteDataSource,
  });

  @override
  Future<Either<Failure, Page<Location>>> readAllForPage(int? page) async {
    try {
      final response = await remoteDataSource.getAllLocations(page);
      return Right(response);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, Location>> readOneByIdForUrl(String url) async {
    try {
      final response = await remoteDataSource.getASingleLocation(url);
      return Right(response);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
