import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:phongtro/resources/colors.dart';
import 'package:phongtro/ui/screen/detail_room_screen/pages/detail_room_screen.dart';
import 'package:phongtro/ui/screen/home_screen/pages/home_screen.dart';

class PostNotifyScreen extends StatelessWidget {
  const PostNotifyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration.zero, () {
      return AwesomeDialog(
        context: context,
        dialogType: DialogType.SUCCES,
        width: 360,
        buttonsBorderRadius: BorderRadius.circular(20),
        headerAnimationLoop: false,
        animType: AnimType.TOPSLIDE,
        title: 'Đăng bài thành công',
        showCloseIcon: false,
        btnOkOnPress: () {
          Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (context) => HomeScreen()),
              (Route<dynamic> route) => false);
        },
        btnOkText: 'Trang chủ',
        btnCancelOnPress: () {
          Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (context) => DetailRoomScreen()),
              (Route<dynamic> route) => false);
        },
        btnCancelText: 'Xem bài viết',
        btnCancelColor: AppColors.green1,
        btnOkColor: AppColors.green1,
      ).show();
    });
    return Center();
  }
}
