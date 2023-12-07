import 'package:dio/dio.dart';

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
