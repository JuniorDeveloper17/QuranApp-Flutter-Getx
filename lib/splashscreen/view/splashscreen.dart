import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quranapp/core/theme/theme.dart';
import 'package:quranapp/splashscreen/controller/splashController.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

class SplashScreen extends StatelessWidget {
  final splash = Get.put(SplashController());
  SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
          statusBarIconBrightness: Brightness.dark,
          statusBarColor: Colors.transparent),
      child: Scaffold(
        body: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Container(
              height: Get.height,
              width: Get.width,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset(
                      'assets/image/frame_bunga.png',
                      opacity: AlwaysStoppedAnimation(.2),
                    ),
                    Image.asset(
                      'assets/image/back.png',
                      opacity: AlwaysStoppedAnimation(.1),
                    ),
                  ]),
            ),
            Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Image.asset('assets/image/logo.png', height: 130),
              SizedBox(height: 10),
              Center(
                child: GradientText(
                  'AL QURAN',
                  style: GoogleFonts.openSans(
                      fontSize: 20.0, fontWeight: FontWeight.bold),
                  colors: [blue1, blue2],
                ),
              )
            ]),
          ],
        ),
      ),
    );
  }
}
