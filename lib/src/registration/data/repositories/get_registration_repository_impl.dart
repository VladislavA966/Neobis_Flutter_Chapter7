import 'package:neobis_flutter_chapter_7/src/registration/data/models/registration_model.dart';
import 'package:neobis_flutter_chapter_7/src/registration/data/remote_data_sources/registration_data_source.dart';
import 'package:neobis_flutter_chapter_7/src/registration/domain/entities/registration_user_data.dart';
import 'package:neobis_flutter_chapter_7/src/registration/domain/repositories/registration_repository.dart';

class RegistrationRepositoryImpl implements RegistrationRepository {
  final RegistrationDataSource remoteDataSource;

  RegistrationRepositoryImpl({required this.remoteDataSource});
  @override
  Future<void> sendRegistrationData(
      String email, String login, String password) async {
    final remoteRegister =
        await remoteDataSource.sendRegistrationData(email, login, password);
    
  }
}
