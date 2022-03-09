import 'package:flutter/material.dart';
import 'package:phongtro/models/slide.dart';
import 'package:phongtro/resources/colors.dart';
import 'package:phongtro/resources/dimensions.dart';
import 'package:phongtro/resources/fontsizes.dart';
import 'package:phongtro/ui/screen/home_screen.dart';
import 'package:phongtro/ui/widget/slide_dots.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({Key? key}) : super(key: key);

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  int _currentPage = 0;
  final PageController _pageController = PageController(initialPage: 0);

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  _onPageChanged(int index) {
    setState(() {
      _currentPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.white,
        body: Column(
          children: [
            Expanded(
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  PageView.builder(
                    scrollDirection: Axis.horizontal,
                    controller: _pageController,
                    itemCount: slideList.length,
                    onPageChanged: _onPageChanged,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          const SizedBox(
                            height: 50,
                          ),
                          SizedBox(
                            width: AppDimensions.d100w,
                            height: AppDimensions.d50h,
                            child: Image.asset(slideList[index].imgUrl),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(30, 10, 30, 10),
                            child: Text(
                              slideList[index].content,
                              style: TextStyle(
                                  fontSize: AppFontSizes.fs12,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(30, 10, 30, 10),
                            child: Text(
                              slideList[index].description,
                              style: TextStyle(
                                fontSize: AppFontSizes.fs12,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          )
                        ],
                      );
                    },
                  ),
                  Stack(
                    alignment: AlignmentDirectional.center,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(bottom: 50),
                        child: _currentPage == 2
                            ? GestureDetector(
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
                                    'START NOW',
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
                              )
                            : Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  for (int i = 0; i < slideList.length; i++)
                                    if (i == _currentPage)
                                      SlideDots(true)
                                    else
                                      SlideDots(false)
                                ],
                              ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
