import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

// States
abstract class SignupState extends Equatable {
  const SignupState();

  @override
  List<Object> get props => [];
}

class SignupInitial extends SignupState {}
class SignupLoading extends SignupState {}
class SignupSuccess extends SignupState {}
class SignupFailure extends SignupState {
  final String error;
  const SignupFailure(this.error);

  @override
  List<Object> get props => [error];
}

// Cubit Class
class SignupCubit extends Cubit<SignupState> {
  SignupCubit() : super(SignupInitial());

  void signup(String fullName, String email,  String phoneNumber, String password, String confirmPassword) {
    final error = _validateInputs(fullName, email, phoneNumber, password, );
    if (error != null) {
      emit(SignupFailure(error));
      return;
    }

    emit(SignupLoading());

    Future.delayed(const Duration(seconds: 2), () {
      if (isClosed) return;
      emit(SignupSuccess());
    });
  }

  String? _validateInputs(String fullName, String email,  String phoneNumber, String password, ) {
    if (fullName.isEmpty || email.isEmpty  || phoneNumber.isEmpty || password.isEmpty ) {
      return "All fields are required";
    }
    if (fullName.length < 3) {
      return "Full Name must be at least 3 characters";
    }
    if (!RegExp(r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$").hasMatch(email)) {
      return "Invalid email format";
    }


    final RegExp phoneRegex = RegExp(r'^(77|78|79)\d{7}$');
    if (!phoneRegex.hasMatch(phoneNumber)) {
      return 'Invalid phone number. Must start with 077, 078, or 079 and be 10 digits long.';
    }
    if (!RegExp(r"^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[\W_]).{6,}$").hasMatch(password)) {
      return "Password must contain at least:\n- One uppercase letter\n- One lowercase letter\n- One number\n- One special character";
    }

    return null;
  }
}
