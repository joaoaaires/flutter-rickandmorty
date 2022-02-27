import 'package:get/get.dart';

import '../../data/datasources/episode_remote_data_source.dart';
import '../../data/repositories/episode_repository_impl.dart';
import '../../domain/repositories/episode_repository.dart';
import '../../domain/usecases/get_episode.dart';

class EpisodeFormLiteBindings extends Bindings {
  @override
  void dependencies() {
    //! DataSource
    Get.lazyPut<EpisodeRemoteDataSource>(
      () => EpisodeRemoteDataSourceImpl(
        client: Get.find(),
      ),
    );

    //! Repository
    Get.lazyPut<EpisodeRepository>(
      () => EpisodeRepositoryImpl(
        remoteDataSource: Get.find(),
      ),
    );

    //! Usecase
    Get.lazyPut(() => GetEpisode(Get.find()));
  }
}
