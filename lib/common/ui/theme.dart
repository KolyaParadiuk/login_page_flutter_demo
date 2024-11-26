import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login_page_flutter_demo/common/ui/colors.dart';
import 'package:login_page_flutter_demo/common/ui/topography.dart';

final appTheme = ThemeData(
  fontFamily: GoogleFonts.inter().fontFamily,
  scaffoldBackgroundColor: AppColors.secondary,
  inputDecorationTheme: InputDecorationTheme(
    fillColor: WidgetStateColor.resolveWith((Set<WidgetState> states) {
      if (states.contains(WidgetState.error)) {
        return AppColors.error100;
      }
      return AppColors.secondary;
    }),
    filled: true,
    labelStyle: AppTextStyles.body16Regular,
    hintStyle: AppTextStyles.body16Regular,
    floatingLabelStyle: AppTextStyles.body16Regular,
    errorBorder: OutlineInputBorder(
      borderSide: const BorderSide(
        color: AppColors.error500,
      ),
      borderRadius: BorderRadius.circular(10),
    ),
    errorStyle: AppTextStyles.body16Regular.withColor(
      AppColors.error500,
    ),
    enabledBorder: OutlineInputBorder(
      gapPadding: 12,
      borderRadius: BorderRadius.circular(10),
      borderSide: const BorderSide(color: AppColors.secondary),
    ),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: const BorderSide(color: AppColors.secondary),
    ),
    focusedBorder: OutlineInputBorder(
      gapPadding: 12,
      borderRadius: BorderRadius.circular(10),
      borderSide: const BorderSide(color: AppColors.borderActive),
    ),
  ),
);
