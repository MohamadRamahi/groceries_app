import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

// States
abstract class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object> get props => [];
}

class LoginInitial extends LoginState {}
class LoginLoading extends LoginState {}
class LoginSuccess extends LoginState {}
class LoginFailure extends LoginState {
  final String error;
  const LoginFailure(this.error);

  @override
  List<Object> get props => [error];
}

// Cubit Class
class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  void login(String email, String password) {
    final validationError = _validateInputs(email, password);
    if (validationError != null) {
      emit(LoginFailure(validationError));
      return;
    }

    emit(LoginLoading());

    Future.delayed(const Duration(seconds: 2), () {
      if (isClosed) return; // ✅ تحقق من أن Cubit لم يتم التخلص منه

      if (email == email && password == password) {
        emit(LoginSuccess());
      } else {
        emit(const LoginFailure("Invalid email or password"));
      }
    });
  }

  String? _validateInputs(String email, String password) {
    final emailRegex = RegExp(
        r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@"
        r"[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?"
        r"(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)+$"
    );

    final passwordRegex = RegExp(r'^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[\W_]).{8,}$');

    if (email.isEmpty || password.isEmpty) {
      return "Fields cannot be empty";
    }

    if (!emailRegex.hasMatch(email)) {
      return "Invalid email format";
    }

    if (!passwordRegex.hasMatch(password)) {
      return "Password must be at least 8 characters long, include uppercase, lowercase, number, and special character.";
    }

    return null;
  }

}
