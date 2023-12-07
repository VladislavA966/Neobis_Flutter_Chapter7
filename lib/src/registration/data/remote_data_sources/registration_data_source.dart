import 'package:dio/dio.dart';
import 'package:neobis_flutter_chapter_7/core/services/dio_settings.dart';

abstract class RegistrationDataSource {
  Future<void> sendRegistrationData(
      String email, String login, String password);
}

class RegisterDataSourceImpl implements RegistrationDataSource {
  final Dio dio;

  RegisterDataSourceImpl({required this.dio});
  @override
  Future<void> sendRegistrationData(
      String email, String login, String password) async {
    await dio
        .post('https://authdrf-production.up.railway.app/register/', data: {
      "email": email,
      "password": password,
      "username": login,
    });
  }
}
