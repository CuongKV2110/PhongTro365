import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:phongtro/ui/screen/my_post/pages/my_post_screen.dart';
import 'package:phongtro/ui/screen/post_screen/pages/post1_screen.dart';
import 'package:phongtro/ui/screen/profile_screen/pages/profile_screen.dart';
import 'package:phongtro/ui/screen/saved_screen/pages/saved_screen.dart';
import 'package:phongtro/ui/screen/sign_in_screen/pages/sign_in_screen.dart';

import '../../../../models/menu_item.dart';
import '../../../../resources/colors.dart';
import 'menu_widget.dart';

class BuildDrawer extends StatelessWidget {
  final List<MenuItem> list = [
    MenuItem(icon: Ionicons.person_circle_outline, name: 'Thông tin tài khoản'),
    MenuItem(icon: Ionicons.create_outline, name: 'Bài viết đã đăng'),
    MenuItem(icon: Ionicons.bookmark_outline, name: 'Bài viết đã lưu'),
    MenuItem(icon: Ionicons.person_outline, name: 'Bạn bè và theo dõi'),
    MenuItem(icon: Ionicons.hand_left_outline, name: 'Chính sách & điều khoản'),
    MenuItem(icon: Ionicons.help_circle_outline, name: 'Trợ giúp'),
    MenuItem(icon: Ionicons.information_circle_outline, name: 'Thông tin'),
  ];

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppColors.black,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () {
                  Scaffold.of(context).openEndDrawer();
                },
                child: const Icon(
                  Icons.close,
                  color: AppColors.white,
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              ListView.builder(
                shrinkWrap: true,
                itemCount: list.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        CupertinoPageRoute(
                          builder: (context) {
                            if (index == 0) {
                              return ProfileScreen();
                            }
                            if (index == 1) {
                              return SavedScreen();
                            }
                            if (index == 2) {
                              return SavedScreen();
                            }
                            if (index == 3) {
                              return ProfileScreen();
                            } else
                              return SizedBox();
                          },
                        ),
                      );
                    },
                    child: MenuWidget(list[index]),
                  );
                },
              ),
              Row(
                children: [
                  const Text(
                    'Đăng xuất',
                    style: TextStyle(
                        decoration: TextDecoration.underline,
                        color: AppColors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  GestureDetector(
                    onTap: () {
                      AwesomeDialog(
                        context: context,
                        dialogType: DialogType.INFO_REVERSED,
                        width: 360,
                        buttonsBorderRadius: BorderRadius.circular(20),
                        headerAnimationLoop: false,
                        animType: AnimType.TOPSLIDE,
                        title: 'Đăng xuất',
                        desc: 'Bạn có chắc chắn muốn đăng xuất ?',
                        showCloseIcon: false,
                        btnOkOnPress: () {},
                        btnOkText: 'Thoát',
                        btnCancelOnPress: () {
                          Navigator.of(context).pushAndRemoveUntil(
                              MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      const SignInScreen()),
                              (Route<dynamic> route) => false);
                        },
                        btnCancelText: 'Đăng xuất',
                        btnCancelColor: AppColors.red2,
                        btnOkColor: AppColors.green1,
                      ).show();
                    },
                    child: const Icon(
                      Icons.arrow_forward,
                      color: AppColors.orange2,
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
