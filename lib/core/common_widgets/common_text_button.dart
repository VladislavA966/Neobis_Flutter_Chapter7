import 'package:flutter/material.dart';
import 'package:neobis_flutter_chapter_7/core/resourses/app_colors/app_colors.dart';
import 'package:neobis_flutter_chapter_7/core/resourses/app_fonts/app_fonts.dart';

class CommonTextButton extends StatelessWidget {
  final Function() onPressed;
  final String title;

  const CommonTextButton({
    Key? key,
    required this.onPressed,
    required this.title,
  }) : super(key: key);

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