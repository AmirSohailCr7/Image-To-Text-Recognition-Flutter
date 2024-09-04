// lib/my_app.dart
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:imagetextrecognition/commons/colors.dart';
import 'package:imagetextrecognition/route/route_constants.dart';
import 'package:imagetextrecognition/route/routes.dart';

class MyApp extends StatelessWidget {

  const MyApp({super.key,});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: KColors.blackColor,
      statusBarIconBrightness: Brightness.light,
    ));
    ScreenUtil.init(context);

    return ScreenUtilInit(
      builder: ((context, child) {
        return MaterialApp(
          builder: (context, child) {
            const lowerLimit = 0.6;
            const upperLimit = 0.9;

            final mediaQueryData = MediaQuery.of(context);
            final scale = mediaQueryData.textScaler.clamp(
                minScaleFactor: lowerLimit, maxScaleFactor: upperLimit);
            return MediaQuery(
              data: MediaQuery.of(context).copyWith(textScaler: scale),
              child: child!,
            );
          },
          debugShowCheckedModeBanner: false,
          title: 'OCRPRO',
          theme: ThemeData(
            primaryColor: KColors.whiteColor,
            scaffoldBackgroundColor: Colors.white,
            dialogTheme: DialogTheme(
              backgroundColor: Colors.white,
              surfaceTintColor: Colors.white,
            ),
            cardTheme: CardTheme(
              surfaceTintColor: Colors.white,
            ),
            bottomSheetTheme: BottomSheetThemeData(
              backgroundColor: Colors.white,
              surfaceTintColor: Colors.white,
              modalBarrierColor: Colors.black.withOpacity(0.3),
            ),
            colorScheme: ColorScheme.fromSwatch(
              primarySwatch: Colors.blue,
            ).copyWith(onSurface: Colors.black, primary: Colors.white),
          ),
          initialRoute: RouteConstants.splashScreen,
          onGenerateRoute: Routes.generateRoute,
        );
      }),
      designSize: const Size(300, 900),
    );
  }
}
