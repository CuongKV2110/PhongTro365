import 'package:flutter/material.dart';
import 'package:phongtro/resources/colors.dart';
import 'package:phongtro/resources/dimensions.dart';
import 'package:phongtro/resources/fontsizes.dart';
import 'package:phongtro/ui/screen/declare_screen.dart';
import 'package:phongtro/ui/screen/home_screen.dart';

class ConfirmScreen extends StatefulWidget {
  const ConfirmScreen({Key? key}) : super(key: key);

  @override
  _ConfirmScreenState createState() => _ConfirmScreenState();
}

class _ConfirmScreenState extends State<ConfirmScreen> {
  int type = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.white,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: AppDimensions.d100w,
              height: AppDimensions.d50h,
              child: Image.asset(
                'images/a.png',
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              height: AppDimensions.d20h,
              width: AppDimensions.d80w,
              child: Column(children: [
                Text(
                  "Chọn chế độ người dùng bạn mong muốn nhé !!!",
                  style: TextStyle(fontSize: AppFontSizes.fs20),
                ),
                _buildQuestion1(),
              ]),
            ),
            Stack(
              children: [
                Container(
                  height: AppDimensions.d12h,
                  width: AppDimensions.d100w,
                  color: Colors.white,
                ),
                Positioned(
                  top: 20,
                  child: Container(
                    width: AppDimensions.d100w,
                    height: AppDimensions.d12h,
                    decoration: const BoxDecoration(
                      color: AppColors.color4DCBC1,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(200),
                        topRight: Radius.circular(200),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  child: Center(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) {
                              return const HomeScreen();
                            },
                          ),
                        );
                      },
                      child: Container(
                        alignment: Alignment.center,
                        height: 50,
                        width: 150,
                        child: Text(
                          'CONFIRM',
                          style: TextStyle(
                              fontSize: AppFontSizes.fs16,
                              color: AppColors.white,
                              fontWeight: FontWeight.bold),
                        ),
                        decoration: BoxDecoration(
                            gradient: const LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [
                                AppColors.blue,
                                AppColors.color4DCBC1,
                              ],
                            ),
                            color: AppColors.colorItem1,
                            borderRadius: BorderRadius.circular(40)),
                      ),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _buildQuestion1() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Radio(
              value: 1,
              groupValue: type,
              onChanged: (value) {
                setState(() {
                  type = int.parse(value.toString());
                });
              },
            ),
            GestureDetector(
              onTap: () {},
              child: Container(
                alignment: Alignment.center,
                height: 30,
                width: AppDimensions.d40w,
                child: Text(
                  'CHỦ TRỌ',
                  style: TextStyle(
                      fontSize: AppFontSizes.fs12,
                      color: AppColors.black,
                      fontWeight: FontWeight.bold),
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                  border: Border.all(
                    width: 1,
                    color: AppColors.black,
                  ),
                ),
              ),
            )
          ],
        ),
        Row(
          children: [
            Radio(
                value: 2,
                groupValue: type,
                onChanged: (value) {
                  setState(() {
                    type = int.parse(value.toString());
                  });
                }),
            GestureDetector(
              onTap: () {},
              child: Container(
                alignment: Alignment.center,
                height: 30,
                width: AppDimensions.d40w,
                child: Text(
                  'NGƯỜI TÌM TRỌ',
                  style: TextStyle(
                      fontSize: AppFontSizes.fs12,
                      color: AppColors.black,
                      fontWeight: FontWeight.bold),
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                  border: Border.all(
                    width: 1,
                    color: AppColors.black,
                  ),
                ),
              ),
            )
          ],
        ),
      ],
    );
  }
}
