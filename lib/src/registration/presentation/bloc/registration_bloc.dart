import 'package:bloc/bloc.dart';

import 'package:meta/meta.dart';
import 'package:neobis_flutter_chapter_7/src/registration/domain/usecases/registration_data_usecase.dart';

part 'registration_event.dart';
part 'registration_state.dart';

class RegistrationBloc extends Bloc<RegistrationEvent, RegistrationState> {
  final RegistrationUseCase useCase;

  RegistrationBloc({required this.useCase}) : super(RegistrationInitial()) {
    on<ValidationEvent>(_mapValidationToState);
    on<SendRegistrationData>(_mapSendRegistrationDataToState);
  }

  void _mapSendRegistrationDataToState(
      SendRegistrationData event, Emitter<RegistrationState> emit) async {
    emit(
      SendRegistrationDataLoading(),
    );
    try {
      await useCase.repository
          .sendRegistrationData(event.email, event.login, event.passwrod);
      emit(
        SendRegistrationDataLoaded(),
      );
    } catch (e) {
      emit(
        SendRegistrationDataError(
          errorText: 'Неверные данные',
        ),
      );
    }
  }

  void _mapValidationToState(
      ValidationEvent event, Emitter<RegistrationState> emit) {
    final passwordLength = useCase.isValidLength(event.password);
    final hasLetters = useCase.hasAlphabetic(event.password);
    final hasDigit = useCase.hasDigit(event.password);
    final hasSymbol = useCase.hasSpecialChar(event.password);
    final isValid = useCase.isValidPassword(event.password);

    emit(
      ValidationState(
        isValid: isValid,
        passwordLength: passwordLength,
        passwordUpperCase: hasLetters,
        number: hasDigit,
        symbol: hasSymbol,
      ),
    );
  }
}
