import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:imagetextrecognition/commons/colors.dart';
import 'package:imagetextrecognition/commons/custom_widgets/custom_button.dart';
import 'package:imagetextrecognition/commons/image_text_strings.dart';
import 'package:imagetextrecognition/commons/sharedPreference/shared-preference.dart';
import 'package:imagetextrecognition/onboarding/widgets/onboarding_content.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen>
    with SingleTickerProviderStateMixin {
  final PageController _pageController = PageController();
  late AnimationController controller;
  bool status = false;
  int currentPage = 0;

  @override
  void initState() {
    controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 5));
    controller.addStatusListener((status) async {
      if (status == AnimationStatus.completed) {
        controller.forward(from: 0.0);
      }
    });
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: KColors.lightgreyColor,
      statusBarIconBrightness: Brightness.dark,
    ));
    _pageController.addListener(() {
      setState(() {
        currentPage = _pageController.page!.round();
      });
    });

    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    _pageController.dispose();
    super.dispose();
  }

  void _onNextPressed() {
    if (currentPage < 2) {
      _pageController.nextPage(
          duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
    } else {
      // Navigate to the dashboard screen if on the last page
      _navigateToDashboard();
    }
  }

  Future<void> _navigateToDashboard() async {
    await SharedPreferencesHelper.setOnboardingSeen(true);
    Navigator.pushReplacementNamed(context, '/dashboard');
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      onPopInvoked: (canPop) {
        if (currentPage > 0) {
          _pageController.previousPage(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut);
        }
      },
      child: Scaffold(
        body: Stack(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 50.h, left: 8.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    width: 40.w,
                    height: 55.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
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
                        KImages.ocrProLogo,
                        width: 150.w,
                        height: 150.h,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 5.w,
                  ),
                  Row(
                    children: [
                      Text(
                        'Welcome to ',
                        style: Theme.of(context)
                            .textTheme
                            .headlineMedium!
                            .copyWith(fontWeight: FontWeight.w300),
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        ' OCRPRO',
                        style: Theme.of(context)
                            .textTheme
                            .headlineLarge!
                            .copyWith(fontWeight: FontWeight.w600),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  top: 150.h, right: 0.w, left: 0.w, bottom: 50.h),
              child: PageView(
                controller: _pageController,
                children: [
                  OnBoardingContent(
                    lottieAnimation: KImages.lottieOnboardingOne,
                    heading: 'Unlock the Power of Text Recognition',
                    subHeading:
                        'Easily extract text from images with our advanced OCR technology.',
                    controller: controller,
                    imageHeight: 180.h,
                    gapHeight: 45.h,
                  ),
                  OnBoardingContent(
                    lottieAnimation: KImages.lottieOnboardingTwo,
                    heading: 'Say Goodbye to Manual Typing',
                    subHeading:
                        'Our appp uses AI-powered text recognition to convert images into text, saving you time and effort',
                    controller: controller,
                    imageHeight: 250.h,
                    gapHeight: 10.h,
                  ),
                  OnBoardingContent(
                    lottieAnimation: KImages.lottieOnboardingThree,
                    heading: 'Where Images Meet Text',
                    subHeading:
                        'Discover the power of automatic text detection',
                    controller: controller,
                    imageHeight: 300.h,
                    gapHeight: 25.h,
                  )
                ],
              ),
            ),
            Positioned(
              width: MediaQuery.of(context).size.width,
              bottom: 50.h,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SmoothPageIndicator(
                    controller: _pageController,
                    count: 3,
                    effect: const ExpandingDotsEffect(
                        activeDotColor: KColors.primaryColor,
                        dotColor: KColors.secondaryColor,
                        dotHeight: 6),
                  ),
                  SizedBox(
                    height: 48.h,
                  ),
                  PrimaryThemedButton(
                    text: 'Next',
                    onPressed: _onNextPressed,
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  SecondaryOutLinedButton(
                    text: 'Skip',
                    onPressed: _navigateToDashboard,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
