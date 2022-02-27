import '../../domain/entities/page.dart';

// ignore: must_be_immutable
class PageModel<T> extends Page<T> {
  PageModel({
    required int count,
    required int pages,
  }) : super(
          count: count,
          pages: pages,
        );

  factory PageModel.fromJson(Map<String, dynamic> json) {
    return PageModel(
      count: json['count'],
      pages: json['pages'],
    );
  }
}
