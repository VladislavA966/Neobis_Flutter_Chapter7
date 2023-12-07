import 'package:flutter/material.dart';
import 'package:neobis_flutter_chapter_7/core/common_widgets/common_elevated_button.dart';
import 'package:neobis_flutter_chapter_7/core/common_widgets/common_text_button.dart';
import 'package:neobis_flutter_chapter_7/core/resourses/app_colors/app_colors.dart';
import 'package:neobis_flutter_chapter_7/core/resourses/app_fonts/app_fonts.dart';
import 'package:neobis_flutter_chapter_7/core/resourses/app_images/app_images.dart';
import 'package:neobis_flutter_chapter_7/src/auth/presentation/auth_screen.dart';

class AuthorizedScreen extends StatefulWidget {
  const AuthorizedScreen({super.key});

  @override
  State<AuthorizedScreen> createState() => _AuthorizedScreenState();
}

class _AuthorizedScreenState extends State<AuthorizedScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 118,
              ),
              Text(
                'C возвращением!',
                style: AppFonts.s24w500.copyWith(color: AppColors.black21),
              ),
              Text(
                'Lorby - твой личный репетитор',
                style: AppFonts.s20w400.copyWith(
                  color: AppColors.black21,
                ),
              ),
              const SizedBox(height: 48),
              Image.asset(Images.splashScreenPng),
              const Spacer(),
              CommonTextButton(
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return Container(
                            width: double.infinity,
                            height: 100,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                20,
                              ),
                            ),
                            child: AlertDialog(
                              title: Padding(
                                padding: const EdgeInsets.all(16),
                                child: Column(children: [
                                  Text(
                                    'Выйти?',
                                    style: AppFonts.s20w400.copyWith(
                                      color: AppColors.black21,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 24,
                                  ),
                                  Text(
                                    'Точно выйти?',
                                    style: AppFonts.s16w500.copyWith(
                                      color: AppColors.textGrey,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 24,
                                  ),
                                  CustomElevatedButton(
                                      onPressed: () {}, title: 'Да, точно'),
                                  CommonTextButton(
                                      onPressed: () {}, title: 'Нет, остаться'),
                                ]),
                              ),
                            ),
                          );
                        });
                  },
                  title: 'Выйти'),
              const SizedBox(
                height: 37,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
