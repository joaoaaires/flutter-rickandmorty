import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'features/home/home_bindings.dart';
import 'features/home/home_page.dart';
import 'theme/app_theme.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: AppTheme.theme,
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
      initialBinding: HomeBindings(),
    );
  }
}