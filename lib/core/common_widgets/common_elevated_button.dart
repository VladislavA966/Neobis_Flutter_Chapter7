import 'package:flutter/material.dart';
import 'package:neobis_flutter_chapter_7/core/resourses/app_colors/app_colors.dart';
import 'package:neobis_flutter_chapter_7/core/resourses/app_fonts/app_fonts.dart';

class CustomElevatedButton extends StatelessWidget {
  final Function() onPressed;
  final String title;

  const CustomElevatedButton({
    Key? key,
    required this.onPressed,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
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