import 'package:flutter/material.dart';
import 'package:phongtro/resources/colors.dart';
import 'package:phongtro/resources/dimensions.dart';
import 'package:phongtro/resources/fontsizes.dart';
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
        body: Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Container(
                  width: AppDimensions.d60w,
                  height: AppDimensions.d40h,
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
                      'images/code1.jpg',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  bottom: 30,
                  child: Text(
                    "Kieu Van Cuong",
                    style: TextStyle(
                        color: AppColors.white, fontSize: AppFontSizes.fs20),
                  ),
                )
              ],
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
            const SizedBox(
              height: 40,
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
                          color: AppColors.lightBlue1,
                          borderRadius: BorderRadius.circular(30),
                          border: Border.all(color: AppColors.black, width: 1),
                        ),
                        child: const Icon(Icons.edit_outlined),
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
                      return SavedScreen();
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
                          border: Border.all(color: AppColors.black, width: 1),
                        ),
                        child: const Icon(Icons.collections_bookmark_outlined),
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
                          color: AppColors.orange0,
                          borderRadius: BorderRadius.circular(30),
                          border: Border.all(color: AppColors.black, width: 1),
                        ),
                        child: const Icon(Icons.settings_outlined),
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
              height: 50,
            ),
            Container(
              width: AppDimensions.d40w,
              height: 50,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(Icons.power_settings_new_outlined),
                  SizedBox(
                    width: 10,
                  ),
                  Text('Log out'),
                ],
              ),
              decoration: BoxDecoration(
                  color: AppColors.colorFAC524,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(width: 1, color: AppColors.black)),
            )
          ],
        ),
      ),
    );
  }
}
