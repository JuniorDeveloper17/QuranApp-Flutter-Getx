import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quranapp/core/widget/customButtonBar.dart';
import 'package:quranapp/tabBarItem/juz/widget/appBar.dart';

import '../../../core/dependenci/dependency.dart';
import '../../../core/theme/theme.dart';
import '../../../core/widget/customErrorWidget.dart';
import '../../../core/widget/customFutureBuilder.dart';
import '../widget/bottomShetWidget.dart';
import '../widget/contentCustomJuz.dart';

class DetailJuz extends StatelessWidget {
  const DetailJuz({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: grey100,
      body: CustomFutureBuilder(
          futureProvider: () => juz.getDetailJuz(id: Get.arguments),
          dataBuilder: (p0, data) {
            data?.verses?.forEach(
              (element) {
                audio.add_audio(element.audio?.primary);
              },
            );

            return Container(
              height: Get.height,
              width: Get.width,
              child: Column(children: [
                AppBarWidget(
                  data: data,
                ),
                SizedBox(height: 10),
                ContentSurah(data: data),
                ButtonBottomBar(onpress: () {
                  Get.bottomSheet(BottomSheetWidget(data: data),
                      barrierColor: Color.fromARGB(132, 0, 0, 0));
                })
              ]),
            );
          },
          loadingBuilder: (p0) => Text(''),
          errorBuilder: (p0, p1) => CustomErrorWidget()),
    );
  }
}
