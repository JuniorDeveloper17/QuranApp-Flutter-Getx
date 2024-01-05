import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quranapp/data/model/juz_m.dart' as model;
import '../../../core/theme/theme.dart';

class TafsirTop extends StatelessWidget {
  final model.JuzModel data;
  final int index;
  const TafsirTop({super.key, required this.data, required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      height: 45,
      padding: EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: grey200),
      child: Row(
        children: [
       
          Expanded(child: SizedBox()),
          Icon(Icons.share_outlined, color: blue1),
          SizedBox(width: 20),
          InkWell(onTap: () {}, child: Icon(Icons.bookmark_add, color: blue2)),
        ],
      ),
    );
  }
}
