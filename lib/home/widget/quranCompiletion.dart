import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quranapp/core/dependenci/dependency.dart';
import 'package:quranapp/core/theme/theme.dart';

class CardQuranCompletion extends StatelessWidget {
  const CardQuranCompletion({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Container(
          height: 140,
          width: Get.width - 20,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              gradient: LinearGradient(colors: [blue1, blue2])),
        ),
        Container(
          height: 160,
          width: Get.width - 20,
          alignment: Alignment.topRight,
          child: Image.asset(
            'assets/image/logo.png',
            width: 160,
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          height: 130,
          width: Get.width - 20,
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Quran Completion',
                  style: GoogleFonts.openSans(
                      color: white, fontWeight: FontWeight.w800, fontSize: 18),
                ),
                Obx(() => Text(
                      '${home.dataUser.value.historis!.lastRead == null ? 'Belum Ada Riwayat' : 'Last Read ${home.dataUser.value.historis?.lastRead}'}',
                      style: GoogleFonts.openSans(
                          color: white, fontSize: 13, height: 1.5),
                    )),
                SizedBox(height: 20),
                InkWell(
                  onTap: () {
                    print(home.dataUser.value.historis?.ayah);
                  },
                  child: Container(
                    width: Get.width / 2.5,
                    height: 30,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: const Color.fromARGB(113, 255, 255, 255),
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: grey100!)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          'Continue read',
                          style: GoogleFonts.openSans(
                              fontSize: 15,
                              color: white,
                              fontWeight: FontWeight.w600),
                        ),
                        Icon(
                          Icons.navigate_next,
                          color: white,
                        )
                      ],
                    ),
                  ),
                )
              ]),
        )
      ],
    );
  }
}
