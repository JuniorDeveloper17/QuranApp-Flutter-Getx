import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../core/dependenci/dependency.dart';
import '../../core/theme/theme.dart';

class CustomA extends StatelessWidget {
  final String? title;
  final VoidCallback ompress;
  const CustomA({super.key, required this.title, required this.ompress});

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(
        title!,
        style: GoogleFonts.openSans(
            color: blue1, fontSize: 13, fontWeight: FontWeight.w600),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '${title == 'Nama' ? home.dataUser.value.userName : home.dataUser.value.locationName}',
            style: GoogleFonts.openSans(
                color: black, fontSize: 15, fontWeight: FontWeight.w500),
          ),
          SizedBox(width: 10),
          IconButton(
              onPressed: ompress,
              icon: Icon(
                Icons.edit,
                color: grey,
              ))
        ],
      ),
    ]);
  }
}
