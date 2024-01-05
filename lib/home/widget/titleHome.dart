import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quranapp/core/dependenci/dependency.dart';
import 'package:quranapp/setting/view/setting.dart';
import 'package:quranapp/sholat/view/JadwalSholat.dart';
import '../../core/theme/theme.dart';

class TitleHome extends StatelessWidget {
  TitleHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width - 20,
      height: 70,
      padding: EdgeInsets.only(top: 10),
      child: Row(
        children: [
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(
              'Assalamuallaikum',
              style: GoogleFonts.openSans(
                  color: grey, fontSize: 16, fontWeight: FontWeight.w500),
            ),
            Text(
              '${home.dataUser.value.userName}',
              style: GoogleFonts.openSans(
                  height: 1.5,
                  color: blue2,
                  fontSize: 20,
                  fontWeight: FontWeight.w800),
            )
          ]),
          Expanded(child: SizedBox()),
          IconButton(
            onPressed: () => Get.to(JadwalSholat()),
            icon: ImageIcon(
              AssetImage('assets/image/adzan.png'),
              size: 30,
              color: black,
            ),
          ),
          IconButton(
              onPressed: () => Get.to(() => SettingView()),
              icon: Icon(
                Icons.settings,
                color: black,
                size: 30,
              ))
        ],
      ),
    );
  }
}
