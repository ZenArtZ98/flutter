import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_first_app/ui/resources/colors.dart';
import 'package:my_first_app/ui/resources/text.dart';

final lightThemeData = ThemeData(
  scaffoldBackgroundColor: Colors.white,
  colorScheme: const ColorScheme.light(
    primary: AppColors.primary,
  ),
  cardColor: Colors.white,
  appBarTheme: AppBarTheme(
    backgroundColor: Colors.white,
    surfaceTintColor: Colors.white,
    systemOverlayStyle: SystemUiOverlayStyle.dark,
    titleTextStyle: AppText.h3.copyWith(color: Colors.black),
    iconTheme: const IconThemeData(
      color: Colors.black,
    ),
  ),
  primaryColor: AppColors.primary,
  useMaterial3: true,
  textTheme: TextTheme(
    bodyMedium: AppText.body.copyWith(color: Colors.black),
  ),
);
