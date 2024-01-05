import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quranapp/core/dependenci/dependency.dart';
import 'package:quranapp/core/widget/customErrorWidget.dart';
import 'package:quranapp/core/widget/customFutureBuilder.dart';
import 'package:quranapp/tabBarItem/surah/view/detailSurah.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

import '../../../core/theme/theme.dart';

class SurahPage extends StatelessWidget {
  const SurahPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomFutureBuilder(
      futureProvider: () => surah.getAllSurah(),
      dataBuilder: (p0, data) {
        return ListView.builder(
            physics: BouncingScrollPhysics(),
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            itemCount: data.length,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  Get.to(() => DetailSurah(),
                      arguments: '${data[index].number}');
                },
                child: Column(
                  children: [
                    Row(
                      children: [
                        Stack(
                          alignment: Alignment.center,
                          children: [
                            Image.asset(
                              'assets/image/juz.png',
                              width: 70,
                            ),
                            Text(
                              '${data[index].number}',
                              style: GoogleFonts.openSans(color: black),
                            )
                          ],
                        ),
                        SizedBox(width: 7),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '${data[index].name?.transliteration?.id}',
                              style: GoogleFonts.openSans(
                                  color: black,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 15),
                            ),
                            Text(
                              '${data[index].name?.translation?.id}',
                              style: GoogleFonts.openSans(
                                  color: grey, fontSize: 12),
                            )
                          ],
                        ),
                        Expanded(child: SizedBox()),
                        GradientText(
                          '${data[index].name?.short}',
                          style: TextStyle(
                            fontSize: 23.0,
                          ),
                          colors: [
                            blue1,
                            blue2,
                          ],
                        ),
                      ],
                    ),
                    Divider(
                      color: Color.fromARGB(255, 231, 231, 231),
                      thickness: 1.5,
                    )
                  ],
                ),
              );
            });
      },
      loadingBuilder: (p0) => Text(''),
      errorBuilder: (p0, p1) => CustomErrorWidget(),
    );
  }
}
