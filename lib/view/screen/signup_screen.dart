import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:groceries_app/const.dart';
import 'package:groceries_app/cubit/cubit/signup_cubit.dart';
import 'package:groceries_app/responsive.dart';
import 'package:groceries_app/view/screen/login_screen.dart';
import 'package:groceries_app/view/screen/home_screen.dart';
import 'package:groceries_app/view/widget/email_widget.dart';
import 'package:groceries_app/view/widget/full_name_widget.dart';
import 'package:groceries_app/view/widget/password_widget.dart';
import 'package:groceries_app/view/widget/phone_widget.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  void _handleSignup(BuildContext context) {
    final fullName = fullNameController.text.trim();
    final email = emailController.text.trim();
    final phoneNumber = phoneNumberController.text.trim();
    final password = passwordController.text.trim();
    final confirmPassword = confirmPasswordController.text.trim();



    context.read<SignupCubit>().signup(
      fullName,
      email,
      phoneNumber,
      password,
      confirmPassword,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: BlocConsumer<SignupCubit, SignupState>(
          listener: (context, state) {
            if (state is SignupFailure) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(state.error)),
              );
            } else if (state is SignupSuccess) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("Signup successful")),
              );
              Navigator.pushReplacementNamed(context, '/home'); // ✅ هذا ينقلك إلى MainScreen

            }
          },
          builder: (context, state) {
            return SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: responsiveWidth(context, 24)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: responsiveHeight(context, 40)),
                    Center(
                      child: Image.asset(
                        kLogoPath,
                        height: responsiveHeight(context, 80),
                        width: responsiveWidth(context, 80),
                      ),
                    ),
                    SizedBox(height: responsiveHeight(context, 30)),
                    Text(
                      'Sign Up',
                      style: TextStyle(
                        fontSize: responsiveWidth(context, 32),
                        fontWeight: FontWeight.bold,
                        color: kTextColor,
                      ),
                    ),
                    SizedBox(height: responsiveHeight(context, 14)),

                    Text('Enter your credential to continue',
                    style: TextStyle(
                      color: Color(0xff7C7C7C),
                      fontSize: responsiveWidth(context, 16),
                    ),),
                    SizedBox(height: responsiveHeight(context, 40)),

                    FullNameWidget(nameEditingController: fullNameController),

                    SizedBox(height: responsiveHeight(context, 30)),

                    EmailWidget(emailEditingController: emailController),

                    SizedBox(height: responsiveHeight(context, 30)),

                    PhoneWidget(
                      phoneEditingController: phoneNumberController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a phone number';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: responsiveHeight(context, 20)),
                    PasswordWidget(passwordEditingController: passwordController),
                    SizedBox(height: responsiveHeight(context, 20)),
                    SizedBox(height: responsiveHeight(context, 40)),
                    SizedBox(
                      width: double.infinity,
                      height: responsiveHeight(context, 60),
                      child: ElevatedButton(
                        onPressed: state is SignupLoading ? null : () => _handleSignup(context),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: KbuttonColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(19),
                          ),
                        ),
                        child: state is SignupLoading
                            ? const CircularProgressIndicator(color: Colors.white)
                            : Text(
                          'Sign Up',
                          style: TextStyle(
                            fontSize: responsiveWidth(context, 18),
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                   SizedBox(
                     height: responsiveHeight(context, 20),
                   ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Don't have an account? ",
                          style: TextStyle(
                            fontSize: responsiveWidth(context, 14),
                            color: kTextColor,
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginScreen()));
                          },
                          child: Text(
                            'Login',
                            style: TextStyle(
                              fontSize: responsiveWidth(context, 14),
                              color: kPrimaryColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
