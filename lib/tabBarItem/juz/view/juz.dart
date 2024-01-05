import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../core/theme/theme.dart';
import 'detailJuz.dart';

class JuzPage extends StatelessWidget {
  const JuzPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        itemCount: 30,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              Get.to(() => DetailJuz(), arguments: '${index + 1}');
            },
            child: Container(
              decoration: BoxDecoration(
                  color: index % 2 == 0 ? grey200 : Colors.transparent,
                  border: Border(bottom: BorderSide(color: grey200!))),
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
                            (index + 1).toString(),
                            style: GoogleFonts.openSans(color: black),
                          )
                        ],
                      ),
                      SizedBox(width: 7),
                      Text(
                        'Quran Juz ${index + 1}',
                        style: GoogleFonts.openSans(
                            color: black,
                            fontWeight: FontWeight.w700,
                            fontSize: 15),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        });
  }
}
