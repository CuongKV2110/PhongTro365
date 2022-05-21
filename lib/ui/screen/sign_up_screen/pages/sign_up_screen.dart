import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phongtro/ui/screen/sign_up_screen/bloc/sign_up_bloc.dart';
import 'package:phongtro/ui/screen/sign_in_screen/pages/sign_in_screen.dart';
import '../../../../helpers/ui_helper.dart';
import '../../../../resources/colors.dart';
import '../../../../resources/dimensions.dart';
import '../../sign_in_screen/widgets/build_image_widget2.dart';
import '../bloc/sign_up_event.dart';
import '../bloc/sign_up_state.dart';
import '../widgets/sign_in_option.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController confirmController = TextEditingController();
  final SignUpBloc _signUpBloc = SignUpBloc();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    userNameController.dispose();
    _signUpBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener(
      bloc: _signUpBloc,
      listener: (context, state) {
        print(state);
        if (state is SignUpProcessing) {
          UiHelper.showLoading(context);
        }
        if (state is SignUpError) {
          UiHelper.hideLoading(context);
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(_signUpBloc.errorMessage),
          ));
        }
        if (state is SignUpSuccess) {
          print('Đăng ký thành công');
          UiHelper.hideLoading(context);
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (context) {
                return const SignInScreen();
              },
            ),
          );
        }
      },
      child: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                AppColors.lightBlue1,
                AppColors.white,
              ],
            ),
          ),
          child: BlocBuilder(
            bloc: _signUpBloc,
            builder: (context, state) {
              return GestureDetector(
                onTap: () {
                  FocusScope.of(context).requestFocus(FocusNode());
                },
                child: Scaffold(
                  backgroundColor: AppColors.transparent,
                  body: SingleChildScrollView(
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        BuildImageWidget2(),
                        const SizedBox(
                          height: 30,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 24),
                          child: Column(
                            children: [
                              _signUpForm(),
                              const SizedBox(
                                height: 30,
                              ),
                              _buildSignUpButton(),
                              const SizedBox(
                                height: 20,
                              ),
                              const SignInOption(),
                              const SizedBox(
                                height: 20,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _signUpForm() {
    return Column(
      children: [
        TextField(
          controller: userNameController,
          style: const TextStyle(color: AppColors.black),
          decoration: InputDecoration(
            border: InputBorder.none,
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
            labelText: 'Tên hiển thị',
            labelStyle:
                const TextStyle(color: AppColors.black, letterSpacing: 2),
            alignLabelWithHint: true,
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        TextField(
          keyboardType: TextInputType.emailAddress,
          controller: emailController,
          style: const TextStyle(color: AppColors.black),
          decoration: InputDecoration(
            border: InputBorder.none,
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
            labelStyle:
                const TextStyle(color: AppColors.black, letterSpacing: 2),
            alignLabelWithHint: true,
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        TextField(
          controller: passwordController,
          style: const TextStyle(color: AppColors.black),
          obscureText: true,
          decoration: InputDecoration(
            border: InputBorder.none,
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
            labelStyle:
                const TextStyle(color: AppColors.black, letterSpacing: 2),
            alignLabelWithHint: true,
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        TextField(
          controller: confirmController,
          style: const TextStyle(color: AppColors.black),
          obscureText: true,
          decoration: InputDecoration(
            border: InputBorder.none,
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
            labelText: 'Nhập lại mật khẩu',
            labelStyle:
                const TextStyle(color: AppColors.black, letterSpacing: 2),
            alignLabelWithHint: true,
          ),
        ),
      ],
    );
  }

  Widget _buildSignUpButton() {
    return ElevatedButton(
      onPressed: () {
        _signUpBloc.add(SignUpNormal(
          emailController.text.trim(),
          passwordController.text.trim(),
          userNameController.text.trim(),
          confirmController.text.trim(),
        ));
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
              AppColors.orange1,
              AppColors.orange2,
            ],
          ),
          borderRadius: BorderRadius.circular(28),
        ),
        child: Container(
          width: AppDimensions.d60w,
          height: 56,
          alignment: Alignment.center,
          child: const Text(
            'Đăng ký',
            style: const TextStyle(fontSize: 18),
          ),
        ),
      ),
    );
  }
}
