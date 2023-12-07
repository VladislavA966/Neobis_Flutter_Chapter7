import 'package:dio/dio.dart';

abstract class AuthRemoteDataSource {
  Future<void> sendAuthData(String email, String password);
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final Dio dio;

  AuthRemoteDataSourceImpl({required this.dio});
  @override
  Future<void> sendAuthData(String email, String password) async {
    await dio.post('path', data: {
      "email": email,
      "password": password,
    });
  }
}
