import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quranapp/core/dependenci/dependency.dart';
import 'package:quranapp/core/theme/theme.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import '../../../data/model/juz_m.dart' as model;

class ContentSurah extends StatelessWidget {
  final model.JuzModel? data;
  ContentSurah({super.key, required this.data});
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: ListView.builder(
            physics: BouncingScrollPhysics(),
            padding: EdgeInsets.symmetric(vertical: 10),
            itemCount: data?.verses?.length,
            itemBuilder: (_, index) {
              return Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                color: index % 2 == 0
                    ? Colors.transparent
                    : Color.fromARGB(24, 33, 149, 243),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        IconButton(
                            onPressed: () {
                              home.updateUserData(
                                  key: 'lastRead',
                                  value:
                                      '${data?.verses?[index].text?.transliteration?.en} ayah  ${data?.verses?[index].number?.inSurah} | ${data?.verses?[index].text?.arab} | ${data?.verses?[index].translation!.id}');
                            },
                            icon: Obx(
                              () => Icon(
                                Icons.bookmark_add_outlined,
                                color:
                                    '${home.dataUser.value.historis?.ayah}' ==
                                            '${data?.verses?[index].text?.arab}'
                                        ? blue1
                                        : black,
                              ),
                            )),
                        SizedBox(width: 15),
                        Icon(
                          Icons.share,
                          color: black,
                          size: 25,
                        ),
                      ],
                    ),
                    SizedBox(height: 5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        SizedBox(
                          width: Get.width - 20,
                          child: Obx(
                            () => RichText(
                                textAlign: TextAlign.right,
                                textDirection: TextDirection.rtl,
                                text: TextSpan(
                                  children: <InlineSpan>[
                                    TextSpan(
                                      text:
                                          '${data?.verses?[index].text?.arab}',
                                      style: GoogleFonts.openSans(
                                          color: audio.indexPlay != index + 1
                                              ? black
                                              : green,
                                          fontSize: 25,
                                          height: 1.5),
                                    ),
                                    WidgetSpan(
                                        alignment: PlaceholderAlignment.middle,
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
                                                '${data?.verses?[index].number?.inSurah}',
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
                        ),
                      ],
                    ),
                    SizedBox(height: 15),
                    GradientText(
                      '${data?.verses?[index].text?.transliteration?.en}',
                      style: TextStyle(
                          fontSize: 17.0, fontWeight: FontWeight.w500),
                      textAlign: TextAlign.left,
                      colors: [blue2, blue1],
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        SizedBox(
                          width: 15,
                        ),
                        Expanded(
                          child: RichText(
                              text: TextSpan(children: [
                            TextSpan(
                                text: 'Artinya: ',
                                style: GoogleFonts.openSans(
                                    fontSize: 12,
                                    color: black,
                                    fontWeight: FontWeight.w500)),
                            TextSpan(
                              text: '${data?.verses?[index].translation?.id}',
                              style: GoogleFonts.openSans(
                                  color: black,
                                  fontStyle: FontStyle.italic,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500),
                            )
                          ])),
                        ),
                      ],
                    ),
                    SizedBox(height: 20)
                  ],
                ),
              );
            }));
  }
}
