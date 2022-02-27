import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../../../shared/domain/entities/page.dart';
import '../entities/character.dart';

abstract class CharacterRepository {
  Future<Either<Failure, Character>> create(Character character);
  Future<Either<Failure, Character>> readById(int id);
  Future<Either<Failure, Page<Character>>> readForPage(int? page);
  Future<Either<Failure, Character>> update(Character character);
  Future<Either<Failure, Character>> delete(Character character);
}
