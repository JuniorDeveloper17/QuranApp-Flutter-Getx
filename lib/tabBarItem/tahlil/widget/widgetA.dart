
import 'package:flutter/material.dart';

class WidgetA extends StatelessWidget {
  final int index;
  const WidgetA({
    super.key,required this.index
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
                      maxRadius: 30,
                      backgroundColor: Colors.transparent,
                      backgroundImage: AssetImage("assets/image/juz.png"),
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
                  ],
                ),
              ),
            ),
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.share,
                  color: Colors.lightBlue,
                  size: 18,
                )),
          ],
        ));
  }
}
