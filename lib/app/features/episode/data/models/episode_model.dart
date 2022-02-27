import '../../domain/entities/episode.dart';

class EpisodeModel extends Episode {
  const EpisodeModel({
    required int? id,
    required String? name,
    required String? airDate,
    required String? episode,
    required List<dynamic> characters,
    required String? url,
    required String? created,
  }) : super(
          id: id,
          name: name,
          airDate: airDate,
          episode: episode,
          characters: characters,
          url: url,
          created: created,
        );

  factory EpisodeModel.fromJson(Map<String, dynamic> json) {
    return EpisodeModel(
      id: json['id'],
      name: json['name'],
      airDate: json['airDate'],
      episode: json['episode'],
      characters: json['characters'] ?? [],
      url: json['url'],
      created: json['created'],
    );
  }
}
