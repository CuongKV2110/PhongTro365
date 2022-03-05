import 'package:flutter/material.dart';
import 'package:phongtro/generated/l10n.dart';
import 'package:phongtro/resources/colors.dart';
import 'package:phongtro/resources/dimensions.dart';
import 'package:phongtro/ui/screen/detail_screen.dart';

import 'home_screen.dart';

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
              const SizedBox(
                height: 80,
              ),
              _buildLoginForm(),
            ],
          ),
        ),
      ),
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
                    return const DetailScreen();
                  },
                ),
              );
            },
            label: Text(
              S.of(context).fb_login,
              style: const TextStyle(color: AppColors.white),
            ),
            style: ElevatedButton.styleFrom(
                primary: AppColors.blue700,
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
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) {
                    return const DetailScreen();
                  },
                ),
              );
            },
            label: Text(
              S.of(context).gmail_login,
              style: const TextStyle(color: AppColors.white),
            ),
            style: ElevatedButton.styleFrom(
                primary: AppColors.red,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50)),
                padding: const EdgeInsets.all(20)),
          ),
        ),
      ],
    );
  }
}
