import 'package:get/get.dart';

import '../../data/datasources/character_remote_data_source.dart';
import '../../data/repositories/character_repository_impl.dart';
import '../../domain/repositories/character_repository.dart';
import '../../domain/usecases/get_character.dart';
import '../../domain/usecases/get_characters.dart';
import 'character_list_controller.dart';

class CharacterListBindings extends Bindings {
  @override
  void dependencies() {
    //! DataSource
    Get.lazyPut<CharacterRemoteDataSource>(
      () => CharacterRemoteDataSourceImpl(
        client: Get.find(),
      ),
    );

    //! Repository
    Get.lazyPut<CharacterRepository>(
      () => CharacterRepositoryImpl(
        remoteDataSource: Get.find(),
      ),
    );

    //! Usecase
    Get.lazyPut(() => GetCharacter(Get.find()));
    Get.lazyPut(() => GetCharacters(Get.find()));

    //! Controller
    Get.lazyPut(
      () => CharacterListController(
        characters: Get.find(),
      ),
    );
  }
}
