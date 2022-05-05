import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:phongtro/models/extension.dart';
import 'package:phongtro/resources/colors.dart';
import 'package:phongtro/resources/dimensions.dart';
import 'package:phongtro/resources/fontsizes.dart';
import 'package:phongtro/ui/screen/post_screen/pages/post3_screen.dart';

class Post2Screen extends StatefulWidget {
  const Post2Screen({Key? key}) : super(key: key);

  @override
  _Post2ScreenState createState() => _Post2ScreenState();
}

class _Post2ScreenState extends State<Post2Screen> {
  bool internet_checkbox = false;
  bool service_checkbox = false;

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
        name: 'Giờ giấc',
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
    lisExtension.add(
      Extension(
        icon: 'images/dieuhoa.png',
        name: 'Điều hòa',
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
    lisExtension.add(
      Extension(
        icon: 'images/dieuhoa.png',
        name: 'Điều hòa',
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
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(14, 4, 14, 4),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Tiền nước',
                        style: TextStyle(
                            fontSize: AppFontSizes.fs12,
                            color: AppColors.black,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: AppDimensions.d40w,
                            height: 30,
                            child: const TextField(
                              textAlign: TextAlign.center,
                              keyboardType: TextInputType.number,
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          const Text('VND/Người'),
                          const SizedBox(
                            width: 20,
                          )
                          // Checkbox(value: value, onChanged: onChanged)
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Tiền điện',
                        style: TextStyle(
                            fontSize: AppFontSizes.fs12,
                            color: AppColors.black,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: AppDimensions.d40w,
                            height: 30,
                            child: const TextField(
                              textAlign: TextAlign.center,
                              keyboardType: TextInputType.number,
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          const Text('VND/Số'),
                          const SizedBox(
                            width: 20,
                          )
                          // Checkbox(value: value, onChanged: onChanged)
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Tiền mạng',
                        style: TextStyle(
                            fontSize: AppFontSizes.fs12,
                            color: AppColors.black,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Expanded(
                            child: TextField(
                              textAlign: TextAlign.center,
                              keyboardType: TextInputType.number,
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          const Text('VND/Người'),
                          Checkbox(
                            value: internet_checkbox,
                            onChanged: (value) {
                              setState(() {
                                internet_checkbox = value!;
                              });
                            },
                          ),
                          const Text('Miễn phí'),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Tiền dịch vụ khác',
                        style: TextStyle(
                            fontSize: AppFontSizes.fs12,
                            color: AppColors.black,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Expanded(
                            child: TextField(
                              textAlign: TextAlign.center,
                              keyboardType: TextInputType.number,
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          const Text('VND/Người'),
                          Checkbox(
                            value: service_checkbox,
                            onChanged: (value) {
                              setState(() {
                                service_checkbox = value!;
                              });
                            },
                          ),
                          const Text('Miễn phí'),
                        ],
                      ),
                    ],
                  ),
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
                      physics: BouncingScrollPhysics(),
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
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) {
                          return const Post3Screen();
                        }),
                      );
                    },
                    child: Center(
                      child: Container(
                        alignment: Alignment.center,
                        height: 50,
                        width: 150,
                        child: Text(
                          'NEXT',
                          style: TextStyle(
                              fontSize: AppFontSizes.fs16,
                              color: AppColors.white,
                              fontWeight: FontWeight.bold),
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          gradient: const LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [
                              AppColors.blue,
                              AppColors.color4DCBC1,
                            ],
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
