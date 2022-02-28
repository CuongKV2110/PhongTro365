import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:phongtro/generated/l10n.dart';
import 'package:phongtro/resources/colors.dart';
import 'package:phongtro/resources/dimensions.dart';
import 'package:phongtro/ui/screen/home_screen.dart';

class SigninScreen extends StatefulWidget {
  const SigninScreen({Key? key}) : super(key: key);

  @override
  _SigninScreenState createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.colorItem1,
        body: Padding(
          padding: const EdgeInsets.fromLTRB(40, 10, 40, 10),
          child: SingleChildScrollView(
            child: Column(
              children: [
                _buildIconApp(),
                const SizedBox(
                  height: 20,
                ),
                _buildLoginForm(),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildIconApp() {
    return Column(
      children: [
        SizedBox(
          width: AppDimensions.d80w,
          height: AppDimensions.d40h,
          child: Image.asset('images/bgr.png'),
        ),
      ],
    );
  }

  Widget _buildLoginForm() {
    return Column(
      children: [
        SizedBox(
          height: 60,
          width: AppDimensions.d80w,
          child: ElevatedButton.icon(
            icon: Image.asset('images/face.png'),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) {
                    return const HomeScreen();
                  },
                ),
              );
            },
            label: Text(
              S.of(context).fb_login,
              style: const TextStyle(color: AppColors.black),
            ),
            style: ElevatedButton.styleFrom(
                primary: Colors.white,
                //side: BorderSide(width:3, color:Colors.brown),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50)),
                padding: const EdgeInsets.all(20)),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        SizedBox(
          height: 60,
          width: AppDimensions.d80w,
          child: ElevatedButton.icon(
            icon: Image.asset('images/google.png'),
            onPressed: () {},
            label: Text(
              S.of(context).gmail_login,
              style: TextStyle(color: AppColors.black),
            ),
            style: ElevatedButton.styleFrom(
                primary: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50)),
                padding: EdgeInsets.all(20)),
          ),
        ),
      ],
    );
  }
}
