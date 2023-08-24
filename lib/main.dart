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
        colorScheme: ColorScheme.fromSwatch(
          // primarySwatch: AppColors.primaryBlue1,
          primarySwatch: MaterialColor(
            AppColors.primaryBlue1.value,
            const <int, Color>{
              50: AppColors.primaryBlue1,
              100: AppColors.primaryBlue1,
              200: AppColors.primaryBlue1,
              300: AppColors.primaryBlue1,
              400: AppColors.primaryBlue1,
              500: AppColors.primaryBlue1,
              600: AppColors.primaryBlue1,
              700: AppColors.primaryBlue1,
              800: AppColors.primaryBlue1,
              900: AppColors.primaryBlue1,
            },
          ),
        ),
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
