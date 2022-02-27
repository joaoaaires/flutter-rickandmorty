import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import '../../domain/entities/location.dart';
import '../../domain/usecases/get_location.dart';
import '../../domain/usecases/get_locations.dart';

class LocationListController extends GetxController {
  final GetLocation getLocation;
  final GetLocations getLocations;

  LocationListController({
    required GetLocation location,
    required GetLocations locations,
  })  : getLocations = locations,
        getLocation = location;

  Future<void> updateLocation(
    int pageKey,
    PagingController<int, Location> pagingController,
  ) async {
    final pageKeyAddOne = pageKey + 1;

    final params = LocationsParams(page: pageKeyAddOne);
    final response = await getLocations(params);
    response.fold(
      (l) => pagingController.error = "ERROR",
      (response) {
        final list = response.results;
        final isLastPage = pageKeyAddOne > response.pages;
        if (isLastPage) {
          pagingController.appendLastPage(list);
        } else {
          pagingController.appendPage(list, pageKey + 1);
        }
      },
    );
  }
}
