import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quranapp/data/model/surah_m.dart' as model;
import '../../../core/theme/theme.dart';
import '../widget/appBar.dart';
import '../widget/widgetTopTafsir.dart';

class TafsirSurah extends StatelessWidget {
  final model.DetailModel data;
  const TafsirSurah({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: Get.height,
        width: Get.width,
        child: Column(children: [
          AppBarWidget(data: data),
          Expanded(
              child: ListView.builder(
                  physics: BouncingScrollPhysics(),
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  itemCount: data.verses?.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        TafsirTop(data: data, index: index),
                        SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            SizedBox(
                              width: Get.width - 20,
                              child: RichText(
                                  textAlign: TextAlign.right,
                                  textDirection: TextDirection.rtl,
                                  text: TextSpan(
                                    children: <InlineSpan>[
                                      TextSpan(
                                        text:
                                            '${data.verses?[index].text?.arab}',
                                        style: GoogleFonts.openSans(
                                            color: black,
                                            fontSize: 25,
                                            height: 1.5),
                                      ),
                                      WidgetSpan(
                                          alignment:
                                              PlaceholderAlignment.middle,
                                          child: Padding(
                                            padding:
                                                const EdgeInsets.only(right: 0),
                                            child: Stack(
                                              alignment: Alignment.center,
                                              children: [
                                                Image.asset(
                                                  'assets/image/juz.png',
                                                  height: 60,
                                                  color: green,
                                                ),
                                                Text(
                                                  '${data.verses?[index].number?.inSurah}',
                                                  style: GoogleFonts.openSans(
                                                      fontSize: 14,
                                                      color: black,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                )
                                              ],
                                            ),
                                          ))
                                    ],
                                  )),
                            ),
                          ],
                        ),
                        SizedBox(height: 5),
                        RichText(
                            text: TextSpan(children: [
                          TextSpan(
                            text: '${data.verses?[index].tafsir?.id.long}',
                            style: GoogleFonts.openSans(
                                color: black,
                                fontStyle: FontStyle.italic,
                                fontSize: 15,
                                fontWeight: FontWeight.w400),
                          )
                        ])),
                        SizedBox(height: 20)
                      ],
                    );
                  }))
        ]),
      ),
    );
  }
}
