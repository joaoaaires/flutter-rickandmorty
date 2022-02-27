import 'package:get/get.dart';

import '../../data/datasources/location_remote_data_source.dart';
import '../../data/repositories/location_repository_impl.dart';
import '../../domain/repositories/location_repository.dart';
import '../../domain/usecases/get_location.dart';

class LocationItemBindings extends Bindings {
  @override
  void dependencies() {
    //! DataSource
    Get.lazyPut<LocationRemoteDataSource>(
      () => LocationRemoteDataSourceImpl(
        client: Get.find(),
      ),
    );

    //! Repository
    Get.lazyPut<LocationRepository>(
      () => LocationRepositoryImpl(
        remoteDataSource: Get.find(),
      ),
    );

    //! UseCase
    Get.lazyPut(() => GetLocation(Get.find()));
  }
}
