import 'package:flutter/material.dart';
import 'package:hem_capstone_app/theme/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTheme {
  static final ThemeData lightThemeBase = ThemeData.light();
  static final ThemeData lightThemeData = themeData(lightColorScheme);

  static ThemeData themeData(ColorScheme colorScheme) => ThemeData(
        colorScheme: colorScheme,
        textTheme: textTheme.apply(
          displayColor: basicBlack,
          bodyColor: basicBlack,
        ),
        primaryColor: colorScheme.primary,
        //appBarTheme:
        //iconTheme:
        elevatedButtonTheme: buttonTheme,
        canvasColor: colorScheme.background,
        scaffoldBackgroundColor: colorScheme.background,
        disabledColor: disableColor,
      );

  static const ColorScheme lightColorScheme = ColorScheme(
    primary: primaryColor,
    primaryVariant: Color(0xff424AA5),
    secondary: secondaryColor,
    secondaryVariant: Colors.white,
    background: backgroundColor,
    surface: surfaceColor,
    onBackground: Colors.white,
    error: errorColor,
    onError: errorColor,
    onPrimary: Colors.white,
    onSecondary: Colors.white,
    onSurface: Colors.white,
    brightness: Brightness.light,
  );

  //static const ColorScheme DarkColorScheme

  static const _medium = FontWeight.w500;
  static const _bold = FontWeight.w700;

  static TextTheme textTheme = TextTheme(
    headline1: TextStyle(
      fontFamily: 'NotoSansKR',
      fontWeight: _bold,
      fontSize: 64.sp,
    ),
    headline2: TextStyle(
      fontFamily: 'NotoSansKR',
      fontWeight: _bold,
      fontSize: 40.sp,
    ),
    headline3: TextStyle(
      fontFamily: 'NotoSansKR',
      fontWeight: _bold,
      fontSize: 24.sp,
    ),
    subtitle1: TextStyle(
      fontFamily: 'NotoSansKR',
      fontWeight: _medium,
      fontSize: 20.sp,
    ),
    subtitle2: TextStyle(
      fontFamily: 'NotoSansKR',
      fontWeight: _medium,
      fontSize: 18.sp,
    ),
    bodyText1: TextStyle(
      fontFamily: 'NotoSansKR',
      fontWeight: _medium,
      fontSize: 16.sp,
    ),
    bodyText2: TextStyle(
      fontFamily: 'NotoSansKR',
      fontWeight: _medium,
      fontSize: 14.sp,
    ),
    caption: TextStyle(
      fontFamily: 'NotoSansKR',
      fontWeight: _medium,
      fontSize: 12.sp,
    ),
    button: TextStyle(
      fontFamily: 'NotoSansKR',
      fontWeight: _bold,
      fontSize: 16.sp,
    ),
  );

  static ElevatedButtonThemeData buttonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      primary: AppTheme.lightColorScheme.primary,
      onPrimary: AppTheme.lightColorScheme.onPrimary,
      textStyle: AppTheme.textTheme.button,
    ),
  );
}
