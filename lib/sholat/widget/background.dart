import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/theme/theme.dart';

class Background extends StatelessWidget {
  const Background({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Container(
          height: Get.height,
          width: Get.width,
          alignment: Alignment.topCenter,
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
            blue1,
            blue2,
          ])),
        ),
        Align(
          alignment: Alignment.topCenter,
          child: Padding(
            padding: const EdgeInsets.only(top: 30),
            child: Image.asset(
              'assets/image/pngwing.com.png',
              color: grey100,
            ),
          ),
        ),
        Container(
          height: Get.height / 1.5,
          width: Get.width,
          color: grey100,
        ),
      ],
    );
  }
}
