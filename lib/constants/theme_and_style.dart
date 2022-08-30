import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

TextTheme defoultTextTheme = TextTheme(
  caption: GoogleFonts.quicksand(fontWeight: FontWeight.normal, fontSize: 12),
  button: GoogleFonts.quicksand(fontWeight: FontWeight.normal, fontSize: 14),
  subtitle1: GoogleFonts.quicksand(fontWeight: FontWeight.w400, fontSize: 16),
  subtitle2: GoogleFonts.quicksand(fontWeight: FontWeight.normal, fontSize: 14),
  bodyText1: GoogleFonts.quicksand(fontWeight: FontWeight.w400, fontSize: 16),
  bodyText2: GoogleFonts.quicksand(fontWeight: FontWeight.w400, fontSize: 14),
  headline6: GoogleFonts.quicksand(
    fontWeight: FontWeight.bold,
    fontSize: 20,
    color: const Color(0xFF140b24),
  ),
  headline5: GoogleFonts.quicksand(fontWeight: FontWeight.normal, fontSize: 24),
  headline4: GoogleFonts.quicksand(fontWeight: FontWeight.w400, fontSize: 34),
  headline3: GoogleFonts.quicksand(fontWeight: FontWeight.w400, fontSize: 48),
  headline2: GoogleFonts.quicksand(fontWeight: FontWeight.w200, fontSize: 60),
  headline1: GoogleFonts.quicksand(fontWeight: FontWeight.w200, fontSize: 96),
);

ElevatedButtonThemeData defoultElevatedButton = ElevatedButtonThemeData(
  style: ElevatedButton.styleFrom(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(30),
    ),
  ),
);

class DefaultColorsPalette {
  static const MaterialColor defoultColorSwatch = MaterialColor(
    0xFFf97e3e,
    <int, Color>{
      50: Color(0xFFfff9e5), //10%
      100: Color(0xffffeebd), //20%
      200: Color(0xffffda6d), //30%
      300: Color(0xffffbb49), //40%
      400: Color(0xFFf97e3e), //50%
      500: Color(0xffc76431), //60%
      600: Color(0x0f7c3f1f), //70%
      700: Color(0xff633218), //80%
      800: Color(0xff31190c), //90%
      900: Color(0xff000000), //100%
    },
  );
  static const ColorScheme defoultColorScheme = ColorScheme.light(
    primary: Color(0xFFf97e3e),
    primaryContainer: Color(0xFFfff9e5),
    onPrimary: Color(0xFFFFFFFF),
    onPrimaryContainer: Color(0xFF140b24),
    secondary: Color(0xFF4e6cac),
    onSecondary: Color(0xFFFFFFFF),
    secondaryContainer: Color(0xFFe6eaf3),
    onSecondaryContainer: Color(0xFF070a11),
    background: Color(0xFFFFFFFF),
    surface: Color(0xFFFFFFFF),
    error: Colors.red,
  );
}
