import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/usecases/usecase.dart';
import '../../../shared/domain/entities/page.dart';
import '../entities/character.dart';
import '../repositories/character_repository.dart';

class GetAllCharacter extends UseCase<Page<Character>, AllCharacterParams> {
  final CharacterRepository repository;

  GetAllCharacter(this.repository);

  @override
  Future<Either<Failure, Page<Character>>> call(AllCharacterParams params) async {    
    return await repository.readForPage(params.page);
  }
}

class AllCharacterParams extends Equatable {
  final int? page;

  const AllCharacterParams({
    required this.page,
  });

  @override
  List<Object?> get props => [page];
}
