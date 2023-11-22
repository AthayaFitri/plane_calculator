// ignore_for_file: use_build_context_synchronously, avoid_print, non_constant_identifier_names, unnecessary_new

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../utils/themes.dart';
import '../components/plane_text_form_field.dart';
import '../components/loading.dart';
import '../components/flushbar.dart';
import '../components/primary_button.dart';
import '../pages/main_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _loginFormKey = GlobalKey<FormState>();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  late SharedPreferences logindata;
  late bool newuser;
  late bool _isValidation = false;
  late bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    check_if_already_login();
  }

  void check_if_already_login() async {
    logindata = await SharedPreferences.getInstance();
    newuser = (logindata.getBool('login') ?? true);
    print(newuser);
    if (newuser == false) {
      Navigator.pushReplacement(context,
          new MaterialPageRoute(builder: (context) => const MainPage()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          body: SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: SafeArea(
              child: Form(
                key: _loginFormKey,
                autovalidateMode: _isValidation
                    ? AutovalidateMode.onUserInteraction
                    : AutovalidateMode.disabled,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 30),
                    Text('Welcome to Plane Calculator!',
                    textAlign: TextAlign.center,
                        style: PlaneFonts(context).boldQuicksand(
                          size: 40,
                          color: PlaneColors.primary,
                        )),
                    Text(
                      'Login in to continue',
                      style: PlaneFonts(context).semiBoldQuicksand(
                          size: 13, color: PlaneColors.black),
                    ),
                    const SizedBox(height: 60),
                    const Image(
                      image: AssetImage('assets/img/illustration_login.png'),
                    ),
                    const SizedBox(height: 30),
                    PlaneTextFormField(
                      noLabel: true,
                      controller: _usernameController,
                      hint: 'Username',
                      capitalization: TextCapitalization.none,
                      validator: (val) {
                        if (val!.isEmpty) {
                          return "Username is required";
                        } else {
                          return null;
                        }
                      },
                    ),
                    const SizedBox(height: 15),
                    PlaneTextFormField(
                      noLabel: true,
                      password: true,
                      suffix: true,
                      controller: _passwordController,
                      hint: 'Password',
                      capitalization: TextCapitalization.none,
                      validator: (val) {
                        if (val!.isEmpty) {
                          return "Password is required";
                        } else {
                          return null;
                        }
                      },
                    ),
                    const SizedBox(height: 30),
                    PrimaryButton(
                      text: 'LOGIN',
                      onTap: () async {
                        FocusScope.of(context).requestFocus(FocusNode());
                        setState(() {
                          _isValidation = true;
                        });
                        if (_loginFormKey.currentState!.validate()) {
                          setState(() {
                            _isLoading = true;
                          });
                          await Future.delayed((const Duration(seconds: 1)),
                              () {
                            setState(() {
                              _isLoading = false;
                            });
                          });

                          // ignore: unrelated_type_equality_checks
                          if (_usernameController.text == 'admin' &&
                              _passwordController.text == 'admin') {
                            logindata.setBool('login', false);
                            logindata.setString('username', _usernameController.text);
                            Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                    builder: (context) => const MainPage()));
                          } else {
                            alert(context,
                                text: 'Username dan Password salah',
                                icon: Icons.error);
                          }
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        LoadingScreen(loading: _isLoading),
      ],
    );
  }
}
