import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../../../core/error/exception.dart';
import '../../../../core/util/config.dart';
import '../../../shared/data/models/page_model.dart';
import '../models/episode_model.dart';

abstract class EpisodeRemoteDataSource {
  Future<PageModel<EpisodeModel>> getAllEpisodes(int? page);
  Future<EpisodeModel> getASingleEpisode(int id);
}

class EpisodeRemoteDataSourceImpl extends EpisodeRemoteDataSource {
  final http.Client client;

  EpisodeRemoteDataSourceImpl({
    required this.client,
  });

  @override
  Future<EpisodeModel> getASingleEpisode(int id) async {
    final url = "${Config.api}/episode/$id";
    final response = await client.get(
      Uri.parse(url),
    );

    if (response.statusCode == 200) {
      final body = json.decode(response.body);
      EpisodeModel model = EpisodeModel.fromJson(body);
      return model;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<PageModel<EpisodeModel>> getAllEpisodes(int? page) {
    // TODO: implement getAllEpisodes
    throw UnimplementedError();
  }
}
