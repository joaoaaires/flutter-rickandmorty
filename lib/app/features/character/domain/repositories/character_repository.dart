import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../../../shared/domain/entities/page.dart';
import '../entities/character.dart';

abstract class CharacterRepository {
  Future<Either<Failure, Character>> readOneByIdForUrl(String url);
  Future<Either<Failure, Page<Character>>> readAllForPage(int? page);
}
