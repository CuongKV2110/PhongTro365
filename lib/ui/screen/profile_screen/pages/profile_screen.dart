import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import '../../../../resources/colors.dart';
import '../../saved_screen/pages/saved_screen.dart';
import '../../sign_in_screen/pages/sign_in_screen.dart';
import '../widgets/build_profile.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              BuildProfile(),
              const SizedBox(
                height: 20,
              ),
              _buildOptions(context)
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildOptions(context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                ElevatedButton(
                  onPressed: () {},
                  child: Icon(
                    Ionicons.newspaper_outline,
                    color: Colors.white,
                  ),
                  style: ElevatedButton.styleFrom(
                    shape: CircleBorder(),
                    padding: EdgeInsets.all(20),
                    primary: Colors.blue,
                  ),
                ),
                SizedBox(
                  height: 6,
                ),
                Text(
                  'My Post',
                  style: TextStyle(color: AppColors.black),
                )
              ],
            ),
            Column(
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) {
                          return const SavedScreen();
                        },
                      ),
                    );
                  },
                  child: Icon(
                    Ionicons.bookmarks_outline,
                    color: Colors.white,
                  ),
                  style: ElevatedButton.styleFrom(
                    shape: CircleBorder(),
                    padding: EdgeInsets.all(20),
                    primary: Colors.blue,
                  ),
                ),
                SizedBox(
                  height: 6,
                ),
                Text(
                  'Saved Post',
                  style: TextStyle(color: AppColors.black),
                )
              ],
            ),
            Column(
              children: [
                ElevatedButton(
                  onPressed: () {},
                  child: Icon(
                    Ionicons.settings_outline,
                    color: Colors.white,
                  ),
                  style: ElevatedButton.styleFrom(
                    shape: CircleBorder(),
                    padding: EdgeInsets.all(20),
                    primary: Colors.blue,
                  ),
                ),
                SizedBox(
                  height: 6,
                ),
                Text(
                  'Settings',
                  style: TextStyle(color: AppColors.black),
                )
              ],
            ),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                ElevatedButton(
                  onPressed: () {},
                  child: Icon(
                    Ionicons.language_outline,
                    color: Colors.white,
                  ),
                  style: ElevatedButton.styleFrom(
                    shape: CircleBorder(),
                    padding: EdgeInsets.all(20),
                    primary: Colors.blue,
                  ),
                ),
                SizedBox(
                  height: 6,
                ),
                Text(
                  'Languague',
                  style: TextStyle(color: AppColors.black),
                )
              ],
            ),
            Column(
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
                    primary: Colors.blue,
                  ),
                ),
                SizedBox(
                  height: 6,
                ),
                Text(
                  'Log Out',
                  style: TextStyle(color: AppColors.black),
                )
              ],
            ),
            Column(
              children: [
                ElevatedButton(
                  onPressed: () {},
                  child: Icon(
                    Ionicons.shield_checkmark_outline,
                    color: Colors.white,
                  ),
                  style: ElevatedButton.styleFrom(
                    shape: CircleBorder(),
                    padding: EdgeInsets.all(20),
                    primary: Colors.blue,
                  ),
                ),
                SizedBox(
                  height: 6,
                ),
                Text(
                  'Policy',
                  style: TextStyle(color: AppColors.black),
                )
              ],
            ),
          ],
        ),
      ],
    );
  }
}
