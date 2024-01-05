import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../core/theme/theme.dart';


class WidgetListJadwal extends StatelessWidget {
  const WidgetListJadwal({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        child: ListView.builder(
            physics: BouncingScrollPhysics(),
            padding: EdgeInsets.symmetric(vertical: 10),
            itemCount: 10,
            itemBuilder: (context, index) {
              return Container(
                height: 400,
                width: Get.width,
                child: Stack(
                  children: [
                    ShaderMask(
                      child: Image(image: AssetImage('assets/image/frame2.png')),
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
                          horizontal: 30, vertical: 25),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'Rabu, 15/12/2023',
                            style: GoogleFonts.openSans(
                                color: black,
                                fontSize: 17,
                                fontWeight: FontWeight.w700),
                          ),
                          SizedBox(height: 10),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: List.generate(8, (index) {
                              return Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Isya',
                                        style: GoogleFonts.openSans(
                                            color: black,
                                            fontSize: 15,
                                            fontWeight: FontWeight.w400),
                                      ),
                                      Text(
                                        '19:20',
                                        style: GoogleFonts.openSans(
                                            color: black,
                                            fontSize: 15,
                                            fontWeight: FontWeight.w400),
                                      ),
                                    ],
                                  ),
                                  Container(
                                    height: 2,
                                    margin: EdgeInsets.symmetric(vertical: 8),
                                    width: Get.width,
                                    decoration: BoxDecoration(
                                        gradient: LinearGradient(colors: [
                                      Color(0xfff07c8f9),
                                      Color(0xfff0d41e1),
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
              );
            }),
      ),
    );
  }
}