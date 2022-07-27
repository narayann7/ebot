import 'package:ebot/utility/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

void teleport(BuildContext context, String screen) {
  Navigator.of(context).pushNamed(screen);
}

void teleportWithArguments(
    BuildContext context, String screen, Object arguments) {
  Navigator.of(context).pushNamed(screen, arguments: arguments);
}

circularProgress({
  double size = 20,
  Color color = black,
}) {
  // ignore: prefer_const_constructors
  return Center(
    child: SizedBox(
      height: size,
      width: size,
      child: CircularProgressIndicator(
        color: color,
      ),
    ),
  );
}

myText(String content,
    {String fontfamily = "Sen",
    double size = 20,
    int maxLine = 3,
    Color? color = Colors.white,
    FontWeight fontWeight = FontWeight.normal}) {
  return Text(
    content,
    overflow: TextOverflow.fade,
    maxLines: maxLine,
    //maxLines: 3,
    style: GoogleFonts.getFont(fontfamily,
        fontSize: size, color: color, fontWeight: fontWeight),
  );
}

getConversionTitle() async {
  final DateTime now = DateTime.now();
  final DateFormat formatter = DateFormat('yyyy-MM-dd');
  final String date = formatter.format(now);
  final time = "${now.hour}:${now.minute}:${now.second}";
  final heading = "$date ($time)";
  return heading;
}
