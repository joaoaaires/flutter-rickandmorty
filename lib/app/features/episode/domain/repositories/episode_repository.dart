import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../../../shared/domain/entities/page.dart';
import '../entities/episode.dart';

abstract class EpisodeRepository {
  Future<Either<Failure, Episode>> readOneByIdForUrl(String url);
  Future<Either<Failure, Page<Episode>>> readAllForPage(int? page);
}