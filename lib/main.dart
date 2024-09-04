import 'package:flutter/material.dart';
import 'package:imagetextrecognition/commons/custom_widgets/lottie_preloader.dart';
import 'package:imagetextrecognition/my_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await LottiePreloader.instance.preloadAnimations();
  runApp(MyApp());
}


