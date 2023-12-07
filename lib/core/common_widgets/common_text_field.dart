import 'package:flutter/material.dart';
import 'package:neobis_flutter_chapter_7/core/resourses/app_images/app_images.dart';

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