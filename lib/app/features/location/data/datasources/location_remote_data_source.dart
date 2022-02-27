import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../../../core/error/exception.dart';
import '../../../../core/util/config.dart';
import '../../../shared/data/models/page_model.dart';
import '../models/location_model.dart';

abstract class LocationRemoteDataSource {
  Future<PageModel<LocationModel>> getAllLocations(int? page);
  Future<LocationModel> getASingleLocation(String url);
}

class LocationRemoteDataSourceImpl extends LocationRemoteDataSource {
  final http.Client client;

  LocationRemoteDataSourceImpl({
    required this.client,
  });

  @override
  Future<PageModel<LocationModel>> getAllLocations(int? page) async {
    final sufixo = page != null ? "?page=$page" : "";
    final url = "${Config.api}/episode$sufixo";
    final response = await client.get(
      Uri.parse(url),
    );

    if (response.statusCode == 200) {
      final body = json.decode(response.body);
      final info = body["info"];
      final results = body["results"];

      PageModel<LocationModel> model = PageModel.fromJson(info);

      List<LocationModel> listModel = List<LocationModel>.from(
        results
            .map(
              (json) => LocationModel.fromJson(json),
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
  Future<LocationModel> getASingleLocation(String url) async {
    final response = await client.get(
      Uri.parse(url),
    );

    if (response.statusCode == 200) {
      final body = json.decode(response.body);
      LocationModel model = LocationModel.fromJson(body);
      return model;
    } else {
      throw ServerException();
    }
  }
}
