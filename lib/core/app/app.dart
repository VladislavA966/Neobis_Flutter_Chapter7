import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:neobis_flutter_chapter_7/core/dependencies/dependenci_injection.dart';
import 'package:neobis_flutter_chapter_7/core/resourses/app_colors/app_colors.dart';
import 'package:neobis_flutter_chapter_7/src/registration/domain/usecases/registration_data_usecase.dart';
import 'package:neobis_flutter_chapter_7/src/registration/presentation/bloc/registration_bloc.dart';
import 'package:neobis_flutter_chapter_7/src/splashscreen/presentation/splash_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegistrationBloc(
        useCase: getIt<RegistrationUseCase>(),
      ),
      child: MaterialApp(
        theme: ThemeData(
          scaffoldBackgroundColor: AppColors.textWhite,
        ),
        home: const SplashScreen(),
      ),
    );
  }
}
