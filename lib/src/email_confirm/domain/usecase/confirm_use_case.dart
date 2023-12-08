import 'package:neobis_flutter_chapter_7/src/email_confirm/domain/entity/token_entity.dart';
import 'package:neobis_flutter_chapter_7/src/email_confirm/domain/repo/email_confirm_repo.dart';

class ConfirmUseCase {
  final ConfirmRepo repository;

  ConfirmUseCase({required this.repository});

  Future<TokenEntity> call (String code) async {
    return await repository.sendCode(code);
  }
}