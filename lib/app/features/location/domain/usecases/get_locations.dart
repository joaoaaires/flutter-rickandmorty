import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/usecases/usecase.dart';
import '../../../shared/domain/entities/page.dart';
import '../entities/location.dart';
import '../repositories/location_repository.dart';

class GetLocations extends UseCase<Page<Location>, LocationsParams> {

final LocationRepository repository;

  GetLocations(this.repository);

  @override
  Future<Either<Failure, Page<Location>>> call(LocationsParams params) async {
    return await repository.readAllForPage(params.page);
  }

}

class LocationsParams extends Equatable {
  final int? page;

  const LocationsParams({
    required this.page,
  });

  @override
  List<Object?> get props => [page];
  
}