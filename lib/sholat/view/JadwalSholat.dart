import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quranapp/core/dependenci/dependency.dart';
import 'package:screenshot/screenshot.dart';
import '../../core/theme/theme.dart';
import '../widget/background.dart';
import '../widget/listWidget.dart';
import '../widget/rootWidget.dart';
import '../widget/titleWidget.dart';

class JadwalSholat extends StatelessWidget {
  const JadwalSholat({super.key});

  @override
  Widget build(BuildContext context) {
    ScreenshotController screenshotController = ScreenshotController();
    return Screenshot(
      key: Key('${0}'),
      controller: screenshotController,
      child: Scaffold(
          backgroundColor: grey100,
          body: Container(
            height: Get.height,
            width: Get.width,
            child: Stack(alignment: Alignment.bottomCenter, children: [
              Background(),
              Container(
                height: Get.height / 1.15,
                width: Get.width,
                child: Column(children: [
                  TitleWidget(controller : screenshotController),
                  Obx(() =>
                      sholat.all.isTrue ? WidgetListJadwal() : RootWidget())
                ]),
              ),
            ]),
          )),
    );
  }
}
