import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quranapp/core/dependenci/dependency.dart';
import 'package:quranapp/core/widget/customButtonBar.dart';

import '../../../core/theme/theme.dart';
import '../../../core/widget/customErrorWidget.dart';
import '../widget/customContentSurah.dart';
import '../../../core/widget/customFutureBuilder.dart';
import '../widget/appBar.dart';
import '../widget/bottomShetWidget.dart';

class DetailSurah extends StatelessWidget {
  const DetailSurah({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: grey100,
      body: CustomFutureBuilder(
          futureProvider: () => surah.getDetailSurah(id: Get.arguments),
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
