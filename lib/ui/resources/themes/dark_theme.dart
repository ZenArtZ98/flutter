import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_first_app/ui/resources/colors.dart';
import 'package:my_first_app/ui/resources/text.dart';

const back = Color(0xFF2B2B2B);
const card = Color(0xFF202020);

final darkThemeData = ThemeData(
  scaffoldBackgroundColor: back,
  colorScheme: const ColorScheme.dark(
    primary: AppColors.primary,
  ),
  cardColor: card,
  appBarTheme: AppBarTheme(
    backgroundColor: back,
    systemOverlayStyle: SystemUiOverlayStyle.light,
    titleTextStyle: AppText.h3.copyWith(color: Colors.white),
    surfaceTintColor: back,
    iconTheme: const IconThemeData(
      color: Colors.white,
    ),
  ),
  primaryColor: AppColors.primary,
  useMaterial3: true,
  textTheme: TextTheme(
    bodyMedium: AppText.body.copyWith(color: Colors.white),
  ),
);
