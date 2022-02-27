import 'package:get/get.dart';

import '../character/data/datasources/character_remote_data_source.dart';
import '../character/data/repositories/character_repository_impl.dart';
import '../character/domain/repositories/character_repository.dart';
import '../character/domain/usecases/get_all_character.dart';
import 'home_controller.dart';

class HomeBindings extends Bindings {
  @override
  void dependencies() {
    //!DataSource
    Get.put<CharacterRemoteDataSource>(
      CharacterRemoteDataSourceImpl(
        client: Get.find(),
      ),
    );

    //!Repository
    Get.put<CharacterRepository>(
      CharacterRepositoryImpl(
        remoteDataSource: Get.find(),
      ),
    );

    //!Usecase
    Get.put(GetAllCharacter(Get.find()));

    //!Controller
    Get.put(
      HomeController(
        allCharacter: Get.find(),
      ),
    );
  }
}
