import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quranapp/core/theme/theme.dart';

class ButtonBottomBar extends StatelessWidget {
  final VoidCallback onpress;
  const ButtonBottomBar({super.key, required this.onpress});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onpress,
      child: Container(
        height: 10,
        width: Get.width,
        alignment: Alignment.center,
        child: Container(
          height: 10,
          width: Get.width / 2,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              gradient: RadialGradient(colors: [blue1, blue2], radius: 7)),
        ),
      ),
    );
  }
}
