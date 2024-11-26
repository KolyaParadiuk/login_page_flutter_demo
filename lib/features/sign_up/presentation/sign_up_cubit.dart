import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_page_flutter_demo/common/utils/email_validator.dart';
import 'package:login_page_flutter_demo/common/utils/password_validator.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit() : super(const SignUpState());

  Future<bool> signUp() async {
    validateEmail();
    validatePassword();
    return !state.emailError && state.lateValidationPasswordErrors.isEmpty;
  }

  void onEmailChanged(String email) {
    emit(
      state.copyWith(
        email: email,
        emailValidatedSuccess: false,
        emailError: false,
      ),
    );
  }

  void onPasswordChanged(String? password) {
    final errors = PasswordValidator.validate(password ?? '');
    emit(
      state.copyWith(
        password: password,
        inTimeValidationPasswordErrors: errors,
        lateValidationPasswordErrors: [],
      ),
    );
  }

  void validateEmail() {
    final isValid = EmailValidator.validate(state.email);
    emit(
      state.copyWith(
        emailError: !isValid,
        emailValidatedSuccess: isValid,
      ),
    );
  }

  void validatePassword() {
    final errors = PasswordValidator.validate(state.password ?? '');
    emit(
      state.copyWith(
        lateValidationPasswordErrors: errors,
      ),
    );
  }
}

class SignUpState {
  const SignUpState({
    this.email,
    this.emailError = false,
    this.emailValidatedSuccess = false,
    this.password,
    this.lateValidationPasswordErrors = const [],
    this.inTimeValidationPasswordErrors = PasswordRequirements.values,
  });

  final String? email;
  final bool emailError;
  final bool emailValidatedSuccess;
  final String? password;
  final List<PasswordRequirements> inTimeValidationPasswordErrors;
  final List<PasswordRequirements> lateValidationPasswordErrors;

  SignUpState copyWith({
    String? email,
    bool? emailError,
    String? password,
    List<PasswordRequirements>? lateValidationPasswordErrors,
    List<PasswordRequirements>? inTimeValidationPasswordErrors,
    bool? emailValidatedSuccess,
  }) {
    return SignUpState(
      email: email ?? this.email,
      emailError: emailError ?? this.emailError,
      password: password ?? this.password,
      inTimeValidationPasswordErrors:
          inTimeValidationPasswordErrors ?? this.inTimeValidationPasswordErrors,
      lateValidationPasswordErrors:
          lateValidationPasswordErrors ?? this.lateValidationPasswordErrors,
      emailValidatedSuccess:
          emailValidatedSuccess ?? this.emailValidatedSuccess,
    );
  }
}
