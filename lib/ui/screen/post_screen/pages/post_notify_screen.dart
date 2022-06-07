import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:phongtro/resources/colors.dart';
import '../../home_screen/pages/home_screen.dart';
import '../../posted_screen/pages/posted_screen.dart';

class PostNotifyScreen extends StatelessWidget {
  late String postId;
  PostNotifyScreen(this.postId);

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
        title: 'Đăng bài thành công. Đợi Admin duyệt nha !',
        showCloseIcon: false,
        btnOkOnPress: () {
          Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (context) => const HomeScreen()),
              (Route<dynamic> route) => false);
        },
        btnOkText: 'Trang chủ',
        btnCancelOnPress: () {
          Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(
                  builder: (context) => PostedScreen(back: 1, postId: postId)),
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
