import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:neobis_flutter_chapter_7/core/common_widgets/common_elevated_button.dart';
import 'package:neobis_flutter_chapter_7/core/common_widgets/common_text_field.dart';
import 'package:neobis_flutter_chapter_7/core/resourses/app_colors/app_colors.dart';
import 'package:neobis_flutter_chapter_7/core/resourses/app_fonts/app_fonts.dart';
import 'package:neobis_flutter_chapter_7/src/email_confirm/presentation/email_confirm_screen.dart';
import 'package:neobis_flutter_chapter_7/src/registration/presentation/bloc/registration_bloc.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({Key? key}) : super(key: key);

  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final passwordController = TextEditingController();
  final passwordCheckController = TextEditingController();
  final emailController = TextEditingController();
  final loginController = TextEditingController();
  bool obscureText = true;
  bool obscureText2 = true;
  String? errorTextPassword;
  String? errorTextEmail;
  bool isValid = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarTheme(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                const SizedBox(height: 16),
                _buildHeaderText(),
                const SizedBox(height: 40),
                _buildEmailTextField(),
                const SizedBox(height: 14),
                _buildUsernameTextField(),
                const SizedBox(height: 14),
                _buildPasswordTextField(),
                const SizedBox(height: 10),
                _buildValidationText(),
                const SizedBox(height: 14),
                _buildCreatePasswordTextField(),
                const SizedBox(height: 24),
                _buildNextButton(context, isValid),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeaderText() {
    return Text(
      'Создать аккаунт\nLorby',
      textAlign: TextAlign.center,
      style: AppFonts.s24w500.copyWith(color: AppColors.black21),
    );
  }

  Widget _buildEmailTextField() {
    return CustomTextField(
      controller: emailController,
      onChanged: (value) {
        if (value.contains('@')) {
          setState(() {
            errorTextEmail = null;
          });
        } else {
          setState(() {
            errorTextEmail = 'Неверный формат почты';
          });
        }
        _updateIsValid();
      },
      errorText: errorTextEmail,
      obscureText: false,
      hintText: 'Введи адрес почты',
      onTapIcon: () {},
    );
  }

  Widget _buildUsernameTextField() {
    return CustomTextField(
      controller: loginController,
      onChanged: (_) {
        _updateIsValid();
      },
      obscureText: false,
      hintText: 'Придумай логин',
      onTapIcon: () {},
    );
  }

  Widget _buildPasswordTextField() {
    return CustomTextField(
      controller: passwordController,
      onChanged: (value) {
        BlocProvider.of<RegistrationBloc>(context)
            .add(ValidationEvent(password: value));
        _updateIsValid();
      },
      showSuffix: true,
      hintText: 'Придумай пароль',
      onTapIcon: () {
        setState(() {
          obscureText = !obscureText;
        });
      },
      obscureText: obscureText,
    );
  }

  Widget _buildValidationText() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: BlocBuilder<RegistrationBloc, RegistrationState>(
        builder: (context, state) {
          if (state is ValidationState) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildValidationItem(
                    state.passwordLength, 'От 8 до 15 символов'),
                const SizedBox(height: 10),
                _buildValidationItem(
                    state.passwordUpperCase, 'Строчные и прописные буквы'),
                const SizedBox(height: 10),
                _buildValidationItem(state.number, 'Минимум одна цифра'),
                const SizedBox(height: 10),
                _buildValidationItem(
                    state.symbol, 'Минимум один спецсимвол (!, ", #, \$...)'),
              ],
            );
          }
          return const SizedBox();
        },
      ),
    );
  }

  Widget _buildValidationItem(bool isValid, String title) {
    final textColor = isValid ? Colors.green : Colors.red;
    return Row(
      children: [
        Text(
          title,
          style: AppFonts.s12w500.copyWith(color: textColor),
        ),
        const SizedBox(),
      ],
    );
  }

  Widget _buildCreatePasswordTextField() {
    return CustomTextField(
      controller: passwordCheckController,
      onChanged: (value) {
        if (passwordController.text != value) {
          setState(() {
            errorTextPassword = 'Пароли не совпадают';
          });
        } else {
          setState(() {
            errorTextPassword = null;
          });
        }
        _updateIsValid();
      },
      errorText: errorTextPassword,
      showSuffix: true,
      hintText: 'Создай пароль',
      onTapIcon: () {
        setState(() {
          obscureText2 = !obscureText2;
        });
      },
      obscureText: obscureText2,
    );
  }

  Widget _buildNextButton(BuildContext context, bool isValid) {
    return BlocListener<RegistrationBloc, RegistrationState>(
      listener: (context, state) {
        if (state is SendRegistrationDataLoaded) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => EmailConfirmationScreen(
                email: emailController.text,
              ),
            ),
          );
        } else if (state is SendRegistrationDataError) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Пользователь с такой почтой уже существует'),
            ),
          );
        }
      },
      child: CustomElevatedButton(
        onPressed: isValid
            ? () {
                BlocProvider.of<RegistrationBloc>(context).add(
                  SendRegistrationData(
                    email: emailController.text,
                    login: loginController.text,
                    passwrod: passwordController.text,
                  ),
                );
              }
            : null,
        title: 'Далее',
      ),
    );
  }

  void _updateIsValid() {
    setState(() {
      isValid = errorTextEmail == null &&
          errorTextPassword == null &&
          loginController.text.isNotEmpty &&
          passwordController.text.isNotEmpty &&
          passwordCheckController.text.isNotEmpty;
    });
  }

  AppBar appBarTheme() {
    return AppBar(
      elevation: 0,
      backgroundColor: AppColors.textWhite,
      title: Text(
        'Регистрация',
        style: AppFonts.s16w500.copyWith(color: AppColors.black28),
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
