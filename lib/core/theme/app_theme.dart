import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';


class AppTheme {
  final _getStorage = GetStorage();
  final storageKey = 'isDarkMode';

static const kBlackColor = Color(0xFF393939);
static const kLightBlackColor = Color(0xFF8F8F8F);
static const kIconColor = Color(0xFFF48A37);
static const kProgressIndicator = Color(0xFFBE7066);
static const kPrimaryColor = Color(0xFFdcba61);
static const kSecondaryColor = Color(0xFF203864);
static const kTextColor = Color(0xFF2F5597);

final kShadowColor = const Color(0xFFD3D3D3).withOpacity(.84);

lightTheme(context) => ThemeData(
      primaryColor: kPrimaryColor,
      primarySwatch: Colors.orange,
      scaffoldBackgroundColor: Colors.white,
      textTheme: Theme.of(context).textTheme.apply(
            displayColor: kBlackColor,
            bodyColor: kBlackColor,
            fontFamily: GoogleFonts.inter().fontFamily,
          ),
      cardColor: Colors.grey.shade300,
      secondaryHeaderColor: kSecondaryColor,
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
      ),
    );

darkTheme(context) => ThemeData(
      primaryColor: kPrimaryColor,
      primarySwatch: Colors.orange,
      colorScheme: const ColorScheme.dark(
        primary: kPrimaryColor,
        secondary: kSecondaryColor,
        error: Colors.red,
      ),
      tabBarTheme: TabBarTheme(
        labelColor: Colors.white,
        unselectedLabelColor: Colors.grey,
        labelStyle: TextStyle(
          fontSize: 16,
          fontFamily: GoogleFonts.inter().fontFamily,
          fontWeight: FontWeight.w600,
        ),
      ),
      // scaffoldBackgroundColor: Colors.grey.shade900,
      scaffoldBackgroundColor: const Color(0xff051e25),
      drawerTheme: const DrawerThemeData(
        backgroundColor: Color(0xff051e25),
      ),
      textTheme: Theme.of(context).textTheme.apply(
            displayColor: Colors.white,
            bodyColor: Colors.white,
            fontFamily: GoogleFonts.inter().fontFamily,
          ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: Colors.white,
        ),
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: Color(0xff051e25),
        elevation: 0,
        // iconTheme: const IconThemeData(color: Colors.white),
        // titleTextStyle: Theme.of(context)
        //     .appBarTheme
        //     ?.titleTextStyle
        //     ?.copyWith(color: Colors.white, fontWeight: FontWeight.bold),
      ),
    );



  ThemeMode getThemeMode() {
    return isSavedDarkMode() ? ThemeMode.dark : ThemeMode.light;
  }

  bool isSavedDarkMode() {
    return _getStorage.read(storageKey) ?? false;
  }

  void saveThemeMode(bool isDarkMode) {
    _getStorage.write(storageKey, isDarkMode);
  }

  void changeThemeMode() {
    Get.changeThemeMode(isSavedDarkMode() ? ThemeMode.light : ThemeMode.dark);
    saveThemeMode(!isSavedDarkMode());
  }

  void resetThemeMode() {
    Get.changeThemeMode(ThemeMode.light);
    saveThemeMode(false);
  }

}
