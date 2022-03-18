import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:phongtro/resources/colors.dart';
import 'package:phongtro/resources/dimensions.dart';
import 'package:phongtro/ui/screen/login_screen.dart';
import 'package:phongtro/ui/screen/saved_screen.dart';

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
        backgroundColor: AppColors.white,
        body: Stack(
          alignment: Alignment.topCenter,
          children: [
            Container(
              width: AppDimensions.d100w,
              height: AppDimensions.d100h,
              decoration: const BoxDecoration(
                color: AppColors.white,
              ),
            ),
            Positioned(
              child: Container(
                width: AppDimensions.d100w,
                height: AppDimensions.d24h,
                decoration: const BoxDecoration(
                    color: AppColors.yellow,
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(80),
                      bottomLeft: Radius.circular(80),
                    )),
              ),
            ),
            Positioned(
              top: 60,
              child: Column(
                children: [
                  Container(
                    width: AppDimensions.d50w,
                    height: AppDimensions.d30h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(
                        color: AppColors.black,
                        width: 6,
                      ),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.asset(
                        'images/avt1.jpg',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Icon(Icons.call_outlined),
                          SizedBox(
                            width: 6,
                          ),
                          Text('0367031430')
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Icon(Icons.location_on_outlined),
                          SizedBox(
                            width: 6,
                          ),
                          Text('Me Tri Ha, Nam Tu Liem, Ha Noi')
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 100,
              child: SizedBox(
                width: AppDimensions.d90w,
                height: AppDimensions.d25h,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        GestureDetector(
                          onTap: () {},
                          child: Column(
                            children: [
                              Container(
                                width: 60,
                                height: 60,
                                decoration: BoxDecoration(
                                  color: AppColors.orange2,
                                  borderRadius: BorderRadius.circular(30),
                                  border: Border.all(
                                      color: AppColors.black, width: 1),
                                ),
                                child: const Icon(Icons.edit_outlined, color: AppColors.white,),
                              ),
                              const SizedBox(
                                height: 6,
                              ),
                              const Text("My Posts")
                            ],
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context)
                                .push(MaterialPageRoute(builder: (context) {
                              return const SavedScreen();
                            }));
                          },
                          child: Column(
                            children: [
                              Container(
                                width: 60,
                                height: 60,
                                decoration: BoxDecoration(
                                  color: AppColors.green0,
                                  borderRadius: BorderRadius.circular(30),
                                  border: Border.all(
                                      color: AppColors.black, width: 1),
                                ),
                                child: const Icon(
                                    Icons.collections_bookmark_outlined, color: AppColors.white,),
                              ),
                              const SizedBox(
                                height: 6,
                              ),
                              const Text("Saved")
                            ],
                          ),
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: Column(
                            children: [
                              Container(
                                width: 60,
                                height: 60,
                                decoration: BoxDecoration(
                                  color: AppColors.orange2,
                                  borderRadius: BorderRadius.circular(30),
                                  border: Border.all(
                                      color: AppColors.black, width: 1),
                                ),
                                child: const Icon(Icons.settings_outlined, color: AppColors.white,),
                              ),
                              const SizedBox(
                                height: 6,
                              ),
                              const Text("Settings")
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        GestureDetector(
                          onTap: () {},
                          child: Column(
                            children: [
                              Container(
                                width: 60,
                                height: 60,
                                decoration: BoxDecoration(
                                  color: AppColors.blue1,
                                  borderRadius: BorderRadius.circular(30),
                                  border: Border.all(
                                      color: AppColors.black, width: 1),
                                ),
                                child: const Icon(
                                  Icons.language_outlined,
                                  color: AppColors.white,
                                ),
                              ),
                              const SizedBox(
                                height: 6,
                              ),
                              const Text("Language")
                            ],
                          ),
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
                                            const LoginScreen()),
                                    (Route<dynamic> route) => false);
                              },
                              btnCancelText: 'Yes',
                              btnCancelColor: AppColors.red,
                              btnOkColor: AppColors.green2,
                            ).show();
                          },
                          child: Column(
                            children: [
                              Container(
                                width: 60,
                                height: 60,
                                decoration: BoxDecoration(
                                  color: AppColors.red,
                                  borderRadius: BorderRadius.circular(30),
                                  border: Border.all(
                                      color: AppColors.black, width: 1),
                                ),
                                child: const Icon(
                                  Icons.power_settings_new_outlined,
                                  color: AppColors.white,
                                ),
                              ),
                              const SizedBox(
                                height: 6,
                              ),
                              const Text("Log out")
                            ],
                          ),
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: Column(
                            children: [
                              Container(
                                width: 60,
                                height: 60,
                                decoration: BoxDecoration(
                                  color: AppColors.blue1,
                                  borderRadius: BorderRadius.circular(30),
                                  border: Border.all(
                                      color: AppColors.black, width: 1),
                                ),
                                child: const Icon(
                                  Icons.policy_outlined,
                                  color: AppColors.white,
                                ),
                              ),
                              const SizedBox(
                                height: 6,
                              ),
                              const Text("Policy")
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              child: Container(
                width: AppDimensions.d100w,
                height: AppDimensions.d10h,
                decoration: const BoxDecoration(
                  color: AppColors.yellow,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(100),
                    topRight: Radius.circular(100),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
