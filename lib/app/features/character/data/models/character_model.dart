import '../../domain/entities/character.dart';

class CharacterModel extends Character {
  const CharacterModel({
    required int? id,
    required String? name,
    required String? status,
    required String? species,
    required String? type,
    required String? gender,
    required Map<String, dynamic> origin,
    required Map<String, dynamic> location,
    required String? image,
    required List<dynamic> episode,
    required String? url,
    required String? created,
  }) : super(
          id: id,
          name: name,
          status: status,
          species: species,
          type: type,
          gender: gender,
          origin: origin,
          location: location,
          image: image,
          episode: episode,
          url: url,
          created: created,
        );

  factory CharacterModel.fromJson(Map<String, dynamic> json) {
    return CharacterModel(
      id: json['id'],
      name: json['name'],
      status: json['status'],
      species: json['species'],
      type: json['type'],
      gender: json['gender'],
      origin: json['origin'],
      location: json['location'],
      image: json['image'],
      episode: json['episode'],
      url: json['url'],
      created: json['created'],
    );
  }
}
