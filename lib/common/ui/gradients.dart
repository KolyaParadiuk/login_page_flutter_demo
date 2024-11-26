import 'package:flutter/material.dart';
import 'package:login_page_flutter_demo/common/ui/colors.dart';

class AppGradients {
  static const LinearGradient background = LinearGradient(
    colors: [AppColors.backgroundStart, AppColors.backgroundFinish],
    begin: Alignment.topCenter,
    stops: [0.0, 0.5],
    end: Alignment.bottomCenter,
  );

  static const LinearGradient button = LinearGradient(
    colors: [AppColors.buttonBackgroundStart, AppColors.buttonBackgroundFinish],
  );
}
