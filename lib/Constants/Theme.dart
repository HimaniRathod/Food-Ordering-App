import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'colors.dart';

class TTexttheme {
  //onboarding text theme
  static TextTheme onboardingtext = TextTheme(
    titleLarge: GoogleFonts.poppins(
        fontSize: 30, color: brown, fontWeight: FontWeight.w600),
    titleMedium: GoogleFonts.poppins(
      fontSize: 20,
      color: black,
      fontWeight: FontWeight.w600,
    ),
    titleSmall: GoogleFonts.poppins(
        fontSize: 17, color: brown, fontWeight: FontWeight.w600),
  );

  //Login Registration text theme
  static TextTheme LRtext = TextTheme(
    titleLarge: GoogleFonts.poppins(
        fontSize: 30, color: black, fontWeight: FontWeight.w700),
    titleMedium: GoogleFonts.poppins(
        fontSize: 18, color: black, fontWeight: FontWeight.w500),
    titleSmall: GoogleFonts.poppins(
      fontSize: 12,
      color: grey,
    ),
    labelSmall: GoogleFonts.poppins(
        fontSize: 20, color: white, fontWeight: FontWeight.w700),
    labelMedium: GoogleFonts.poppins(
        fontSize: 30, color: dgreen, fontWeight: FontWeight.w700),
    displaySmall: GoogleFonts.poppins(
        fontSize: 16, color: black, fontWeight: FontWeight.w500),
  );

//dialogue box
  static TextTheme Dtext = TextTheme(
    titleLarge: GoogleFonts.poppins(
        fontSize: 16, color: brown, fontWeight: FontWeight.w500),
    titleMedium: GoogleFonts.poppins(
        fontSize: 10, color: black, fontWeight: FontWeight.w200),
  );

  static TextTheme HText = TextTheme(
    titleLarge: GoogleFonts.poppins(
        fontSize: 20, color: black, fontWeight: FontWeight.w700),
    titleSmall: GoogleFonts.poppins(
        fontSize: 15, color: grey, fontWeight: FontWeight.w400),
    bodyMedium: GoogleFonts.chelseaMarket(
        fontWeight: FontWeight.w500, color: brown, fontSize: 30),
    bodySmall: GoogleFonts.chelseaMarket(
        fontWeight: FontWeight.w200, color: brown, fontSize: 15),
    titleMedium: GoogleFonts.poppins(
        fontSize: 16, color: brown, fontWeight: FontWeight.w500),);

}
