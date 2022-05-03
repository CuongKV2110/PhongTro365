import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:phongtro/ui/screen/sign_in_screen/pages/sign_in_screen.dart';

import '../../../../models/menu_item.dart';
import '../../../../resources/colors.dart';

class BuildDrawer extends StatefulWidget {
  const BuildDrawer({Key? key}) : super(key: key);

  @override
  _BuildDrawerState createState() => _BuildDrawerState();
}

class _BuildDrawerState extends State<BuildDrawer> {
  List<MenuItem> list = [];

  @override
  void initState() {
    list.add(
      MenuItem(
          icon: Ionicons.person_outline, name: 'Follow and invite friends'),
    );
    list.add(
      MenuItem(icon: Ionicons.notifications_outline, name: 'Notificaton'),
    );
    list.add(
      MenuItem(icon: Ionicons.hand_left_outline, name: 'Privacy'),
    );
    list.add(
      MenuItem(icon: Ionicons.shield_half_outline, name: 'Secutiry'),
    );
    list.add(
      MenuItem(icon: Ionicons.person_circle_outline, name: 'Account'),
    );
    list.add(
      MenuItem(icon: Ionicons.help_circle_outline, name: 'Help'),
    );
    list.add(
      MenuItem(icon: Ionicons.information_circle_outline, name: 'About'),
    );
  }

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
                  return Column(
                    children: [
                      Row(
                        children: [
                          Icon(
                            list[index].icon,
                            color: AppColors.white,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            list[index].name,
                            style: const TextStyle(color: AppColors.white),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                    ],
                  );
                },
              ),
              Row(
                children: [
                  const Text(
                    'Sign-out',
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
