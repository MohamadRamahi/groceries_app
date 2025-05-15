import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:groceries_app/const.dart';
import 'package:groceries_app/cubit/cubit/login_cubit.dart';
import 'package:groceries_app/responsive.dart';
import 'package:groceries_app/view/screen/home_screen.dart';
import 'package:groceries_app/view/screen/signup_screen.dart';
import 'package:groceries_app/view/widget/email_widget.dart';
import 'package:groceries_app/view/widget/password_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool rememberMe = false;

  @override
  void initState() {
    super.initState();
    _loadSavedCredentials();
  }

  Future<void> _loadSavedCredentials() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      rememberMe = prefs.getBool('rememberMe') ?? false;
      if (rememberMe) {
        emailController.text = prefs.getString('savedEmail') ?? "";
        passwordController.text = prefs.getString('savedPassword') ?? "";
      }
    });
  }

  Future<void> _saveCredentials(String email, String password) async {
    final prefs = await SharedPreferences.getInstance();
    if (rememberMe) {
      await prefs.setString('savedEmail', email);
      await prefs.setString('savedPassword', password);
      await prefs.setBool('rememberMe', true);
    } else {
      await prefs.remove('savedEmail');
      await prefs.remove('savedPassword');
      await prefs.setBool('rememberMe', false);
    }
  }

  void _handleLogin(BuildContext context) async {
    final email = emailController.text.trim();
    final password = passwordController.text.trim();

    await _saveCredentials(email, password);
    context.read<LoginCubit>().login(email, password);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: BlocConsumer<LoginCubit, LoginState>(
          listener: (context, state) {
            if (state is LoginFailure) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(state.error)),
              );
            } else if (state is LoginSuccess) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("Login successful")),
              );
              Navigator.pushReplacementNamed(context, '/home'); // ✅ هذا ينقلك إلى MainScreen
            }
          },
          builder: (context, state) {
            return SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: responsiveWidth(context, 24),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: responsiveHeight(context, 80)),
                    Center(
                      child: Image.asset(
                        kLogoPath,
                        height: responsiveHeight(context, 80),
                        width: responsiveWidth(context, 80),
                      ),
                    ),
                    SizedBox(height: responsiveHeight(context, 62)),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Log in',
                        style: TextStyle(
                          fontSize: responsiveWidth(context, 32),
                          color: kTextColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(height: responsiveHeight(context, 16)),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Enter your email and password',
                        style: TextStyle(
                          fontSize: responsiveWidth(context, 16),
                          color: const Color(0xff7C7C7C),
                        ),
                      ),
                    ),
                    SizedBox(height: responsiveHeight(context, 40)),
                    EmailWidget(emailEditingController: emailController),
                    SizedBox(height: responsiveHeight(context, 30)),
                    PasswordWidget(passwordEditingController: passwordController),
                    SizedBox(height: responsiveHeight(context, 20)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Checkbox(
                              value: rememberMe,
                              onChanged: (value) {
                                setState(() => rememberMe = value!);
                              },
                              activeColor: kPrimaryColor,
                            ),
                            Text(
                              'Remember me',
                              style: TextStyle(
                                fontSize: responsiveWidth(context, 14),
                                color: kTextColor,
                              ),
                            ),
                          ],
                        ),
                        TextButton(
                          onPressed: () {

                          },
                          child: Text(
                            'Forgot Password?',
                            style: TextStyle(
                              fontSize: responsiveWidth(context, 14),
                              color: kTextColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: responsiveHeight(context, 40)),
                    SizedBox(
                      width: double.infinity,
                      height: responsiveHeight(context, 60),
                      child: ElevatedButton(
                        onPressed: state is LoginLoading
                            ? null
                            : () => _handleLogin(context),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: KbuttonColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(19),
                          ),
                        ),
                        child: state is LoginLoading
                            ? const CircularProgressIndicator(
                          color: Colors.white,
                        )
                            : Text(
                          'Log In',
                          style: TextStyle(
                            fontSize: responsiveWidth(context, 18),
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: responsiveHeight(context, 20)),
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
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>SignupScreen()));
                          },
                          child: Text(
                            'Sign Up',
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
