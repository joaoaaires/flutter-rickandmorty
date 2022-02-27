import 'package:flutter/material.dart';

import 'app/app_widget.dart';
import 'injection_container.dart';

void main() {
  InjectionContainer().dependencies();
  runApp(const AppWidget());
}