import 'package:equatable/equatable.dart';

class Location extends Equatable {
  final int? id;
  final String? name;
  final String? type;
  final String? dimension;
  final List<dynamic> residents;
  final String? url;
  final String? created;

  const Location({
    required this.id,
    required this.name,
    required this.type,
    required this.dimension,
    required this.residents,
    required this.url,
    required this.created,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        type,
        dimension,
        residents,
        url,
        created,
      ];
}
