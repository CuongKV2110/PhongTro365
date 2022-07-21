import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phongtro/ui/screen/admin_screen/pages/admin_screen.dart';
import 'package:phongtro/ui/screen/home_screen/pages/home_screen.dart';
import '../bloc/login_bloc.dart';
import '../bloc/login_event.dart';
import '../bloc/login_state.dart';
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
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(_loginBloc.errorMessage),
            ),
          );
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
        if (state is LoginAdmin) {
          print('Login Admin');
          UiHelper.hideLoading(context);
          Navigator.of(context).pushReplacement(
            CupertinoPageRoute(
              builder: (context) {
                return const AdminScreen();
              },
            ),
          );
        }
      },
      child: SafeArea(
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                AppColors.lightBlue1,
                AppColors.white,
              ],
            ),
          ),
          child: Scaffold(
            backgroundColor: Colors.transparent,
            body: BlocBuilder(
              bloc: _loginBloc,
              builder: (context, state) {
                return GestureDetector(
                  onTap: () {
                    FocusScope.of(context).requestFocus(FocusNode());
                  },
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        BuildImageWidget2(),
                        const SizedBox(
                          height: 20,
                        ),
                        _buildSignIn(),
                        const SizedBox(
                          height: 30,
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
            keyboardType: TextInputType.emailAddress,
            style: const TextStyle(color: AppColors.black),
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: 'E-mail',
              hintStyle: const TextStyle(
                color: AppColors.black,
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: const BorderSide(
                  color: AppColors.black,
                  width: 1.0,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: const BorderSide(
                  color: AppColors.black,
                  width: 1.0,
                ),
              ),
              labelText: 'E-mail',
              labelStyle: const TextStyle(color: AppColors.black),
              alignLabelWithHint: true,
            ),
          ),
          const SizedBox(
            height: 26,
          ),
          TextField(
            controller: passwordController,
            style: const TextStyle(color: AppColors.black),
            /* obscureText: true,*/
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: 'Mật khẩu',
              hintStyle: const TextStyle(
                color: AppColors.black,
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: const BorderSide(
                  color: AppColors.black,
                  width: 1.0,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: const BorderSide(
                  color: AppColors.black,
                  width: 1.0,
                ),
              ),
              labelText: 'Mật khẩu',
              labelStyle: const TextStyle(color: AppColors.black),
              alignLabelWithHint: true,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSignInButton() {
    return ElevatedButton(
      onPressed: () {
        _loginBloc.add(LoginNormal(
            emailController.text.trim(), passwordController.text.trim()));
      },
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(28),
        ),
      ),
      child: Ink(
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              AppColors.blue1,
              AppColors.blue1,
            ],
          ),
          borderRadius: BorderRadius.circular(28),
        ),
        child: Container(
          width: AppDimensions.d45w,
          height: 56,
          alignment: Alignment.center,
          child: const Text(
            'Đăng nhập',
            style: TextStyle(fontSize: 18),
          ),
        ),
      ),
    );
  }
}
