import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

TextStyle style(
  double fontsize,
  FontWeight weight,
  Color color, {
  double? height,
  TextDecoration? decoration,
  TextOverflow? overflow,
}) {
  return TextStyle(
      fontFamily: GoogleFonts.roboto(fontWeight: weight).fontFamily,
      fontSize: fontsize,
      fontWeight: weight,
      color: color,
      height: 1.5,
      overflow: overflow ?? TextOverflow.ellipsis,
      decoration: decoration ?? TextDecoration.none,
      textBaseline: TextBaseline.alphabetic,
      leadingDistribution: TextLeadingDistribution.proportional);
}
