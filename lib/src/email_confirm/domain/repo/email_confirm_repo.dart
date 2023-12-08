import 'package:neobis_flutter_chapter_7/src/email_confirm/domain/entity/token_entity.dart';

abstract class ConfirmRepo {
  Future<TokenEntity> sendCode (String code);
}