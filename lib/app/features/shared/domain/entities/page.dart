import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class Page<T> extends Equatable {
  final int count;
  final int pages;
  late List<T> results;

  Page({
    required this.count,
    required this.pages,
  });

  @override
  List<Object?> get props => [
        count,
        pages,
        results,
      ];
}
