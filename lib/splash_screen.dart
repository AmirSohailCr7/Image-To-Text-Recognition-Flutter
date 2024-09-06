import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:imagetextrecognition/commons/colors.dart';
import 'package:imagetextrecognition/commons/sharedPreference/shared-preference.dart';
import 'package:imagetextrecognition/route/route_constants.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  _startSplashScreen() async {
    var duration = const Duration(seconds: 4);
    return Timer(duration, _navigationPage);
  }

  void _navigationPage() async {
    bool hasSeenOnboarding = await SharedPreferencesHelper.hasSeenOnboarding();
    if (hasSeenOnboarding) {
      Navigator.pushReplacementNamed(context, RouteConstants.dashboardScreen);
    } else {
      Navigator.pushReplacementNamed(context, RouteConstants.onboardingScreen);
    }
  }

  @override
  void initState() {
    _startSplashScreen();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Set the status bar color

    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: const BoxDecoration(
            color: KColors.blackColor,
            gradient: LinearGradient(
              colors: [
                KColors.primaryColor,
                KColors.secondaryColor,
              ],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              tileMode: TileMode.mirror,
            ),
          ),
          child: Center(
            child: Image.asset(
              'assets/OCRPRO.png',
              width: 150.w,
              height: 200.h,
            ),
          ),
        ),
      ),
    );
  }
}
