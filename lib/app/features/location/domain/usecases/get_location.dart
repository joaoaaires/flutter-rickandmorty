import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/location.dart';
import '../repositories/location_repository.dart';

class GetLocation extends UseCase<Location, LocationParams> {
  final LocationRepository repository;

  GetLocation(this.repository);

  @override
  Future<Either<Failure, Location>> call(LocationParams params) async {
    return await repository.readOneByIdForUrl(params.url);
  }
}

class LocationParams extends Equatable {
  final String url;

  const LocationParams({
    required this.url,
  });

  @override
  List<Object?> get props => [url];
}
