import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:neobis_flutter_chapter_7/core/common_widgets/common_elevated_button.dart';
import 'package:neobis_flutter_chapter_7/core/common_widgets/common_text_field.dart';
import 'package:neobis_flutter_chapter_7/core/resourses/app_colors/app_colors.dart';
import 'package:neobis_flutter_chapter_7/core/resourses/app_fonts/app_fonts.dart';
import 'package:neobis_flutter_chapter_7/core/resourses/app_images/app_images.dart';
import 'package:neobis_flutter_chapter_7/src/authorized_screen/presentation/authorized_screen.dart';
import 'package:neobis_flutter_chapter_7/src/email_confirm/presentation/bloc/confirm_bloc.dart';

class EmailConfirmationScreen extends StatefulWidget {
  final String email;
  const EmailConfirmationScreen({super.key, required this.email});

  @override
  State<EmailConfirmationScreen> createState() =>
      _EmailConfirmationScreenState();
}

class _EmailConfirmationScreenState extends State<EmailConfirmationScreen> {
  final codeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBarTheme(),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
          child: Column(
            children: [
              const SizedBox(height: 20),
              _buildEmailSentText(),
              const SizedBox(height: 24),
              _buildCheckSpamText(),
              const SizedBox(height: 24),
              const Text('(´｡• ω •｡`)'),
              Image.asset(Images.emailSended),
              const SizedBox(height: 12),
              CustomTextField(
                controller: codeController,
                obscureText: false,
                hintText: 'Введи туда-сюда код',
              ),
              const SizedBox(height: 12),
              _buildConfirmButton(context),
              const Spacer(),
              _buildResendEmailButton(),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }

  AppBar _appBarTheme() {
    return AppBar(
      elevation: 0,
      backgroundColor: AppColors.textWhite,
      title: Text('Регистрация',
          style: AppFonts.s16w500.copyWith(color: AppColors.black28)),
      leading: IconButton(
        icon: const Icon(Icons.arrow_back_ios_new, color: AppColors.black28),
        onPressed: () => Navigator.pop(context),
      ),
    );
  }

  Text _buildEmailSentText() {
    return Text(
      'Выслали письмо с кодом\nдля завершения регистрации\nна ${widget.email}',
      textAlign: TextAlign.center,
      style: AppFonts.s20w400.copyWith(color: AppColors.black21),
    );
  }

  Text _buildCheckSpamText() {
    return Text(
      'Если письмо не пришло, не спеши\nждать совиную почту - лучше проверь\nящик "Спам"',
      style: AppFonts.s16w500.copyWith(color: AppColors.textGrey),
      textAlign: TextAlign.center,
    );
  }

  BlocListener<ConfirmBloc, ConfirmState> _buildConfirmButton(
      BuildContext context) {
    return BlocListener<ConfirmBloc, ConfirmState>(
      listener: (context, state) {
        if (state is ConfirmLoaded) {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const AuthorizedScreen()));
        } else if (state is ConfirmError) {
          ScaffoldMessenger.of(context)
              .showSnackBar(const SnackBar(content: Text('Неверный код')));
        }
      },
      child: CustomElevatedButton(
          onPressed: () {
            BlocProvider.of<ConfirmBloc>(context).add(
              ConfirmByCodeEvent(code: codeController.text),
            );
          },
          title: 'Подтвердить'),
    );
  }

  TextButton _buildResendEmailButton() {
    return TextButton(
      onPressed: () {},
      child: Text('Письмо не пришло',
          style: AppFonts.s16w500.copyWith(color: AppColors.black28)),
    );
  }
}
