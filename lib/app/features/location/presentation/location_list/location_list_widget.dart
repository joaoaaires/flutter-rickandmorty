import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import '../../domain/entities/location.dart';
import 'location_list_controller.dart';

class LocationListWidget extends GetWidget<LocationListController> {
  final PagingController<int, Location> pagingController;

  LocationListWidget({Key? key})
      : pagingController = PagingController<int, Location>(
          firstPageKey: 0,
        ),
        super(key: key) {
    pagingController.addPageRequestListener(
      (pageKey) => controller.updateLocation(
        pageKey,
        pagingController,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return PagedListView<int, Location>(
      padding: const EdgeInsets.all(13.0),
      pagingController: pagingController,
      builderDelegate: PagedChildBuilderDelegate<Location>(
        itemBuilder: (context, item, index) => itemBuild(item),
      ),
    );
  }

  Widget itemBuild(Location location) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(10.0),
        onTap: () => controller.toCharacters(location),
        child: ListTile(
          title: Text(location.name ?? ""),
          subtitle: Text(
            (location.type ?? "") + " - " + (location.dimension ?? ""),
          ),
        ),
      ),
    );
  }
}
