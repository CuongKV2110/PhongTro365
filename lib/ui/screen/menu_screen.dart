import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:phongtro/generated/l10n.dart';
import 'package:phongtro/models/menu_item.dart';
import 'package:phongtro/resources/colors.dart';
import 'package:phongtro/resources/dimensions.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({Key? key}) : super(key: key);

  @override
  _MenuScreenState createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  List<MenuItem> _listmenu = [
    MenuItem(title: 'Home', icon: Icons.home_outlined),
    MenuItem(title: 'Account', icon: Icons.people_outline),
    MenuItem(title: 'Palne', icon: Icons.airplanemode_active_outlined),
    MenuItem(title: 'Car', icon: Icons.car_repair),
    MenuItem(title: 'Book', icon: Icons.book_outlined),
    MenuItem(title: 'Phone', icon: Icons.phone_bluetooth_speaker_outlined),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.white,
        body: Padding(
          padding: EdgeInsets.fromLTRB(16, 10, 16, 10),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  children: [
                    Text('Kieu Van Cuong'),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                GridView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: AppDimensions.d50w,
                      mainAxisExtent: 70,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10),
                  itemCount: _listmenu.length,
                  itemBuilder: (BuildContext context, index) {
                    return Container(
                      child: Stack(
                        children: [
                          Positioned(
                            top: 10,
                            left: 6,
                            child: Icon(_listmenu[index].icon, size: 30,),
                          ),
                          Positioned(
                            left: 6,
                            bottom: 10,
                            child: Text(_listmenu[index].title, style: TextStyle(fontWeight: FontWeight.bold),),
                          ),
                        ],
                      ),
                      decoration: BoxDecoration(
                          color: AppColors.colorItem1,
                          borderRadius: BorderRadius.circular(15)),
                    );
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  height: 44,
                  width: AppDimensions.d90w,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text(
                      S.of(context).setting,
                      style: const TextStyle(color: AppColors.black),
                    ),
                    style: ElevatedButton.styleFrom(
                        primary: Colors.yellow,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)),
                        padding: const EdgeInsets.all(10)),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  height: 44,
                  width: AppDimensions.d90w,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text(
                      S.of(context).support,
                      style: const TextStyle(color: AppColors.black),
                    ),
                    style: ElevatedButton.styleFrom(
                        primary: Colors.yellow,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)),
                        padding: const EdgeInsets.all(10)),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  height: 44,
                  width: AppDimensions.d90w,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text(
                      S.of(context).logout,
                      style: const TextStyle(color: AppColors.black),
                    ),
                    style: ElevatedButton.styleFrom(
                        primary: Colors.yellow,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)),
                        padding: const EdgeInsets.all(10)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
