import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:phongtro/models/extension.dart';
import 'package:phongtro/resources/colors.dart';
import 'package:phongtro/resources/dimensions.dart';
import 'package:phongtro/resources/fontsizes.dart';
import 'package:phongtro/ui/screen/post_screen/pages/post3_screen.dart';

import '../widgets/electricity_widget.dart';
import '../widgets/internet_widget.dart';
import '../widgets/water_widget.dart';

class Post2Screen extends StatefulWidget {
  String owner;
  String people;
  String acreage;
  String cost;
  String location;
  String phone;

  Post2Screen(
    this.owner,
    this.people,
    this.acreage,
    this.cost,
    this.location,
    this.phone,
  );

  @override
  _Post2ScreenState createState() => _Post2ScreenState();
}

class _Post2ScreenState extends State<Post2Screen> {
  TextEditingController waterController = TextEditingController();
  TextEditingController electricityController = TextEditingController();
  TextEditingController internetController = TextEditingController();
  bool wifi = false;
  bool wc = false;
  bool time = false;
  bool vehicle = false;
  bool kitchen = false;
  bool fridge = false;
  bool washing = false;
  bool conditioning = false;
  final List<Extension> lisExtension = [];

  @override
  void initState() {
    lisExtension.add(
      Extension(
        icon: 'images/wifi.png',
        name: 'wifi',
        isPress: false,
      ),
    );
    lisExtension.add(
      Extension(
        icon: 'images/toilet.png',
        name: 'WC riêng',
        isPress: false,
      ),
    );
    lisExtension.add(
      Extension(
        icon: 'images/time.png',
        name: 'Tự do',
        isPress: false,
      ),
    );
    lisExtension.add(
      Extension(
        icon: 'images/xemay.png',
        name: 'Để xe',
        isPress: false,
      ),
    );
    lisExtension.add(
      Extension(
        icon: 'images/bep.png',
        name: 'Bếp',
        isPress: false,
      ),
    );
    lisExtension.add(
      Extension(
        icon: 'images/tulanh.png',
        name: 'Tủ lạnh',
        isPress: false,
      ),
    );
    lisExtension.add(
      Extension(
        icon: 'images/maygiat.png',
        name: 'Máy giặt',
        isPress: false,
      ),
    );
    lisExtension.add(
      Extension(
        icon: 'images/dieuhoa.png',
        name: 'Điều hòa',
        isPress: false,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text(
              'Tiện ích',
              style: TextStyle(
                color: AppColors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            automaticallyImplyLeading: false,
            backgroundColor: AppColors.black,
            elevation: 0,
            leading: Builder(
              builder: (context) => IconButton(
                icon: const Icon(
                  Icons.arrow_back_outlined,
                  color: AppColors.white,
                ),
                onPressed: () => Navigator.of(context).pop(),
              ),
            ),
          ),
          body: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(14, 4, 14, 4),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  WaterWidget(waterController),
                  const SizedBox(
                    height: 20,
                  ),
                  ElectricityWidget(electricityController),
                  const SizedBox(
                    height: 20,
                  ),
                  InternetWidget(internetController),
                  const SizedBox(
                    height: 20,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Các tiện ích",
                        style: TextStyle(
                            fontSize: AppFontSizes.fs16,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  GridView.builder(
                      physics: const BouncingScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: lisExtension.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4,
                      ),
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              lisExtension[index].isPress =
                                  !lisExtension[index].isPress;
                            });
                          },
                          child: Column(
                            children: [
                              Image.asset(
                                lisExtension[index].icon,
                                width: 40,
                                height: 40,
                                color: lisExtension[index].isPress
                                    ? AppColors.blue
                                    : AppColors.black,
                              ),
                              const SizedBox(
                                height: 4,
                              ),
                              Text(
                                lisExtension[index].name,
                                style: TextStyle(
                                  color: lisExtension[index].isPress
                                      ? AppColors.blue
                                      : AppColors.black,
                                ),
                              )
                            ],
                          ),
                        );
                      }),
                  const SizedBox(
                    height: 20,
                  ),
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          wifi = lisExtension[0].isPress;
                          wc = lisExtension[1].isPress;
                          time = lisExtension[2].isPress;
                          vehicle = lisExtension[3].isPress;
                          kitchen = lisExtension[4].isPress;
                          washing = lisExtension[5].isPress;
                          fridge = lisExtension[6].isPress;
                          conditioning = lisExtension[7].isPress;
                        });
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) {
                              return Post3Screen(
                                widget.owner,
                                widget.people,
                                widget.acreage,
                                widget.cost,
                                widget.location,
                                widget.phone,
                                waterController.text.trim(),
                                electricityController.text.trim(),
                                internetController.text.trim(),
                                wifi,
                                wc,
                                time,
                                vehicle,
                                kitchen,
                                fridge,
                                washing,
                                conditioning,
                              );
                            },
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.zero,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(28),
                        ),
                      ),
                      child: Ink(
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              AppColors.orange1,
                              AppColors.orange2,
                            ],
                          ),
                          borderRadius: BorderRadius.circular(28),
                        ),
                        child: Container(
                          width: AppDimensions.d40w,
                          height: 56,
                          alignment: Alignment.center,
                          child: const Text(
                            'Tiếp theo',
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
