import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  // colors
  static const Color primary = Color.fromRGBO(31, 138, 112, 1);
  static const Color secondary = Colors.yellow;
  static const Color tertiary = Colors.orange;
  static const Color white = Colors.white;
  static const Color whiteOp = Color.fromRGBO(255, 255, 255, 0.8);
  static const Color clrPuzzle = Color.fromRGBO(191, 219, 56, 0.5);
  static final Color? grey = Colors.grey[200];

  static const TextStyle textStyle = TextStyle(
      fontSize: 12.0, fontWeight: FontWeight.bold, color: AppTheme.white);

  static final ThemeData themeLight = ThemeData.light().copyWith(
    textTheme: GoogleFonts.poppinsTextTheme(),
  );
}
