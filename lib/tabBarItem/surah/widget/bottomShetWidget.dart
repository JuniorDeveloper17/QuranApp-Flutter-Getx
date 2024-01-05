import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quranapp/core/dependenci/dependency.dart';
import 'package:quranapp/core/theme/theme.dart';
import 'package:quranapp/tabBarItem/surah/view/tafsir.dart';
import '../../../core/widget/customButtonBar.dart';
import '../../../data/model/surah_m.dart' as model;

class BottomSheetWidget extends StatelessWidget {
  final model.DetailModel? data;
  BottomSheetWidget({super.key, required this.data});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height,
      width: Get.width,
      child: Stack(
        children: [
          Container(
            margin: EdgeInsets.only(top: 3),
            width: Get.width,
            height: Get.height,
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [blue1, blue2],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20))),
            child: Stack(children: [
              Image.asset(
                'assets/image/lentera.png',
                opacity: AlwaysStoppedAnimation(.03),
              ),
              SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Column(children: [
                  SizedBox(height: 10),
                  Center(
                    child: Text(
                      '${data?.name?.long}',
                      style: GoogleFonts.openSans(fontSize: 25, color: white),
                    ),
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                            color: grey,
                            border: Border.all(color: grey200!),
                            image: DecorationImage(
                                image: AssetImage('assets/image/pembaca.png')),
                            borderRadius: BorderRadius.circular(360)),
                      ),
                      SizedBox(width: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Misyari Rasyid Al-'Afasi",
                            style: GoogleFonts.openSans(
                                color: white,
                                fontSize: 15,
                                fontWeight: FontWeight.w600),
                          ),
                          Obx(() => audio.indexPlay == 0
                              ? Text(
                                  "Ayah",
                                  style: GoogleFonts.openSans(
                                      color: white, fontSize: 13),
                                )
                              : Text(
                                  "Ayah ${audio.indexPlay.value} / ${audio.audio.length + 1}",
                                  style: GoogleFonts.openSans(
                                      color: white, fontSize: 13),
                                ))
                        ],
                      ),
                      Expanded(child: SizedBox()),
                      IconButton(
                          onPressed: () {
                            audio.previus(false);
                          },
                          icon: Icon(
                            Icons.skip_previous,
                            color: white,
                            size: 35,
                          )),
                      IconButton(
                        onPressed: () {
                          audio.play(audio.indexPlay.value);
                        },
                        icon: Obx(
                          () => audio.isPlay.isFalse
                              ? Icon(
                                  Icons.play_circle,
                                  color: white,
                                  size: 35,
                                )
                              : Icon(
                                  Icons.pause_circle,
                                  color: white,
                                  size: 35,
                                ),
                        ),
                      ),
                      IconButton(
                          onPressed: () {
                            audio.previus(true);
                          },
                          icon: Icon(
                            Icons.skip_next,
                            color: white,
                            size: 30,
                          ))
                    ],
                  ),
                  SizedBox(height: 30),
                  SizedBox(
                    width: Get.width,
                    child: Obx(() => audio.isLoading.isTrue
                        ? Center(
                            child: CircularProgressIndicator(
                            color: white,
                          ))
                        : audio.indexPlay == 0
                            ? SizedBox()
                            : SizedBox(
                                width: Get.width,
                                child: Text(
                                  '${data!.verses![audio.indexPlay.value - 1].text!.arab}',
                                  style: GoogleFonts.openSans(
                                      color: white, fontSize: 25),
                                  textAlign: TextAlign.end,
                                ))),
                  ),
                  SizedBox(height: 20),
                  Align(
                      alignment: Alignment.bottomLeft,
                      child: Text(
                        'Tafsir',
                        style: GoogleFonts.openSans(
                            color: white,
                            fontSize: 17,
                            fontWeight: FontWeight.w700),
                      )),
                  SizedBox(height: 15),
                  Align(
                      alignment: Alignment.bottomLeft,
                      child: Text(
                        '${data?.tafsir?.id}',
                        style: GoogleFonts.openSans(
                            color: white,
                            fontSize: 13,
                            fontWeight: FontWeight.w500),
                      )),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () => Get.to(() => TafsirSurah(data: data!)),
                    child: Text(
                      'Tafsir surah ${data?.name?.transliteration?.id}',
                      style: TextStyle(color: blue1, fontSize: 15),
                    ),
                    style: ElevatedButton.styleFrom(
                        backgroundColor: grey200,
                        fixedSize: Size(Get.width, 45),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10))),
                  )
                ]),
              )
            ]),
          ),
          InkWell(
              onTap: () => Get.back(),
              child: ButtonBottomBar(
                onpress: () => Get.back(),
              )),
        ],
      ),
    );
  }
}
