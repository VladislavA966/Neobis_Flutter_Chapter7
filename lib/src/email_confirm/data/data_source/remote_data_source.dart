import 'package:dio/dio.dart';
import 'package:neobis_flutter_chapter_7/src/email_confirm/data/models/token_model.dart';

abstract class ConfirmDataSource {
  Future<TokenModel> sendCode(String code);
}

class ConfirmDataSourceImpl implements ConfirmDataSource {
  final Dio dio;

  ConfirmDataSourceImpl({required this.dio});

  @override
  Future<TokenModel> sendCode(String code) async {
    final response = await dio.post('/confirm-email/$code/', data: {'code': code});

    if (response.statusCode == 200) {
      return TokenModel.fromJson(response.data);
    } else {
      throw Exception('Ошибка. Status code: ${response.statusCode}');
    }
  }
}
