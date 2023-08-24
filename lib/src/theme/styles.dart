import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'colors.dart';

class XStyles {
  static final titleSmall = GoogleFonts.comfortaa(
    fontSize: 14,
    fontWeight: FontWeight.w700,
  );

  static final bodyMedium = GoogleFonts.comfortaa(
    fontSize: 14,
    fontWeight: FontWeight.w300,
  );

  static final labelLarge = GoogleFonts.comfortaa(
    fontSize: 14,
    fontWeight: FontWeight.w500,
  );

  static final labelMedium = GoogleFonts.comfortaa(
    fontSize: 15,
    fontWeight: FontWeight.w600,
  );

  static final bodySmall = GoogleFonts.comfortaa(
    fontSize: 12,
    fontWeight: FontWeight.w500,
  );
  static final titleLarge = GoogleFonts.comfortaa(
    fontSize: 20,
    fontWeight: FontWeight.w700,
  );

  static final displaySmall = GoogleFonts.comfortaa(
    fontSize: 24,
    fontWeight: FontWeight.w700,
  );

// https://api.flutter.dev/flutter/material/TextTheme-class.html
  static TextTheme get textTheme {
    return TextTheme(
      displaySmall: displaySmall,
      titleLarge: titleLarge,
      titleSmall: titleSmall,
      bodyMedium: bodyMedium,
      bodySmall: bodySmall,
      labelLarge: labelLarge,
      labelMedium: labelMedium,
    ).apply(
      fontSizeFactor: 1.0,
      bodyColor: XColors.text,
      displayColor: XColors.text,
    );
  }
}
