import 'package:flutter/material.dart';
import 'package:flutter_compass/flutter_compass.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:permission_handler/permission_handler.dart';
import 'dart:math' as math;
import 'package:quranapp/core/dependenci/dependency.dart';
import '../../core/theme/theme.dart';
import '../widget/customButton.dart';

class QiblatView extends StatefulWidget {
  const QiblatView({super.key});

  @override
  State<QiblatView> createState() => _QiblatViewState();
}

class _QiblatViewState extends State<QiblatView> {
  void initState() {
    super.initState();
    Permission.locationWhenInUse.request().then((ignored) {
      setState(() {
        fetchPermissionStatus();
      });
    });
  }

  void fetchPermissionStatus() {
    Permission.locationWhenInUse.status.then((status) {
      if (mounted) {
        setState(() {
          sholat.hasPermissions = status == PermissionStatus.granted;
          print(sholat.hasPermissions);
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: white,
        elevation: 0,
        automaticallyImplyLeading: false,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_left,
            color: black,
            size: 40,
          ),
          onPressed: () {
            Get.back();
          },
        ),
        title: Text(
          'Compas',
          style: GoogleFonts.openSans(
              letterSpacing: 1,
              color: black,
              fontSize: 20,
              fontWeight: FontWeight.w600),
        ),
      ),
      body: Builder(
        builder: (context) {
          if (sholat.hasPermissions) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                sholat.lastRead != null
                    ? Text(
                        '${sholat.lastRead}',
                        style: GoogleFonts.openSans(color: black, fontSize: 15),
                      )
                    : SizedBox(),
                SizedBox(height: 10),
                sholat.lastReadAt != null
                    ? Text(
                        '${sholat.lastReadAt}',
                        style: GoogleFonts.openSans(color: blue1, fontSize: 15),
                      )
                    : SizedBox(),
                StreamBuilder<CompassEvent>(
                  stream: FlutterCompass.events,
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return Text('Error reading heading: ${snapshot.error}');
                    }
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    double? direction = snapshot.data!.heading;
                    if (direction == null)
                      return Center(
                        child: Text("Device tidak suport !"),
                      );
                    return Container(
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('assets/image/frame2.png'))),
                      padding: EdgeInsets.all(50),
                      child: Material(
                        color: grey100,
                        shape: CircleBorder(),
                        clipBehavior: Clip.antiAlias,
                        elevation: 4.0,
                        child: Container(
                          margin: EdgeInsets.symmetric(horizontal: 5),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                          ),
                          child: Transform.rotate(
                            angle: (direction * (math.pi / 180) * -1),
                            child: Image.asset('assets/image/kompas.png'),
                          ),
                        ),
                      ),
                    );
                  },
                ),
                QButton(
                    background_color: blue1,
                    text_color: white,
                    size: Size(200, 50),
                    title: 'Baca titik lokasi',
                    onpress: () {
                      read_value();
                    })
              ],
            );
          } else {
            fetchPermissionStatus();
            return Center(
                child: CircularProgressIndicator(
              color: green,
            ));
          }
        },
      ),
    );
  }

  void read_value() async {
    final CompassEvent? tmp = await FlutterCompass.events?.first;
    setState(() {
      sholat.lastRead = tmp;
      sholat.lastReadAt = DateTime.now();
    });
  }
}
