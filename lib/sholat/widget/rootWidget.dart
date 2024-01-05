import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quranapp/core/dependenci/dependency.dart';
import 'package:quranapp/core/theme/theme.dart';
import 'package:quranapp/core/widget/customFutureBuilder.dart';

import '../../core/widget/customButtonBar.dart';
import '../../core/widget/customErrorWidget.dart';

class RootWidget extends GetView {
  RootWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomFutureBuilder(
      futureProvider: () => sholat.getJadwalSholat(),
      dataBuilder: (p0, data) {
        if (sholat.jadwalSholatPerhari.length == 0) {
          sholat.addAllJadwalSholat(data!.jadwal!);
        }
        return Expanded(
            child: ListView(
          physics: BouncingScrollPhysics(),
          padding: EdgeInsets.zero,
          children: [
            SizedBox(height: 20),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              height: 160,
              width: Get.width,
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              decoration: BoxDecoration(
                  gradient: RadialGradient(colors: [
                    blue1,
                    blue2,
                  ], radius: 2),
                  borderRadius: BorderRadius.circular(10)),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'WAKTU SHOLAT',
                      style: GoogleFonts.openSans(
                          color: white,
                          fontSize: 17,
                          fontWeight: FontWeight.w700),
                    ),
                    Text(
                      '${data?.jadwal?.date}',
                      style: GoogleFonts.openSans(
                          color: grey200,
                          height: 1.7,
                          fontSize: 13,
                          fontWeight: FontWeight.w500),
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: List.generate(5, (index) {
                        return Column(
                          children: [
                            sholat.icon_waktu_sholat[index],
                            SizedBox(height: 10),
                            Center(
                              child: Text(
                                '${sholat.jadwalSholatPerhari[index]}',
                                style: GoogleFonts.openSans(
                                    color: white,
                                    fontSize: 13,
                                    fontWeight: FontWeight.w700),
                                textAlign: TextAlign.center,
                              ),
                            )
                          ],
                        );
                      }),
                    )
                  ]),
            ),
            SizedBox(height: 10),
            Container(
              width: Get.width,
              child: Stack(
                children: [
                  ShaderMask(
                    child: Image(
                        fit: BoxFit.fitWidth,
                        image: AssetImage('assets/image/frame2.png')),
                    shaderCallback: (bounds) {
                      return LinearGradient(colors: [
                        blue1,
                        blue2,
                      ]).createShader(bounds);
                    },
                    blendMode: BlendMode.srcATop,
                  ),
                  Container(
                    width: Get.width,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 40, vertical: 35),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          '${data?.jadwal?.tanggal}',
                          style: GoogleFonts.openSans(
                              color: black,
                              fontSize: 17,
                              fontWeight: FontWeight.w700),
                        ),
                        SizedBox(height: 10),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children:
                              List.generate(sholat.keyJadwal.length, (index) {
                            return Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      '${sholat.keyJadwal[index]}',
                                      style: GoogleFonts.openSans(
                                          color: black,
                                          fontSize: 15,
                                          fontWeight: FontWeight.w400),
                                    ),
                                    Text(
                                      '${sholat.allJadwalSholat[index]}',
                                      style: GoogleFonts.openSans(
                                          color: black,
                                          fontSize: 15,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ],
                                ),
                                Container(
                                  height: 1,
                                  margin: EdgeInsets.symmetric(vertical: 8),
                                  width: Get.width,
                                  decoration: BoxDecoration(
                                      gradient: LinearGradient(colors: [
                                    blue1,
                                    blue2,
                                  ])),
                                )
                              ],
                            );
                          }),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: 20),
            ButtonBottomBar(onpress: () => null)
          ],
        ));
      },
      loadingBuilder: (p0) => Text(''),
      errorBuilder: (p0, p1) => CustomErrorWidget(),
    );
  }
}
