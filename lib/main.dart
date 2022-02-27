import 'package:flutter/material.dart';
import 'package:flutterrickandmorty/injection_container.dart';

import 'app/app_widget.dart';

void main() {
  InjectionContainer().dependencies();
  runApp(const AppWidget());
}