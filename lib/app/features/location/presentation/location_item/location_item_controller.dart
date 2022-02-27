import 'package:dartz/dartz.dart';
import 'package:get/get.dart';

import '../../../../core/error/failure.dart';
import '../../domain/entities/location.dart';
import '../../domain/usecases/get_location.dart';

class LocationItemController extends GetxController {
  final String url;
  final GetLocation getLocation;

  LocationItemController({
    required this.url,
    required GetLocation location,
  }) : getLocation = location;

  final loading = true.obs;

  Location? location;

  void updateItem() {
    final params = LocationParams(url: url);
    getLocation(params)
        .then((response) => setEpisode(response))
        .then((_) => setLoading(false));
  }

  setLoading(bool value) => loading.value = value;

  void setEpisode(Either<Failure, Location> response) =>
      response.fold((l) => throw l, (r) => location = r);
}
