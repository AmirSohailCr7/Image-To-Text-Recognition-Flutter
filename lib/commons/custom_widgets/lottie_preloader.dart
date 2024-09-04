import 'package:lottie/lottie.dart';
import 'package:imagetextrecognition/commons/image_text_strings.dart';

class LottiePreloader {
  LottiePreloader._privateConstructor();
  static final LottiePreloader instance = LottiePreloader._privateConstructor();

  late LottieBuilder onboardingOne;
  late LottieBuilder onboardingTwo;
  late LottieBuilder onboardingThree;

  Future<void> preloadAnimations() async {
    onboardingOne = await _loadAnimation(KImages.lottieOnboardingOne);
    onboardingTwo = await _loadAnimation(KImages.lottieOnboardingTwo);
    onboardingThree = await _loadAnimation(KImages.lottieOnboardingThree);
  }

  Future<LottieBuilder> _loadAnimation(String url) async {
    // Here we are creating a LottieBuilder instance to preload the animation
    return Lottie.network(url);
  }
}
