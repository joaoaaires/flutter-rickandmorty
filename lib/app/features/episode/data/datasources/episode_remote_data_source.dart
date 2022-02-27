import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../../../core/error/exception.dart';
import '../../../../core/util/config.dart';
import '../../../shared/data/models/page_model.dart';
import '../models/episode_model.dart';

abstract class EpisodeRemoteDataSource {
  Future<PageModel<EpisodeModel>> getAllEpisodes(int? page);
  Future<EpisodeModel> getASingleEpisode(String url);
}

class EpisodeRemoteDataSourceImpl extends EpisodeRemoteDataSource {
  final http.Client client;

  EpisodeRemoteDataSourceImpl({
    required this.client,
  });

  @override
  Future<EpisodeModel> getASingleEpisode(String url) async {
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
  Future<PageModel<EpisodeModel>> getAllEpisodes(int? page) async {
    final sufixo = page != null ? "?page=$page" : "";
    final url = "${Config.api}/episode$sufixo";
    final response = await client.get(
      Uri.parse(url),
    );

    if (response.statusCode == 200) {
      final body = json.decode(response.body);
      final info = body["info"];
      final results = body["results"];

      PageModel<EpisodeModel> model = PageModel.fromJson(info);

      List<EpisodeModel> listModel = List<EpisodeModel>.from(
        results
            .map(
              (json) => EpisodeModel.fromJson(json),
            )
            .toList(),
      );
      model.results = listModel;

      return model;
    } else {
      throw ServerException();
    }
  }
}
