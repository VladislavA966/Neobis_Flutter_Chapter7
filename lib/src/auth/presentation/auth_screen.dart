import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:neobis_flutter_chapter_7/core/common_widgets/common_elevated_button.dart';
import 'package:neobis_flutter_chapter_7/core/common_widgets/common_text_button.dart';
import 'package:neobis_flutter_chapter_7/core/common_widgets/common_text_field.dart';
import 'package:neobis_flutter_chapter_7/core/resourses/app_colors/app_colors.dart';
import 'package:neobis_flutter_chapter_7/core/resourses/app_fonts/app_fonts.dart';
import 'package:neobis_flutter_chapter_7/core/resourses/app_images/app_images.dart';
import 'package:neobis_flutter_chapter_7/src/auth/presentation/bloc/auth_bloc_bloc.dart';
import 'package:neobis_flutter_chapter_7/src/authorized_screen/presentation/authorized_screen.dart';
import 'package:neobis_flutter_chapter_7/src/registration/presentation/registration%20screen.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  String? errorTextEmail;
  String? errorTextPassword;
  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              child: _buildContent(),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildContent() {
    return Column(
      children: [
        _buildImage(),
        const SizedBox(height: 32),
        _buildWelcomeText(),
        const SizedBox(height: 28),
        _buildEmailTextField(),
        const SizedBox(height: 14),
        _buildPasswordTextField(),
        const SizedBox(height: 24),
        _buildAuthButton(),
        const SizedBox(height: 28),
        _buildRegistrationButton(),
      ],
    );
  }

  Widget _buildImage() {
    return Image.asset(Images.authImage);
  }

  Widget _buildWelcomeText() {
    return Text(
      'Велком бэк!',
      style: AppFonts.s24w500.copyWith(color: AppColors.black21),
    );
  }

  Widget _buildEmailTextField() {
    return CustomTextField(
      controller: emailController,
      obscureText: false,
      hintText: 'Введи туда-сюда почту',
    
    );
  }

  Widget _buildPasswordTextField() {
    return CustomTextField(
      controller: passwordController,
      showSuffix: true,
      hintText: 'Пароль(тоже введи)',
      onTapIcon: () {
        setState(() {
          obscureText = !obscureText;
        });
      },
      obscureText: obscureText,
    );
  }

  Widget _buildAuthButton() {
    return BlocListener<AuthBloc, AuthBlocState>(
      listener: (context, state) {
        if (state is AuthBlocLoaded) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const AuthorizedScreen()),
          );
        } else if (state is AuthBlocError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.errorText)),
          );
        }
      },
      child: CustomElevatedButton(
        title: 'Войти',
        onPressed: () {
          BlocProvider.of<AuthBloc>(context).add(
            GetAuthEvent(
              email: emailController.text,
              password: passwordController.text,
            ),
          );
        },
      ),
    );
  }

  Widget _buildRegistrationButton() {
    return CommonTextButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const RegistrationScreen()),
        );
      },
      title: 'У меня еще нет аккаунта',
    );
  }
}
