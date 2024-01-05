import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quranapp/core/dependenci/dependency.dart';
import '../../core/theme/theme.dart';
import '../../core/widget/drobdownLocation.dart';

class BodyWidget extends StatelessWidget {
  const BodyWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: Column(children: [
        SizedBox(height: 50),
        Image.asset(
          'assets/image/ngaji.png',
          height: 200,
        ),
        SizedBox(height: 20),
        TextField(
            onEditingComplete: () {
              FocusScope.of(context).unfocus();
              new TextEditingController().clear();
            },
            controller: auth.username,
            style: GoogleFonts.openSans(color: black, fontSize: 15),
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              hintText: 'username',
              hintStyle: GoogleFonts.openSans(color: black, fontSize: 13),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: blue1, width: 1)),
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: blue1, width: 1)),
            )),
        SizedBox(height: 10),
        DorpdownLocation(),
        SizedBox(height: 10),
        InkWell(
          onTap: () {
            auth.SaveData();
          },
          child: Container(
            height: 45,
            width: Get.width,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                gradient: RadialGradient(
                    colors: [Color(0xfff07c8f9), Color(0xfff0d41e1)],
                    radius: 4)),
            child: Text(
              'Masuk',
              style: GoogleFonts.openSans(
                  color: white, fontSize: 17, fontWeight: FontWeight.w700),
            ),
          ),
        )
      ]),
    );
  }
}
