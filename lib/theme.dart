import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


TextTheme textTheme() {
  return TextTheme(
    displayLarge: GoogleFonts.openSans(fontSize: 18.0, color: Colors.black),
    displayMedium: GoogleFonts.openSans(fontSize: 16.0, color: Colors.black, fontWeight: FontWeight.bold),
    bodyLarge: GoogleFonts.openSans(fontSize: 16.0, color: Colors.black),
    bodyMedium: GoogleFonts.openSans(fontSize: 14.0, color: Colors.black),
    titleMedium: GoogleFonts.openSans(fontSize: 15.0, color: Colors.black),
  );
}


AppBarTheme appBarTheme() {
  return const AppBarTheme(
    centerTitle: true,
    color: Colors.green,
    elevation: 0.0,
    titleTextStyle: TextStyle(
        fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
  );
}


BottomNavigationBarThemeData bottomNavigatorTheme() {
  return const BottomNavigationBarThemeData(
    selectedItemColor: Colors.green,
    unselectedItemColor: Colors.black54,
    showUnselectedLabels: true,
  );
}


ThemeData theme() {
  return ThemeData(
    scaffoldBackgroundColor: Colors.white,
    textTheme: textTheme(),
    appBarTheme: appBarTheme(),
    drawerTheme: drawerTheme(),
    bottomNavigationBarTheme: bottomNavigatorTheme(),
    primarySwatch: Colors.green,
    cardTheme: cardTheme(),
  );
}

DrawerThemeData drawerTheme(){
  return const DrawerThemeData(
    backgroundColor: Colors.white,

  );
}

const BoxDecoration drawerHeaderDecoration = BoxDecoration(
  color: Colors.green,
);

CardTheme cardTheme(){
  return CardTheme(
      elevation: 0.5,
      margin: EdgeInsets.zero,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0.0))
  );
}