import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quranapp/tabBarItem/doa/view/doa.dart';
import 'package:quranapp/tabBarItem/hadis/view/hadis.dart';
import 'package:quranapp/tabBarItem/juz/view/juz.dart';
import 'package:quranapp/tabBarItem/surah/view/surah.dart';
import 'package:quranapp/tabBarItem/tahlil/view/tahlil.dart';
import '../../core/theme/theme.dart';
import '../widget/quranCompiletion.dart';
import '../widget/tabBar.dart';
import '../widget/titleHome.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: grey100,
      body: Container(
          height: Get.height,
          width: Get.width,
          child: DefaultTabController(
            length: 5,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 40),
                TitleHome(),
                CardQuranCompletion(),
                TabBarWidget(),
                Expanded(
                    child: Container(
                        color: Color.fromARGB(31, 197, 237, 255),
                        child: TabBarView(children: [
                          SurahPage(),
                          JuzPage(),
                          HadisPage(),
                          DoaPage(),
                          TahlilPage()
                        ])))
              ],
            ),
          )),
    );
  }
}
