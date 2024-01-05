import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quranapp/core/dependenci/dependency.dart';
import 'package:quranapp/core/theme/theme.dart';
import 'package:quranapp/sholat/view/kiblat.dart';
import 'package:screenshot/screenshot.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

class TitleWidget extends StatelessWidget {
  final ScreenshotController controller;
  TitleWidget({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      width: Get.width,
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Text(
          'Now',
          style:
              GoogleFonts.openSans(color: black, fontWeight: FontWeight.w600),
        ),
        StreamBuilder(
            stream: sholat.clock_now(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Text(
                  '00:00',
                  style: TextStyle(
                      fontSize: 40.0, fontWeight: FontWeight.bold, color: grey),
                );
              }
              return Column(
                children: [
                  GradientText(
                    '${sholat.twodigits(snapshot.data!.hour)}:${sholat.twodigits(snapshot.data!.minute)}',
                    style:
                        TextStyle(fontSize: 40.0, fontWeight: FontWeight.bold),
                    colors: [
                      blue1,
                      blue2,
                    ],
                  ),
                ],
              );
            }),
        SizedBox(height: 5),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
                onTap: () {
                  Get.to(QiblatView());
                },
                child: Icon(Icons.compass_calibration)),
            SizedBox(width: 20),
            Text(
              'INDONESIA / ${home.dataUser.value.locationName}',
              style: GoogleFonts.openSans(color: grey, fontSize: 13),
            ),
            SizedBox(width: 20),
            InkWell(
                onTap: () {
                  sholat.share(controller: controller);
                },
                child: Icon(Icons.share))
          ],
        ),
      ]),
    );
  }
}
