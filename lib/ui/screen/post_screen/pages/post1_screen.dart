import 'package:flutter/material.dart';
import 'package:phongtro/resources/colors.dart';
import 'package:phongtro/resources/dimensions.dart';
import 'package:phongtro/resources/fontsizes.dart';
import 'package:phongtro/ui/screen/post_screen/pages/post2_screen.dart';

class Post1Screen extends StatefulWidget {
  const Post1Screen({Key? key}) : super(key: key);

  @override
  _Post1ScreenState createState() => _Post1ScreenState();
}

class _Post1ScreenState extends State<Post1Screen> {
  int _cau1 = 0;
  TextEditingController peopleController = TextEditingController();
  TextEditingController acreageController = TextEditingController();
  TextEditingController costController = TextEditingController();
  TextEditingController locationController = TextEditingController();

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
                  const SizedBox(
                    height: 20,
                  ),
                  Center(
                    child: Text(
                      "Loại Phòng",
                      style: TextStyle(
                        fontSize: AppFontSizes.fs12,
                        color: AppColors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        child: Row(
                          children: [
                            Radio(
                                value: 1,
                                groupValue: _cau1,
                                onChanged: (value) {
                                  setState(() {
                                    _cau1 = int.parse(value.toString());
                                  });
                                }),
                            const Text("Chung chủ")
                          ],
                        ),
                      ),
                      Expanded(
                        child: Row(
                          children: [
                            Radio(
                                value: 2,
                                groupValue: _cau1,
                                onChanged: (value) {
                                  setState(() {
                                    _cau1 = int.parse(value.toString());
                                  });
                                }),
                            const Text("Không chung chủ")
                          ],
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 2,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Sức chứa',
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
                                    controller: peopleController,
                                    textAlign: TextAlign.center,
                                    keyboardType: TextInputType.number,
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                const Expanded(child: Text('Người/Phòng'))
                              ],
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Diện tích',
                              style: TextStyle(
                                  fontSize: AppFontSizes.fs12,
                                  color: AppColors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: TextField(
                                    controller: acreageController,
                                    textAlign: TextAlign.justify,
                                    keyboardType: TextInputType.number,
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Expanded(child: Text('m2'))
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Giá phòng',
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
                              controller: costController,
                              textAlign: TextAlign.center,
                              keyboardType: TextInputType.number,
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          const Text('VND/Tháng')
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Địa chỉ',
                        style: TextStyle(
                            fontSize: AppFontSizes.fs12,
                            color: AppColors.black,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        width: AppDimensions.d90w,
                        height: 30,
                        child: TextField(
                          controller: locationController,
                          textAlign: TextAlign.start,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) {
                              return Post2Screen(
                                  peopleController.text.trim(),
                                  acreageController.text.trim(),
                                  costController.text.trim(),
                                  locationController.text.trim());
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
