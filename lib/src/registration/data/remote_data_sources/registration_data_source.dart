
import 'package:neobis_flutter_chapter_7/core/services/dio_settings.dart';

abstract class RegistrationDataSource {
  Future<void> sendRegistrationData(
      String email, String login, String password);
}

class RegisterDataSourceImpl implements RegistrationDataSource {
  final DioSettings dioSettings;

  RegisterDataSourceImpl({required this.dioSettings});
  @override
  Future<void> sendRegistrationData(
      String email, String login, String password) async {
    await dioSettings.dio.post('/register/', data: {
      "email": email,
      "password": password,
      "username": login,
    });
  }
}
