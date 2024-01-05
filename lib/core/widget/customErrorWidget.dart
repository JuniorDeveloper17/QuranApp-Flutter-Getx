import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/theme.dart';

class CustomErrorWidget extends StatelessWidget {
  const CustomErrorWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset('assets/image/not found.png', height: 150),
        SizedBox(height: 10),
        Text(
          'Ups!..terjadi kesalahan pemanggilan data\nperiksa koneksi internet anda',
          style: GoogleFonts.openSans(fontSize: 15, color: blue1),
          textAlign: TextAlign.center,
        ),
      ],
    ));
  }
}
