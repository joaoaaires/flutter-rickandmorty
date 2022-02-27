import 'package:dartz/dartz.dart';

import '../../../../core/error/exception.dart';
import '../../../../core/error/failure.dart';
import '../../../shared/domain/entities/page.dart';
import '../../domain/entities/character.dart';
import '../../domain/repositories/character_repository.dart';
import '../datasources/character_remote_data_source.dart';

class CharacterRepositoryImpl extends CharacterRepository {
  final CharacterRemoteDataSource remoteDataSource;

  CharacterRepositoryImpl({
    required this.remoteDataSource,
  });

  @override
  Future<Either<Failure, Page<Character>>> readAllForPage(int? page) async {
    try {
      final response = await remoteDataSource.getAllCharacters(page);
      return Right(response);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, Character>> readOneByIdForUrl(String url) async {
    try {
      final response = await remoteDataSource.getASingleCharacter(url);
      return Right(response);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
