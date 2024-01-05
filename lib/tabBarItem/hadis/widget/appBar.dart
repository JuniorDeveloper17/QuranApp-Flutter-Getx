import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/theme/theme.dart';
import '../../../data/model/detail_hadis_model.dart';

class AppBarWidget extends StatelessWidget {
  final DetailHadisModel data;
  const AppBarWidget({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 130,
      width: Get.width,
      alignment: Alignment.bottomCenter,
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Row(
        children: [
          InkWell(
            onTap: () => Get.back(),
            child: Icon(
              Icons.navigate_before,
              color: black,
              size: 30,
            ),
          ),
          Expanded(
            child: Container(
                height: 100,
                alignment: Alignment.center,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    ShaderMask(
                      child:
                          Image(image: AssetImage('assets/image/frame1.png')),
                      shaderCallback: (bounds) {
                        return LinearGradient(colors: [
                          Color(0xfff07c8f9),
                          Color(0xfff0d41e1),
                        ]).createShader(bounds);
                      },
                      blendMode: BlendMode.srcATop,
                    ),
                    Text(
                      '${data.name}',
                      style: GoogleFonts.openSans(
                          color: black,
                          fontSize: 17,
                          fontWeight: FontWeight.w700),
                    )
                  ],
                )),
          ),
          Icon(
            Icons.search_outlined,
            size: 30,
            color: black,
          )
        ],
      ),
    );
  }
}
