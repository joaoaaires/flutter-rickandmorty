import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../../../shared/domain/entities/page.dart';
import '../entities/location.dart';

abstract class LocationRepository {
  Future<Either<Failure, Location>> readOneByIdForUrl(String url);
  Future<Either<Failure, Page<Location>>> readAllForPage(int? page);
}