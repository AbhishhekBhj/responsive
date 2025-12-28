import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTypography {
  static TextStyle montserrat({
    double fontSize = 14,
    FontWeight fontWeight = FontWeight.w400,
    Color color = Colors.black,
    double height = 1.4,
    double? letterSpacing
  }) {
    return GoogleFonts.montserrat(
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: color,
      height: height,
      letterSpacing:  letterSpacing
    );
  }
}
