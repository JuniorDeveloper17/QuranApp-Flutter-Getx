import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quranapp/core/theme/theme.dart';
import '../../../data/model/detail_hadis_model.dart';

class ContentHadis extends StatelessWidget {
  final DetailHadisModel data;
  const ContentHadis({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: ListView.builder(
            padding: EdgeInsets.symmetric(horizontal: 10),
            itemCount: data.hadiths?.length,
            itemBuilder: (context, index) {
              return Container(
                margin: EdgeInsets.only(bottom: 10),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                        height: 40,
                        width: Get.width,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            gradient: LinearGradient(colors: [
                             blue1,
                            blue2,
                            ])),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                'No ${data.hadiths?[index].number}',
                                style: GoogleFonts.openSans(
                                    color: white,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w700),
                              ),
                              Expanded(child: SizedBox()),
                              Icon(Icons.bookmark_add, size: 25, color: white),
                              SizedBox(width: 20),
                              Icon(
                                Icons.share,
                                size: 25,
                                color: white,
                              )
                            ]),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          SizedBox(
                            width: Get.width - 20,
                            child: RichText(
                                textAlign: TextAlign.right,
                                textDirection: TextDirection.rtl,
                                text: TextSpan(
                                  children: <InlineSpan>[
                                    TextSpan(
                                      text: '${data.hadiths?[index].arab}',
                                      style: GoogleFonts.openSans(
                                          color: black,
                                          fontSize: 25,
                                          height: 1.5),
                                    ),
                                    WidgetSpan(
                                        alignment: PlaceholderAlignment.middle,
                                        child: Padding(
                                          padding:
                                              const EdgeInsets.only(right: 5),
                                          child: Stack(
                                            alignment: Alignment.center,
                                            children: [
                                              Image.asset(
                                                'assets/image/juz.png',
                                                height: 60,
                                                color: green,
                                              ),
                                              Text(
                                                '${data.hadiths?[index].number}',
                                                style: GoogleFonts.openSans(
                                                    fontSize: 14,
                                                    color: black,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              )
                                            ],
                                          ),
                                        ))
                                  ],
                                )),
                          ),
                        ],
                      ),
                      SizedBox(height: 15),
                      Row(
                        children: [
                          SizedBox(
                            width: 15,
                          ),
                          Expanded(
                            child: RichText(
                                text: TextSpan(children: [
                              TextSpan(
                                  text: 'Artinya: ',
                                  style: GoogleFonts.openSans(
                                      fontSize: 12,
                                      color: black,
                                      fontWeight: FontWeight.w500)),
                              TextSpan(
                                text: '${data.hadiths?[index].id}',
                                style: GoogleFonts.openSans(
                                    color: black,
                                    fontStyle: FontStyle.italic,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500),
                              )
                            ])),
                          ),
                        ],
                      ),
                    ]),
              );
            }));
  }
}
