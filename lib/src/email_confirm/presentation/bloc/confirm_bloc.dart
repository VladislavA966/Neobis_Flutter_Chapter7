import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:neobis_flutter_chapter_7/src/email_confirm/domain/entity/token_entity.dart';
import 'package:neobis_flutter_chapter_7/src/email_confirm/domain/usecase/confirm_use_case.dart';

part 'confirm_event.dart';
part 'confirm_state.dart';

class ConfirmBloc extends Bloc<ConfirmEvent, ConfirmState> {
  final ConfirmUseCase useCase;

  ConfirmBloc({required this.useCase}) : super(ConfirmInitial()) {
    on<ConfirmByCodeEvent>(_onConfirmByCodeEvent);
  }

  Future<void> _onConfirmByCodeEvent(
      ConfirmByCodeEvent event, Emitter<ConfirmState> emit) async {
    emit(ConfirmLoading());
    try {
      final TokenEntity token = await useCase.call(event.code);
      emit(ConfirmLoaded(model: token));
    } catch (e) {
      emit(ConfirmError(errorText: e.toString()));
    }
  }
}
