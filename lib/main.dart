import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:nuforce/app/utils/colors.dart';

import 'app/routes/app_pages.dart';

double height = 0;
double width = 0;
void main() {
  runApp(
    GetMaterialApp(
      title: "Application",
      debugShowCheckedModeBanner: false,
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      theme: ThemeData(
        fontFamily: 'Poppins',
        checkboxTheme: CheckboxThemeData(
          splashRadius: 0,
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          visualDensity: VisualDensity.compact,
          fillColor: MaterialStateColor.resolveWith(
            (states) => AppColors.primaryBlue1,
          ),
        ),
      ),
    ),
  );
}
