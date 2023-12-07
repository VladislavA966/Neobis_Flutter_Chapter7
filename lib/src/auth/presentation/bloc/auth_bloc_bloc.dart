import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:neobis_flutter_chapter_7/src/auth/domain/usecases/auth_use_case.dart';

part 'auth_bloc_event.dart';
part 'auth_bloc_state.dart';

class AuthBloc extends Bloc<AuthBlocEvent, AuthBlocState> {
  final AuthUseCase useCase;
  AuthBloc({required this.useCase}) : super(AuthBlocInitial()) {
    on<GetAuthEvent>(_mapGetAuthEventToState);
  }
  void _mapGetAuthEventToState(
      GetAuthEvent event, Emitter<AuthBlocState> emit) async {
    emit(
      AuthBlocLoading(),
    );
    try {
      await useCase.repository.logIn(event.email, event.password);
      emit(
        AuthBlocLoaded(),
      );
    } catch (e) {
      emit(
        AuthBlocError(
          errorText: 'Неверные логин или пароль',
        ),
      );
    }
  }
}
