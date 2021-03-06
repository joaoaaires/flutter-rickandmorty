import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/usecases/usecase.dart';
import '../../../shared/domain/entities/page.dart';
import '../entities/character.dart';
import '../repositories/character_repository.dart';

class GetCharacters extends UseCase<Page<Character>, CharactersParams> {
  final CharacterRepository repository;

  GetCharacters(this.repository);

  @override
  Future<Either<Failure, Page<Character>>> call(CharactersParams params) async {
    return await repository.readAllForPage(params.page);
  }
}

class CharactersParams extends Equatable {
  final int? page;

  const CharactersParams({
    required this.page,
  });

  @override
  List<Object?> get props => [page];
}
