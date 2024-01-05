import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quranapp/core/dependenci/dependency.dart';
import 'package:quranapp/core/theme/theme.dart';

import '../widget/widgetA.dart';

class SettingView extends StatelessWidget {
  const SettingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 50,
        backgroundColor: grey100,
        leading: IconButton(
          icon: Icon(Icons.navigate_before, color: black, size: 30),
          onPressed: () => Get.back(),
        ),
        title: Text(
          'Setting',
          style:
              GoogleFonts.openSans(color: black, fontWeight: FontWeight.w600),
        ),
      ),
      body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 30),
              CustomA(
                ompress: () => setting.openSnackbar(title: 'Nama'),
                title: 'Nama',
              ),
              SizedBox(height: 10),
              CustomA(
                ompress: () => setting.openSnackbar(title: 'Location'),
                title: 'Location',
              ),
              Divider(
                height: 50,
                thickness: 1,
              ),
              Text(
                'Masukan dan saran',
                style: GoogleFonts.openSans(
                    color: blue1, fontSize: 13, fontWeight: FontWeight.w600),
              ),
              SizedBox(height: 20),
              TextField(
                maxLines: 6,
                controller: setting.messege,
                decoration: InputDecoration(
                    filled: true,
                    fillColor: grey200,
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(10)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(10))),
              ),
              SizedBox(height: 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(
                      onPressed: () => setting.sendMessege(),
                      child: Row(
                        children: [
                          Icon(
                            Icons.send,
                            color: blue1,
                            size: 20,
                          ),
                          SizedBox(width: 5),
                          Text('send')
                        ],
                      ))
                ],
              )
            ],
          )),
    );
  }
}
