import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quranapp/core/dependenci/dependency.dart';
import 'package:quranapp/core/widget/customFutureBuilder.dart';
import 'package:quranapp/data/model/doa_m.dart';

import '../../../core/theme/theme.dart';
import '../../../core/widget/customErrorWidget.dart';

class DoaPage extends StatelessWidget {
  const DoaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomFutureBuilder(
        futureProvider: () => doa.getDoa(),
        dataBuilder: (p0, data) {
          return ListView.builder(
              physics: BouncingScrollPhysics(),
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              itemCount: data.length,
              itemBuilder: (context, index) {
                DoaHarian? datas = data[index];
                return Padding(
                    padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                    child: Column(
                      children: [
                        Container(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            width: double.maxFinite,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.lightBlue[50]),
                            child: Row(
                              children: [
                                Flexible(
                                  fit: FlexFit.tight,
                                  child: Container(
                                    alignment: Alignment.centerLeft,
                                    child: Row(
                                      children: [
                                        CircleAvatar(
                                          maxRadius: 25,
                                          backgroundColor: Colors.transparent,
                                          backgroundImage: AssetImage(
                                              "assets/image/juz.png"),
                                          child: Text(
                                            "${index + 1}",
                                            style: TextStyle(
                                                fontSize: 10,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Text(
                                          "${datas?.title}",
                                          style: TextStyle(
                                              color: Colors.grey, fontSize: 15),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                IconButton(
                                    onPressed: () {
                                      home.shareMe(
                                          surah: '${data[index]?.title}',
                                          ayah: '${data[index]?.arabic}',
                                          arti: '${data[index]?.latin}');
                                    },
                                    icon: Icon(
                                      Icons.share,
                                      color: Colors.lightBlue,
                                      size: 18,
                                    )),
                              ],
                            )),
                        Container(
                          padding: EdgeInsets.all(5),
                          margin: EdgeInsets.only(left: 30, right: 5),
                          alignment: Alignment.topRight,
                          child: Text(
                            "${datas?.arabic}",
                            style: GoogleFonts.openSans(
                                color: black, fontSize: 25, height: 1.5),
                            textAlign: TextAlign.end,
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 5, right: 5),
                          alignment: Alignment.topRight,
                          child: Text(
                            "${datas?.latin}",
                            style: TextStyle(color: Colors.grey),
                          ),
                        ),
                        SizedBox(height: 15),
                        Container(
                            padding:
                                EdgeInsets.only(left: 5, right: 5, bottom: 5),
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "${datas?.translation}",
                              style: TextStyle(
                                  fontStyle: FontStyle.italic,
                                  color: Colors.grey,
                                  fontWeight: FontWeight.w300),
                            ))
                      ],
                    ));
              });
        },
        errorBuilder: (p0, p1) => CustomErrorWidget(),
        loadingBuilder: (p0) => Text(''),
      ),
    );
  }
}
