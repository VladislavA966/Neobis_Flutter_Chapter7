import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:neobis_flutter_chapter_7/core/resourses/app_colors/app_colors.dart';
import 'package:neobis_flutter_chapter_7/core/resourses/app_fonts/app_fonts.dart';
import 'package:neobis_flutter_chapter_7/core/resourses/app_images/app_images.dart';

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
                  obscureText: false,
                  hintText: 'Введи туда-сюда логин',
                  onTapIcon: () {},
                ),
                const SizedBox(
                  height: 14,
                ),
                CustomTextField(
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
                  onPressed: () {},
                ),
                const SizedBox(
                  height: 28,
                ),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    'У меня еще нет аккаунта',
                    style: AppFonts.s16w500.copyWith(
                      color: AppColors.black28,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CustomElevatedButton extends StatelessWidget {
  final Function() onPressed;

  const CustomElevatedButton({
    super.key,
    required this.onPressed,
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
        onPressed: () {},
        child: Text(
          'Войти',
          style: AppFonts.s16w500.copyWith(
            color: AppColors.textWhite,
          ),
        ),
      ),
    );
  }
}

class CustomTextField extends StatelessWidget {
  final String hintText;
  final bool showSuffix;
  final Function() onTapIcon;
  final bool obscureText;

  const CustomTextField({
    Key? key,
    required this.hintText,
    this.showSuffix = false,
    required this.onTapIcon,
    required this.obscureText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
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
