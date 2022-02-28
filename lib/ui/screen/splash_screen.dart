import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:phongtro/generated/l10n.dart';
import 'package:phongtro/resources/colors.dart';
import 'package:phongtro/resources/dimensions.dart';
import 'package:phongtro/resources/fontsizes.dart';
import 'package:phongtro/ui/screen/signin_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.white,
        body: Padding(
          padding: EdgeInsets.fromLTRB(40, 10, 40, 10),
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: AppDimensions.d80w,
                height: AppDimensions.d40h,
                child: Image.asset('images/bgr3.jpg'),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                S.of(context).appname,
                style: const TextStyle(fontSize: 30),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                S.of(context).splash1,
                style: const TextStyle(fontSize: 20),
              ),
              SizedBox(
                height: AppDimensions.d20h,
              ),
              SizedBox(
                height: 50,
                width: AppDimensions.d40w,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) {
                          return const SigninScreen();
                        },
                      ),
                    );
                  },
                  child: Text(
                    S.of(context).login,
                    style: const TextStyle(color: AppColors.black),
                  ),
                  style: ElevatedButton.styleFrom(
                      primary: AppColors.colorItem1,
                      //side: BorderSide(width:3, color:Colors.brown),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50)),
                      padding: const EdgeInsets.all(10)),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
