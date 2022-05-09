import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:phongtro/models/extension.dart';
import 'package:phongtro/resources/colors.dart';
import 'package:phongtro/resources/dimensions.dart';
import 'package:phongtro/resources/fontsizes.dart';
import 'package:phongtro/ui/screen/post_screen/pages/post3_screen.dart';

class Post2Screen extends StatefulWidget {
  String people;
  String acreage;
  String cost;
  String location;

  Post2Screen(this.people, this.acreage, this.cost, this.location);

  @override
  _Post2ScreenState createState() => _Post2ScreenState();
}

class _Post2ScreenState extends State<Post2Screen> {
  TextEditingController waterController = TextEditingController();
  TextEditingController electricityController = TextEditingController();
  TextEditingController internetController = TextEditingController();
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
                            child: TextField(
                              controller: waterController,
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
                            child: TextField(
                              controller: electricityController,
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
                          Expanded(
                            child: TextField(
                              controller: internetController,
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
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) {
                              return Post3Screen(
                                widget.people,
                                widget.acreage,
                                widget.cost,
                                widget.location,
                                waterController.text.trim(),
                                electricityController.text.trim(),
                                internetController.text.trim(),
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
