import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'colors.dart';

class TTexttheme {

  static TextTheme onboardingtext = TextTheme(
    titleLarge: GoogleFonts.poppins(
        fontSize:30,
        color:brown,
    fontWeight:FontWeight.w600),

    titleMedium:GoogleFonts.poppins(
        fontSize:20,
        color:black,
        fontWeight:FontWeight.w600,

    ),

    titleSmall:GoogleFonts.poppins(
        fontSize:17,
        color:brown,
        fontWeight:FontWeight.w600),
  );

  static TextTheme Logintext = TextTheme(

    titleLarge:GoogleFonts.poppins(
        fontSize:30,
        color:black,
        fontWeight:FontWeight.w700),

    titleMedium:GoogleFonts.poppins(
        fontSize:18,
        color:black,
        fontWeight:FontWeight.w500),

    titleSmall:GoogleFonts.poppins(
      fontSize:12,
      color:grey,
    ),
    labelSmall:GoogleFonts.poppins(
      fontSize:20,
      color:white,
      fontWeight: FontWeight.w700
    ),
    labelMedium: GoogleFonts.poppins(
        fontSize:30,
        color:dgreen,
        fontWeight: FontWeight.w700
    ),

  );




}