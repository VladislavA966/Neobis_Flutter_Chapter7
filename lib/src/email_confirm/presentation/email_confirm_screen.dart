import 'package:flutter/material.dart';
import 'package:neobis_flutter_chapter_7/core/resourses/app_colors/app_colors.dart';
import 'package:neobis_flutter_chapter_7/core/resourses/app_fonts/app_fonts.dart';
import 'package:neobis_flutter_chapter_7/core/resourses/app_images/app_images.dart';

class EmailConfirmationScreen extends StatefulWidget {
  const EmailConfirmationScreen({super.key});

  @override
  State<EmailConfirmationScreen> createState() =>
      _EmailConfirmationScreenState();
}

class _EmailConfirmationScreenState extends State<EmailConfirmationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarTheme(),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 24,
          ),
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              Text(
                'Выслали письмо со ссылкой\nдля завершения регистрации\nна example@gmail.com',
                textAlign: TextAlign.center,
                style: AppFonts.s20w400.copyWith(color: AppColors.black21),
              ),
              const SizedBox(
                height: 24,
              ),
              Text(
                'Если письмо не пришло, не спеши\nждать совиную почту - лучше проверь\nящик "Спам',
                style: AppFonts.s16w500.copyWith(
                  color: AppColors.textGrey,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 24,
              ),
              Text(
                '(´｡• ω •｡`)',
                style: AppFonts.s16w500.copyWith(
                  color: AppColors.black21,
                ),
              ),
              const SizedBox(
                height: 58,
              ),
              Image.asset(Images.emailSended),
              const Spacer(),
              TextButton(
                onPressed: () {},
                child: Text(
                  'Письмо не пришло',
                  style: AppFonts.s16w500.copyWith(color: AppColors.black28),
                ),
              ),
              const SizedBox(
                height: 24,
              ),
            ],
          ),
        ),
      ),
    );
  }

  AppBar appBarTheme() {
    return AppBar(
      elevation: 0,
      backgroundColor: AppColors.textWhite,
      title: Text(
        'Регистрация',
        style: AppFonts.s16w500.copyWith(
          color: AppColors.black28,
        ),
      ),
      leading: IconButton(
        icon: const Icon(
          Icons.arrow_back_ios_new,
          color: AppColors.black28,
        ),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}
