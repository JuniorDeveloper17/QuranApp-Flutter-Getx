import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quranapp/core/dependenci/dependency.dart';
import '../../core/theme/theme.dart';
import '../../core/widget/drobdownLocation.dart';

class WidgetBottomSheet extends StatelessWidget {
  final String title;
  const WidgetBottomSheet({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180,
      width: Get.width,
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(color: blue2, offset: Offset(0, -2), blurRadius: 5)
          ],
          color: white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20))),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(
          title,
          style: TextStyle(
              color: black, fontSize: 15, fontWeight: FontWeight.w600),
        ),
        SizedBox(height: 10),
        title == 'Nama'
            ? TextField(
                controller: auth.username,
                decoration: InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  hintText: 'username',
                  hintStyle: GoogleFonts.openSans(color: black, fontSize: 13),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: blue1, width: 1)),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: blue1, width: 1)),
                ))
            : DorpdownLocation(),
        Expanded(child: SizedBox()),
        Row(
          children: [
            Flexible(
                child: ElevatedButton(
              child: Text(
                'Batal',
                style: TextStyle(color: black, fontSize: 15),
              ),
              onPressed: () => Get.back(),
              style: ElevatedButton.styleFrom(
                  backgroundColor: grey200, fixedSize: Size(Get.width, 45)),
            )),
            SizedBox(width: 20),
            Flexible(
                child: ElevatedButton(
              child: Text(
                'Simpan',
                style: TextStyle(color: white, fontSize: 15),
              ),
              onPressed: () {
                if (title == 'Nama') {
                  home.updateUserData(
                      key: 'username', value: auth.username.text);
                } else {
                  home.updateUserData(
                      key: 'locationName', value: auth.locationName.value);
                  home.updateUserData(
                      key: 'idLocation', value: auth.idLocation.value);
                }
                Get.back();
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: blue1, fixedSize: Size(Get.width, 45)),
            ))
          ],
        )
      ]),
    );
  }
}
