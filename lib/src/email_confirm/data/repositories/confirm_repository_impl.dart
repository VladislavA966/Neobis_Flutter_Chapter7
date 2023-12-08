import 'package:neobis_flutter_chapter_7/src/email_confirm/data/data_source/remote_data_source.dart';
import 'package:neobis_flutter_chapter_7/src/email_confirm/domain/entity/token_entity.dart';
import 'package:neobis_flutter_chapter_7/src/email_confirm/domain/repo/email_confirm_repo.dart';

class ConfirmRepoImpl implements ConfirmRepo {
  final ConfirmDataSocurce dataSocurce;

  ConfirmRepoImpl({required this.dataSocurce});
  @override
  Future<TokenEntity> sendCode(String code) async {
    final remoteToken = await dataSocurce.sendCode(code);

    return TokenEntity(remoteToken.refresh);
  }
}
