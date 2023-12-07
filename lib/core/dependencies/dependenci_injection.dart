import 'package:get_it/get_it.dart';
import 'package:neobis_flutter_chapter_7/core/services/dio_settings.dart';
import 'package:neobis_flutter_chapter_7/src/auth/data/datasources/auth_remote_data_source.dart';
import 'package:neobis_flutter_chapter_7/src/auth/data/repositories/auth_repository_impl.dart';
import 'package:neobis_flutter_chapter_7/src/auth/domain/usecases/auth_use_case.dart';
import 'package:neobis_flutter_chapter_7/src/registration/data/remote_data_sources/registration_data_source.dart';
import 'package:neobis_flutter_chapter_7/src/registration/data/repositories/get_registration_repository_impl.dart';
import 'package:neobis_flutter_chapter_7/src/registration/domain/usecases/registration_data_usecase.dart';

final getIt = GetIt.instance;

void setupDependencies() {
  getIt.registerSingleton<DioSettings>(
    DioSettings(),
  );
  getIt.registerSingleton<RegisterDataSourceImpl>(
    RegisterDataSourceImpl(
      dio: getIt<DioSettings>().dio,
    ),
  );
  getIt.registerSingleton<RegistrationRepositoryImpl>(
    RegistrationRepositoryImpl(
      remoteDataSource: getIt<RegisterDataSourceImpl>(),
    ),
  );
  getIt.registerSingleton<RegistrationUseCase>(
    RegistrationUseCase(
      repository: getIt<RegistrationRepositoryImpl>(),
    ),
  );
  getIt.registerSingleton<AuthRemoteDataSourceImpl>(
    AuthRemoteDataSourceImpl(
      dio: getIt<DioSettings>().dio,
    ),
  );
  getIt.registerSingleton<AuthRepositoryImpl>(
    AuthRepositoryImpl(
      authRemoteDataSource: getIt<AuthRemoteDataSourceImpl>(),
    ),
  );
  getIt.registerSingleton<AuthUseCase>(
    AuthUseCase(
      repository: getIt<AuthRepositoryImpl>(),
    ),
  );
}
