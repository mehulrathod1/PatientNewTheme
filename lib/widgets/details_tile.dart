import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:patient/Utils/colorsandstyles.dart';

class DetailsTile extends StatelessWidget {
  final String title;
  final String value;
  const DetailsTile({
    Key? key,
    required this.title,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(
          title,
          style: GoogleFonts.lato(
              fontSize: 15, color: Color(0xff252525).withOpacity(0.5)),
        ),
        Text(
          value,
          style: GoogleFonts.lato(
              fontSize: 17, color: appBlackColor, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
