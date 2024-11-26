import 'package:flutter/material.dart';
import 'package:login_page_flutter_demo/common/ui/assets.dart';
import 'package:login_page_flutter_demo/common/ui/gradients.dart';

class PageContainer extends StatelessWidget {
  const PageContainer({super.key, this.child});

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(gradient: AppGradients.background),
      child: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              scale: 0.8,
              image: Image.asset(Assets.backgroundStars).image,
              fit: BoxFit.scaleDown,
            ),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: child,
        ),
      ),
    );
  }
}
