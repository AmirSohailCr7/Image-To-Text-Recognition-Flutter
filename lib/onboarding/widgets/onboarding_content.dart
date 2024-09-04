import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

class OnBoardingContent extends StatelessWidget {
  const OnBoardingContent(
      {super.key,
      required this.lottieAnimation,
      required this.heading,
      required this.subHeading,
      required this.controller,
      this.imageHeight, this.imageWidth, this.gapHeight,});

  final String lottieAnimation, heading, subHeading;
  final AnimationController controller;
  final double? imageHeight, imageWidth, gapHeight;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(24.w),
      child: Column(
        children: [
          Text(
            heading,
            style: Theme.of(context).textTheme.headlineLarge!.copyWith(fontWeight: FontWeight.w600,),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 16.h,
          ),
          Padding(
            padding:  EdgeInsets.symmetric(horizontal: 24.0, vertical: 10.h),
            child: Text(
              subHeading,
              style: Theme.of(context).textTheme.bodyLarge,
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(height: gapHeight,),
          Lottie.network(
            height: imageHeight,
            fit: BoxFit.contain,
            lottieAnimation,
            repeat: true,
            backgroundLoading: true,
            controller: controller,
            onLoaded: (composition) {
              controller
                ..duration = composition.duration
                ..forward();
            },
          )
        ],
      ),
    );
  }
}