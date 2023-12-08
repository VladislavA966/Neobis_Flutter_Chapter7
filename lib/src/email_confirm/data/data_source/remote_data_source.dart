import 'package:dio/dio.dart';
import 'package:neobis_flutter_chapter_7/src/email_confirm/data/models/token_model.dart';

abstract class ConfirmDataSocurce {
  Future<TokenModel> sendCode(String code);
}

class ConfirmDataSocurceImpl implements ConfirmDataSocurce {
  final Dio dio;

  ConfirmDataSocurceImpl({required this.dio});
  @override
  Future<TokenModel> sendCode(String code) async {
    final responce =
        await dio.post('/confirm-email/$code', data: {'code': code});
    return TokenModel.fromJson(responce.data);
  }
}
