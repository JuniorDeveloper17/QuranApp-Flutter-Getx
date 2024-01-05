import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tabbar_gradient_indicator/tabbar_gradient_indicator.dart';
import '../../core/theme/theme.dart';

class TabBarWidget extends StatelessWidget {
  const TabBarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      SizedBox(height: 10),
      Container(
        height: 50,
        width: Get.width,
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: TabBar(
            tabs: [
              Text('SURAH'),
              Text('JUZ'),
              Text('HADIS'),
              Text('DOA'),
              Text('TAHLIL')
            ],
            labelColor: blue1,
            unselectedLabelColor: grey,
            labelStyle:
                GoogleFonts.openSans(fontSize: 13, fontWeight: FontWeight.w600),
            labelPadding: EdgeInsets.only(bottom: 15),
            indicator: TabBarGradientIndicator(
                gradientColor: [blue2, blue1], indicatorWidth: 3)),
      ),
    ]);
  }
}
