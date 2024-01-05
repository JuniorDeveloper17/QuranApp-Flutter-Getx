import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QButton extends StatefulWidget {
  final Color background_color;
  final Color text_color;
  final Size size;
  final String title;
  final VoidCallback onpress;
  const QButton(
      {super.key,
      required this.background_color,
      required this.text_color,
      required this.size,
      required this.title,
      required this.onpress});

  @override
  State<QButton> createState() => _QButtonState();
}

class _QButtonState extends State<QButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: widget.onpress,
        style: ElevatedButton.styleFrom(
            fixedSize: widget.size,
            backgroundColor: widget.background_color,
            shadowColor: Color.fromARGB(255, 224, 224, 224),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10))),
        child: Text(
          '${widget.title}',
          style: GoogleFonts.openSans(
              color: widget.text_color,
              fontSize: 17,
              fontWeight: FontWeight.w600),
        ));
  }
}
