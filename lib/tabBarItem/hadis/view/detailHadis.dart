import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quranapp/core/dependenci/dependency.dart';
import '../../../core/theme/theme.dart';
import '../../../core/widget/customErrorWidget.dart';
import '../../../core/widget/customFutureBuilder.dart';
import '../widget/appBar.dart';
import '../widget/contentDetailHadis.dart';

class DetailHadis extends StatelessWidget {
  const DetailHadis({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: grey100,
        body: CustomFutureBuilder(
          futureProvider: () => hadis.getDetailHadis(id: Get.arguments),
          dataBuilder: (p0, data) {
            return Container(
              height: Get.height,
              width: Get.width,
              child: Column(children: [
                AppBarWidget(data: data!),
                ContentHadis(data: data)
              ]),
            );
          },
          errorBuilder: (p0, p1) => CustomErrorWidget(),
          loadingBuilder: (p0) =>Text('')
        ));
  }
}
