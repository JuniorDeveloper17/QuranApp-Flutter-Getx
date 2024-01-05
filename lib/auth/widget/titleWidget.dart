import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

import '../../core/theme/theme.dart';


class TitleWidget extends StatelessWidget {
  const TitleWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        SizedBox(height: 50),
        GradientText(
          'Assalamualaikum',
          style: GoogleFonts.openSans(
              color: black, fontSize: 20, fontWeight: FontWeight.w600),
          colors: [
            Color(0xfff07c8f9),
            Color(0xfff0d41e1),
          ],
        ),
        SizedBox(height: 15),
        Text(
          "Dalam sebuah hadits, Nabi Muhammad bersabda: Dari Aisyah RA ia berkata, Rasulullah SAW bersabda, Orang yang membaca Al-Qur'an dan ia mahir membacanya, maka ia bersama para malaikat yang mulia dan berbakti.",
          style: GoogleFonts.openSans(
              color: black, fontSize: 15, fontStyle: FontStyle.italic),
        ),
      ]),
    );
  }
}
