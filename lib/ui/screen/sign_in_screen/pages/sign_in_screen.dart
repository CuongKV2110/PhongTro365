import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phongtro/ui/screen/home_screen/pages/home_screen.dart';
import '../../../../bloc/login/login_bloc.dart';
import '../../../../bloc/login/login_event.dart';
import '../../../../bloc/login/login_state.dart';
import '../../../../helpers/ui_helper.dart';
import '../../../../resources/colors.dart';
import '../../../../resources/dimensions.dart';
import '../widgets/build_image_widget2.dart';
import '../widgets/build_media_widget.dart';
import '../widgets/sign_up_widget.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final LoginBloc _loginBloc = LoginBloc();
  String text = '';

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    _loginBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener(
      bloc: _loginBloc,
      listener: (context, state) {
        print(state);
        if (state is LoginProcessing) {
          UiHelper.showLoading(context);
        }
        if (state is LoginError) {
          UiHelper.hideLoading(context);
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(_loginBloc.errorMessage),
          ));
        }
        if (state is LoginSuccess) {
          print('Login thanh cong');
          UiHelper.hideLoading(context);
          Navigator.of(context).pushReplacement(
            CupertinoPageRoute(
              builder: (context) {
                return const HomeScreen();
              },
            ),
          );
        }
      },
      child: SafeArea(
        child: Scaffold(
          backgroundColor: AppColors.black,
          body: BlocBuilder(
            bloc: _loginBloc,
            builder: (context, state) {
              return GestureDetector(
                onTap: () {
                  print('A');
                  FocusScope.of(context).requestFocus(FocusNode());
                },
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      BuildImageWidget2(),
                      const SizedBox(
                        height: 20,
                      ),
                      _buildSignIn(),
                      const SizedBox(
                        height: 20,
                      ),
                      _buildSignInButton(),
                      const SizedBox(
                        height: 20,
                      ),
                      const BuildMediaWidget(),
                      const SizedBox(
                        height: 10,
                      ),
                      const SignUpWidget(),
                      const SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildSignIn() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          TextField(
            controller: emailController,
            style: const TextStyle(color: AppColors.white),
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: 'E-mail',
              hintStyle: const TextStyle(
                color: AppColors.white,
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: const BorderSide(
                  color: AppColors.white,
                  width: 1.0,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: const BorderSide(
                  color: AppColors.white,
                  width: 1.0,
                ),
              ),
              labelText: 'E-mail',
              labelStyle: const TextStyle(color: AppColors.white),
              alignLabelWithHint: true,
            ),
          ),
          const SizedBox(
            height: 26,
          ),
          TextField(
            controller: passwordController,
            style: const TextStyle(color: AppColors.white),
            obscureText: true,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: 'Pass word',
              hintStyle: const TextStyle(
                color: AppColors.white,
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: const BorderSide(
                  color: AppColors.white,
                  width: 1.0,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: const BorderSide(
                  color: AppColors.white,
                  width: 1.0,
                ),
              ),
              labelText: 'Pass word',
              labelStyle: const TextStyle(color: AppColors.white),
              alignLabelWithHint: true,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }

  Widget _buildSignInButton() {
    return Container(
      height: 56,
      width: AppDimensions.d40w,
      child: Center(
        child: ElevatedButton(
          onPressed: () {
            _loginBloc.add(LoginNormal(
                emailController.text.trim(), passwordController.text.trim()));
          },
          style: ElevatedButton.styleFrom(
              primary: AppColors.black,
              padding: EdgeInsets.zero,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(28),
              ),
              fixedSize: Size(AppDimensions.d40w - 4, 52)),
          child: const Text(
            'Sign In',
            style: TextStyle(
              color: AppColors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            AppColors.orange1,
            AppColors.orange2,
          ],
        ),
        borderRadius: BorderRadius.circular(32),
      ),
    );
  }
}
