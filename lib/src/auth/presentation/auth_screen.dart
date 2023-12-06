import 'package:flutter/material.dart';
import 'package:neobis_flutter_chapter_7/core/resourses/app_colors/app_colors.dart';
import 'package:neobis_flutter_chapter_7/core/resourses/app_fonts/app_fonts.dart';
import 'package:neobis_flutter_chapter_7/core/resourses/app_images/app_images.dart';
import 'package:neobis_flutter_chapter_7/src/authorized_screen/presentation/authorized_screen.dart';
import 'package:neobis_flutter_chapter_7/src/registration/presentation/registration%20screen.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 24,
              vertical: 16,
            ),
            child: Column(
              children: [
                Image.asset(Images.authImage),
                const SizedBox(
                  height: 32,
                ),
                Text(
                  'Велком бэк!',
                  style: AppFonts.s24w500.copyWith(
                    color: AppColors.black21,
                  ),
                ),
                const SizedBox(
                  height: 28,
                ),
                CustomTextField(
                  controller: TextEditingController(),
                  onSubmitted: (value) {},
                  obscureText: false,
                  hintText: 'Введи туда-сюда логин',
                  onTapIcon: () {},
                ),
                const SizedBox(
                  height: 14,
                ),
                CustomTextField(
                  controller: TextEditingController(),
                  onSubmitted: (value) {},
                  showSuffix: true,
                  hintText: 'Пароль(тоже введи)',
                  onTapIcon: () {
                    obscureText = !obscureText;
                    setState(() {});
                  },
                  obscureText: obscureText,
                ),
                const SizedBox(
                  height: 24,
                ),
                CustomElevatedButton(
                  title: 'Войти',
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const AuthorizedScreen(),
                      ),
                    );
                  },
                ),
                const SizedBox(
                  height: 28,
                ),
                CommonTextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const RegistrationScreen(),
                      ),
                    );
                  },
                  title: 'У меня еще нет аккаунта',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CommonTextButton extends StatelessWidget {
  final Function() onPressed;
  final String title;
  const CommonTextButton({
    super.key,
    required this.onPressed,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(
        title,
        style: AppFonts.s16w500.copyWith(
          color: AppColors.black28,
        ),
      ),
    );
  }
}

class CustomElevatedButton extends StatelessWidget {
  final Function() onPressed;
  final String title;

  const CustomElevatedButton({
    super.key,
    required this.onPressed,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          12,
        ),
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.black28,
        ),
        onPressed: onPressed,
        child: Text(
          title,
          style: AppFonts.s16w500.copyWith(
            color: AppColors.textWhite,
          ),
        ),
      ),
    );
  }
}

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final bool showSuffix;
  final Function() onTapIcon;
  final bool obscureText;
  final Function(String) onSubmitted;

  const CustomTextField({
    Key? key,
    required this.hintText,
    this.showSuffix = false,
    required this.onTapIcon,
    required this.obscureText,
    required this.onSubmitted,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      onChanged: onSubmitted,
      obscureText: obscureText,
      obscuringCharacter: '*',
      decoration: InputDecoration(
        hintText: hintText,
        suffixIcon: showSuffix
            ? IconButton(
                onPressed: onTapIcon,
                icon: obscureText
                    ? Image.asset(Images.showText)
                    : Image.asset(
                        Images.hideText,
                      ),
              )
            : null,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }
}
