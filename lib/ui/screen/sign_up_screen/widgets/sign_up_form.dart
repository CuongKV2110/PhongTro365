import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:phongtro/ui/screen/home_screen/pages/home_screen.dart';

import '../../../../resources/colors.dart';
import '../../../../resources/dimensions.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({Key? key}) : super(key: key);

  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmController = TextEditingController();
  final auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          controller: usernameController,
          style: const TextStyle(color: AppColors.white),
          decoration: InputDecoration(
            border: InputBorder.none,
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
            labelText: 'User Name',
            labelStyle:
                const TextStyle(color: AppColors.white, letterSpacing: 2),
            alignLabelWithHint: true,
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        TextField(
          controller: emailController,
          style: const TextStyle(color: AppColors.white),
          decoration: InputDecoration(
            border: InputBorder.none,
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
            labelStyle:
                const TextStyle(color: AppColors.white, letterSpacing: 2),
            alignLabelWithHint: true,
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        TextField(
          controller: passwordController,
          style: const TextStyle(color: AppColors.white),
          obscureText: true,
          decoration: InputDecoration(
            border: InputBorder.none,
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
            labelText: 'Password',
            labelStyle:
                const TextStyle(color: AppColors.white, letterSpacing: 2),
            alignLabelWithHint: true,
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        TextField(
          controller: confirmController,
          style: const TextStyle(color: AppColors.white),
          obscureText: true,
          decoration: InputDecoration(
            border: InputBorder.none,
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
            labelText: 'Confirm Password',
            labelStyle:
                const TextStyle(color: AppColors.white, letterSpacing: 2),
            alignLabelWithHint: true,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        _buildSignUpButton()
      ],
    );
  }

  Widget _buildSignUpButton() {
    return Container(
      height: 56,
      width: AppDimensions.d40w,
      child: Center(
        child: ElevatedButton(
          onPressed: () {
            if (checkPass() && isEmail(emailController.text.trim())) {
              FirebaseAuth.instance
                  .createUserWithEmailAndPassword(
                      email: emailController.text,
                      password: passwordController.text)
                  .then((value) {
                print("Created New Account");
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HomeScreen()));
              });
            } else {
              if (!isEmail(emailController.text.trim())) {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text("Email khong hop le !!!"),
                ));
              } else {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text("Mat khau khong giong nhau !!!"),
                ));
              }
            }
          },
          style: ElevatedButton.styleFrom(
              primary: AppColors.black,
              padding: EdgeInsets.zero,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(28),
              ),
              fixedSize: Size(AppDimensions.d40w - 4, 52)),
          child: const Text(
            'Sign Up',
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

  bool checkPass() {
    if (passwordController.text.trim() == confirmController.text.trim()) {
      return true;
    } else
      return false;
  }

  bool isEmail(String email) {
    String p =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = new RegExp(p);
    return regExp.hasMatch(email);
  }
}
