import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:neobis_flutter_chapter_7/core/resourses/app_colors/app_colors.dart';
import 'package:neobis_flutter_chapter_7/core/services/dio_settings.dart';
import 'package:neobis_flutter_chapter_7/src/registration/data/remote_data_sources/registration_data_source.dart';
import 'package:neobis_flutter_chapter_7/src/registration/data/repositories/get_registration_repository_impl.dart';
import 'package:neobis_flutter_chapter_7/src/registration/domain/repositories/registration_repository.dart';
import 'package:neobis_flutter_chapter_7/src/registration/domain/usecases/registration_data_usecase.dart';
import 'package:neobis_flutter_chapter_7/src/registration/domain/validation/validation.dart';
import 'package:neobis_flutter_chapter_7/src/registration/presentation/bloc/registration_bloc.dart';
import 'package:neobis_flutter_chapter_7/src/splashscreen/presentation/splash_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  setupDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegistrationBloc(
        // validation: getIt<UserValidation>(),
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

final getIt = GetIt.instance;

void setupDependencies() {
  getIt.registerSingleton<DioSettings>(DioSettings());
 // getIt.registerSingleton<UserValidation>(UserValidation());
  getIt.registerSingleton<RegistrationUseCase>(
    RegistrationUseCase(
      RegistrationRepositoryImpl(
        remoteDataSource: RegisterDataSourceImpl(dio: DioSettings().dio),
      ),
    ),
  );
}
