import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quranapp/core/dependenci/dependency.dart';
import 'package:quranapp/core/widget/customFutureBuilder.dart';

import '../../../core/theme/theme.dart';
import '../../../data/model/tahlil_m.dart';
import '../widget/widgetA.dart';

class TahlilPage extends StatelessWidget {
  const TahlilPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomFutureBuilder(
        futureProvider: () => tahlil.getTahlil(),
        dataBuilder: (p0, data) {
          return ListView.builder(
              physics: BouncingScrollPhysics(),
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              itemCount: data.length,
              itemBuilder: (context, index) {
                TahlilModel? datas = data[index];
                return Padding(
                    padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        WidgetA(index: index),
                        SizedBox(height: 10),
                        Text(
                          "${datas?.title}",
                          style: TextStyle(
                              color: black,
                              fontSize: 15,
                              fontWeight: FontWeight.w500),
                        ),
                        SizedBox(height: 10),
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
        loadingBuilder: (p0) => Text(''),
        errorBuilder: (p0, p1) => Text(''),
      ),
    );
  }
}
