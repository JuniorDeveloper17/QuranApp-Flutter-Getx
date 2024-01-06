import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quranapp/data/model/juz_m.dart' as model;
import '../../../core/dependenci/dependency.dart';
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
          IconButton(
              onPressed: () {
                home.shareMe(
                    surah:
                        'juz ${data.juz}  ayah ${data.verses![index].number?.inQuran}',
                    ayah: '${data.verses?[index].text?.arab}',
                    arti: '${data.verses?[index].tafsir?.id?.long}');
              },
              icon: Icon(Icons.share_outlined, color: blue1)),
          SizedBox(width: 20),
          InkWell(onTap: () {}, child: Icon(Icons.bookmark_add, color: blue2)),
        ],
      ),
    );
  }
}
