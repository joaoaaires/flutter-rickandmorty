import 'package:dartz/dartz.dart';
import 'package:get/get.dart';

import '../../../../core/error/failure.dart';
import '../../domain/entities/character.dart';
import '../../domain/usecases/get_character.dart';

class CharacterItemController extends GetxController {
  final String url;
  final GetCharacter getCharacter;

  CharacterItemController({
    required this.url,
    required GetCharacter character,
  }) : getCharacter = character;

  final loading = true.obs;

  Character? character;

  void updateItem() {
    final params = CharacterParams(url: url);
    getCharacter(params)
        .then((response) => setCharacter(response))
        .then((_) => setLoading(false));
  }

  setLoading(bool value) => loading.value = value;

  void setCharacter(Either<Failure, Character> response) =>
      response.fold((l) => throw l, (r) => character = r);
}