import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widget/bodyWidget.dart';
import '../widget/titleWidget.dart';

class AuthView extends StatelessWidget {
  const AuthView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Container(
            height: Get.height,
            width: Get.width,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    'assets/image/frame_bunga.png',
                    fit: BoxFit.cover,
                    opacity: AlwaysStoppedAnimation(.1),
                  ),
                  Image.asset(
                    'assets/image/back.png',
                    fit: BoxFit.cover,
                    opacity: AlwaysStoppedAnimation(.1),
                  ),
                ]),
          ),
          ListView(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              children: [TitleWidget(), BodyWidget()]),
        ],
      ),
    );
  }
}
