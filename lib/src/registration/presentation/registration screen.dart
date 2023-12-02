import 'package:flutter/material.dart';
import 'package:neobis_flutter_chapter_7/core/resourses/app_colors/app_colors.dart';
import 'package:neobis_flutter_chapter_7/core/resourses/app_fonts/app_fonts.dart';
import 'package:neobis_flutter_chapter_7/src/auth/presentation/auth_screen.dart';
import 'package:neobis_flutter_chapter_7/src/email_confirm/presentation/email_confirm_screen.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  bool obscureText = true;
  bool obscureText2 = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarTheme(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
        child: Center(
          child: Column(
            children: [
              const SizedBox(
                height: 16,
              ),
              Text(
                'Создать акканут\nLorby',
                textAlign: TextAlign.center,
                style: AppFonts.s24w500.copyWith(color: AppColors.black21),
              ),
              const SizedBox(
                height: 40,
              ),
              CustomTextField(
                obscureText: false,
                hintText: 'Введи адрес почты',
                onTapIcon: () {},
              ),
              const SizedBox(
                height: 14,
              ),
              CustomTextField(
                obscureText: false,
                hintText: 'Придумай логин',
                onTapIcon: () {},
              ),
              const SizedBox(
                height: 14,
              ),
              CustomTextField(
                showSuffix: true,
                hintText: 'Придумай пароль',
                onTapIcon: () {
                  obscureText = !obscureText;
                  setState(() {});
                },
                obscureText: obscureText,
              ),
              const SizedBox(
                height: 10,
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ValidationText(
                      title: 'От 8 до 15 символов',
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    ValidationText(
                      title: 'Строчные и прописные буквы',
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    ValidationText(
                      title: 'Минимум одна цифра',
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    ValidationText(
                      title: 'Минимум один спецсимвол (!, ", #, \$...)',
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 14,
              ),
              CustomTextField(
                showSuffix: true,
                hintText: 'Создай пароль',
                onTapIcon: () {
                  obscureText2 = !obscureText2;
                  setState(() {});
                },
                obscureText: obscureText2,
              ),
              const SizedBox(
                height: 24,
              ),
              CustomElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const EmailConfirmationScreen(),
                    ),
                  );
                },
                title: 'Далее',
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
        onPressed: () {},
      ),
    );
  }
}

class ValidationText extends StatelessWidget {
  final String title;
  const ValidationText({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: AppFonts.s12w500.copyWith(
            color: AppColors.textGrey,
          ),
        ),
        SizedBox(),
      ],
    );
  }
}
