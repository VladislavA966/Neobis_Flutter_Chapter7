import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:neobis_flutter_chapter_7/src/registration/domain/validation/validation.dart';

part 'registration_event.dart';
part 'registration_state.dart';

class RegistrationBloc extends Bloc<RegistrationEvent, RegistrationState> {
  final UserValidation validation;

  RegistrationBloc({required this.validation}) : super(RegistrationInitial()) {
    on<ValidationEvent>(_mapValidationToState);
  }

  void _mapValidationToState(
      ValidationEvent event, Emitter<RegistrationState> emit) {
    final passwordLength = validation.isValidLength(event.password);
    final hasLetters = validation.hasAlphabetic(event.password);
    final hasDigit = validation.hasDigit(event.password);
    final hasSymbol = validation.hasSpecialChar(event.password);
    final isValid = validation.isValidPassword(event.password);

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
