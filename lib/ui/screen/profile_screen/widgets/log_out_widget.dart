import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

import '../../../../resources/colors.dart';
import '../../sign_in_screen/pages/sign_in_screen.dart';

class LogOutWidget extends StatelessWidget {
  const LogOutWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
          onPressed: () {
            AwesomeDialog(
              context: context,
              dialogType: DialogType.INFO_REVERSED,
              width: 360,
              buttonsBorderRadius: BorderRadius.circular(20),
              headerAnimationLoop: false,
              animType: AnimType.TOPSLIDE,
              title: 'Log Out',
              desc: 'Are you sure want to Log out ?',
              showCloseIcon: false,
              btnOkOnPress: () {},
              btnOkText: 'No',
              btnCancelOnPress: () {
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(
                        builder: (BuildContext context) =>
                            const SignInScreen()),
                    (Route<dynamic> route) => false);
              },
              btnCancelText: 'Yes',
              btnCancelColor: AppColors.red,
              btnOkColor: AppColors.green2,
            ).show();
          },
          child: Icon(
            Ionicons.power_outline,
            color: Colors.white,
          ),
          style: ElevatedButton.styleFrom(
            shape: CircleBorder(),
            padding: EdgeInsets.all(20),
            primary: AppColors.yellow1,
          ),
        ),
        SizedBox(
          height: 6,
        ),
        Text(
          'Đăng xuất',
          style: TextStyle(color: AppColors.black),
        )
      ],
    );
  }
}
