import 'package:flutter/material.dart';

import 'package:neobis_flutter_chapter_7/core/resourses/app_colors/app_colors.dart';
import 'package:neobis_flutter_chapter_7/core/resourses/app_fonts/app_fonts.dart';
import 'package:neobis_flutter_chapter_7/core/resourses/app_images/app_images.dart';
import 'package:neobis_flutter_chapter_7/src/auth/presentation/auth_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => const AuthScreen(),
        ),
      );
    });
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Lorby',
              style: AppFonts.s40w500.copyWith(
                color: AppColors.black21,
              ),
            ),
            Text(
              'Твой личный репетитор',
              style: AppFonts.s20w400.copyWith(
                color: AppColors.black21,
              ),
            ),
            const SizedBox(
              height: 66,
            ),
            Image.asset(Images.splashScreenPng)
          ],
        ),
      ),
    );
  }
}
