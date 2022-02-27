import 'package:get/get.dart';

import '../../data/datasources/episode_remote_data_source.dart';
import '../../data/repositories/episode_repository_impl.dart';
import '../../domain/repositories/episode_repository.dart';
import '../../domain/usecases/get_episode.dart';
import '../../domain/usecases/get_episodes.dart';
import 'episode_list_controller.dart';

class EpisodeListBindings extends Bindings {
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
    Get.lazyPut(() => GetEpisodes(Get.find()));

    Get.put(EpisodeListController(
      episodes: Get.find(),
      episode: Get.find(),
    ));
  }
}
