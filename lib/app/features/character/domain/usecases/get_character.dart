import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/character.dart';
import '../repositories/character_repository.dart';

class GetCharacter extends UseCase<Character, CharacterParams> {
  final CharacterRepository repository;

  GetCharacter(this.repository);

  @override
  Future<Either<Failure, Character>> call(CharacterParams params) async {
    return await repository.readOneByIdForUrl(params.url);
  }
}

class CharacterParams extends Equatable {
  final String url;

  const CharacterParams({
    required this.url,
  });

  @override
  List<Object?> get props => [url];
}
