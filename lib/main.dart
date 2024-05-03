import 'dart:io';

import 'dart:developer' as developer show log;
// import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter_android/google_maps_flutter_android.dart';
import 'package:nuforce/app/routes/app_pages.dart';
import 'package:nuforce/app/utils/colors.dart';
import 'package:nuforce/app/utils/initial_bindings.dart';
import 'package:nuforce/firebase_options.dart';

double height = 0;
double width = 0;

@pragma("vm:entry-point")
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  developer.log('Handling a background message ${message.messageId}');
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
    alert: true,
    badge: true,
    sound: true,
  );

  if (Platform.isAndroid && kReleaseMode) {
    await GoogleMapsFlutterAndroid().initializeWithRenderer(AndroidMapRenderer.latest);
  }

  if (kReleaseMode) {
    FlutterError.onError = (errorDetails) {
      FirebaseCrashlytics.instance.recordFlutterFatalError(errorDetails);
    };
    PlatformDispatcher.instance.onError = (error, stack) {
      FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
      return true;
    };
  }

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
