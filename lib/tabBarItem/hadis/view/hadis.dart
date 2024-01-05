import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quranapp/core/dependenci/dependency.dart';
import 'package:quranapp/tabBarItem/hadis/view/detailHadis.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

import '../../../core/theme/theme.dart';
import '../../../core/widget/customErrorWidget.dart';
import '../../../core/widget/customFutureBuilder.dart';

class HadisPage extends StatelessWidget {
  const HadisPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomFutureBuilder(
        futureProvider: () => hadis.getPerawiHadis(),
        dataBuilder: (p0, data) {
          return ListView.builder(
              physics: BouncingScrollPhysics(),
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
              itemCount: data.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Get.to(DetailHadis(), arguments: data[index]?.id);
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
                                '${index + 1}',
                                style: GoogleFonts.openSans(color: black),
                              )
                            ],
                          ),
                          SizedBox(width: 7),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '${data[index]?.name}',
                                style: GoogleFonts.openSans(
                                    color: black,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 15),
                              ),
                              Text(
                                '${data[index]?.id}',
                                style: GoogleFonts.openSans(
                                    color: grey, fontSize: 13),
                              )
                            ],
                          ),
                          Expanded(child: SizedBox()),
                          GradientText(
                            '${data[index]?.available}',
                            style: TextStyle(
                                fontSize: 18.0, fontWeight: FontWeight.w600),
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
        errorBuilder: (p0, p1) => CustomErrorWidget());
  }
}
