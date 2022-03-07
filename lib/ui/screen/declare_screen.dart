import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:phongtro/resources/colors.dart';
import 'package:phongtro/resources/dimensions.dart';
import 'package:phongtro/resources/fontsizes.dart';
import 'package:phongtro/ui/screen/home_screen.dart';

class DeclareScreen extends StatefulWidget {
  const DeclareScreen({Key? key}) : super(key: key);

  @override
  _DeclareScreenState createState() => _DeclareScreenState();
}

enum TypeAccount { chutro, thuetro }

class _DeclareScreenState extends State<DeclareScreen> {
  int _cau1 = 0;
  int _cau2 = 0;
  int _cau3 = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Stack(
              children: [
                Container(
                  width: AppDimensions.d100w,
                  height: AppDimensions.d20h,
                  decoration: const BoxDecoration(
                    color: AppColors.color4DCBC1,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(2000),
                    ),
                  ),
                ),
                Positioned(
                  top: 80,
                  left: 60,
                  child: Text(
                    "Cùng khảo sát 1 chút nhé !",
                    style: TextStyle(
                      color: AppColors.white,
                      fontSize: AppFontSizes.fs16,
                    ),
                  ),
                )
              ],
            ),
            _buildQuestion(),
            _buildConfirm()
          ],
        ),
      ),
    );
  }

  Widget _buildQuestion() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          width: AppDimensions.d90w,
          height: AppDimensions.d18h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: AppColors.white,
            border: Border.all(
              width: 1,
              color: AppColors.black,
            ),
          ),
          child: Padding(
            padding: EdgeInsets.all(10),
            child: _buildQuestion1(),
          ),
        ),
        Container(
          width: AppDimensions.d90w,
          height: AppDimensions.d18h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: AppColors.white,
            border: Border.all(
              width: 1,
              color: AppColors.black,
            ),
          ),
          child: Padding(
            padding: EdgeInsets.all(10),
            child: _buildQuestion2(),
          ),
        ),
        Container(
          width: AppDimensions.d90w,
          height: AppDimensions.d18h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: AppColors.white,
            border: Border.all(
              width: 1,
              color: AppColors.black,
            ),
          ),
          child: Padding(
            padding: EdgeInsets.all(10),
            child: _buildQuestion3(),
          ),
        ),
      ],
    );
  }

  Widget _buildQuestion1() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Bạn muốn tìm phòng mới hay tìm người ở ghép"),
        Row(
          children: [
            Radio(
                value: 1,
                groupValue: _cau1,
                onChanged: (value) {
                  setState(() {
                    _cau1 = int.parse(value.toString());
                  });
                }),
            const Text("Tìm phòng mới")
          ],
        ),
        Row(
          children: [
            Radio(
                value: 2,
                groupValue: _cau1,
                onChanged: (value) {
                  setState(() {
                    _cau1 = int.parse(value.toString());
                  });
                }),
            const Text("Tìm người ở ghép")
          ],
        ),
      ],
    );
  }

  Widget _buildQuestion2() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Giới tính ?"),
        Row(
          children: [
            Radio(
                value: 1,
                groupValue: _cau2,
                onChanged: (value) {
                  setState(() {
                    _cau2 = int.parse(value.toString());
                  });
                }),
            const Text("Nam")
          ],
        ),
        Row(
          children: [
            Radio(
                value: 2,
                groupValue: _cau2,
                onChanged: (value) {
                  setState(() {
                    _cau2 = int.parse(value.toString());
                  });
                }),
            const Text("Nữ")
          ],
        ),
      ],
    );
  }

  Widget _buildQuestion3() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Vị trí muốn tìm kiếm"),
        Row(
          children: [
            Radio(
                value: 1,
                groupValue: _cau3,
                onChanged: (value) {
                  setState(() {
                    _cau3 = int.parse(value.toString());
                  });
                }),
            const Text("Cầu Giấy")
          ],
        ),
        Row(
          children: [
            Radio(
                value: 2,
                groupValue: _cau3,
                onChanged: (value) {
                  setState(() {
                    _cau3 = int.parse(value.toString());
                  });
                }),
            const Text("Mỹ Đình")
          ],
        ),
      ],
    );
  }

  Widget _buildConfirm() {
    return GestureDetector(
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
    );
  }
}
