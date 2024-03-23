import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter_android/google_maps_flutter_android.dart';
// import 'package:mapbox_maps_flutter/mapbox_maps_flutter.dart' as mapbox;
import 'package:nuforce/app/routes/app_pages.dart';
import 'package:nuforce/app/utils/colors.dart';
import 'package:nuforce/app/utils/initial_bindings.dart';

double height = 0;
double width = 0;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (Platform.isAndroid && kReleaseMode) {
    await GoogleMapsFlutterAndroid().initializeWithRenderer(AndroidMapRenderer.latest);
  }
  // mapbox.MapboxOptions.setAccessToken('');

  runApp(
    ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      child: GetMaterialApp(
        title: 'Nuforce',
        debugShowCheckedModeBanner: false,
        initialRoute: AppPages.INITIAL,
        getPages: AppPages.routes,
        initialBinding: InitialBindings(),
        theme: ThemeData(
          useMaterial3: false,
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
          // checkboxTheme: CheckboxThemeData(
          //   splashRadius: 0,
          //   materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          //   visualDensity: VisualDensity.compact,
          //   fillColor: MaterialStateColor.resolveWith(
          //     (states) => AppColors.primaryBlue1,
          //   ),
          // ),
        ),
      ),
    ),
  );
}
