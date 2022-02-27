import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../../../core/error/exception.dart';
import '../../../../core/util/config.dart';
import '../../../shared/data/models/page_model.dart';
import '../models/character_model.dart';

abstract class CharacterRemoteDataSource {
  Future<PageModel<CharacterModel>> getAllCharacters(int? page);
  Future<CharacterModel> getASingleCharacter(String url);
}

class CharacterRemoteDataSourceImpl extends CharacterRemoteDataSource {
  final http.Client client;

  CharacterRemoteDataSourceImpl({
    required this.client,
  });

  @override
  Future<PageModel<CharacterModel>> getAllCharacters(int? page) async {
    final sufixo = page != null ? "?page=$page" : "";
    final url = "${Config.api}/character$sufixo";
    final response = await client.get(
      Uri.parse(url),
    );

    if (response.statusCode == 200) {
      final body = json.decode(response.body);
      final info = body["info"];
      final results = body["results"];

      PageModel<CharacterModel> model = PageModel.fromJson(info);

      List<CharacterModel> listModel = List<CharacterModel>.from(
        results
            .map(
              (json) => CharacterModel.fromJson(json),
            )
            .toList(),
      );
      model.results = listModel;

      return model;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<CharacterModel> getASingleCharacter(String url) async {
    final response = await client.get(
      Uri.parse(url),
    );

    if (response.statusCode == 200) {
      final body = json.decode(response.body);
      CharacterModel model = CharacterModel.fromJson(body);
      return model;
    } else {
      throw ServerException();
    }
  }
}
