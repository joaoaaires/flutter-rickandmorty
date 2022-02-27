import '../../domain/entities/location.dart';

class LocationModel extends Location {
  const LocationModel({
    required int? id,
    required String? name,
    required String? type,
    required String? dimension,
    required List<dynamic> residents,
    required String? url,
    required String? created,
  }) : super(
          id: id,
          name: name,
          type: type,
          dimension: dimension,
          residents: residents,
          url: url,
          created: created,
        );

  factory LocationModel.fromJson(Map<String, dynamic> json) {
    return LocationModel(
      id: json['id'],
      name: json['name'],
      type: json['type'],
      dimension: json['dimension'],
      residents: json['residents'] ?? [],
      url: json['url'],
      created: json['created'],
    );
  }
}
