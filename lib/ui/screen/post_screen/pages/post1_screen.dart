import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phongtro/resources/colors.dart';
import 'package:phongtro/resources/dimensions.dart';
import 'package:phongtro/resources/fontsizes.dart';
import 'package:phongtro/ui/screen/post_screen/bloc/post1_bloc.dart';
import 'package:phongtro/ui/screen/post_screen/bloc/post1_event.dart';
import 'package:phongtro/ui/screen/post_screen/bloc/post1_state.dart';
import 'package:phongtro/ui/screen/post_screen/pages/post2_screen.dart';
import 'package:phongtro/ui/screen/post_screen/widgets/location_widget.dart';
import 'package:phongtro/ui/screen/post_screen/widgets/people_widget.dart';
import 'package:phongtro/ui/screen/post_screen/widgets/phone_widget.dart';

import '../../../../helpers/ui_helper.dart';
import '../widgets/acreage_widget.dart';
import '../widgets/cost_widget.dart';

class Post1Screen extends StatefulWidget {
  const Post1Screen({Key? key}) : super(key: key);

  @override
  _Post1ScreenState createState() => _Post1ScreenState();
}

class _Post1ScreenState extends State<Post1Screen> {
  int _owner = 0;
  int _type = 0;
  String type = '';
  String owner = '';
  TextEditingController peopleController = TextEditingController();
  TextEditingController acreageController = TextEditingController();
  TextEditingController costController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  Post1Bloc bloc = Post1Bloc();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            'Viết bài',
            style: TextStyle(
              color: AppColors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          backgroundColor: AppColors.black,
          leading: GestureDetector(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: const Icon(
              Icons.arrow_back,
              color: AppColors.white,
            ),
          ),
        ),
        body: GestureDetector(
          onTap: () {
            FocusScope.of(context).requestFocus(FocusNode());
          },
          child: BlocListener(
            bloc: bloc,
            listener: (context, state) {
              if (state is Post1Processing) {
                UiHelper.showLoading(context);
              }
              if (state is Post1Success) {
                UiHelper.hideLoading(context);
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) {
                      return Post2Screen(
                          owner,
                          type,
                          peopleController.text.trim(),
                          acreageController.text.trim(),
                          costController.text.trim(),
                          locationController.text.trim(),
                          phoneController.text.trim());
                    },
                  ),
                );
              }
              if (state is Post1Error) {
                UiHelper.hideLoading(context);
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text(bloc.errorMessage),
                ));
              }
            },
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
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
                                  groupValue: _owner,
                                  onChanged: (value) {
                                    setState(() {
                                      _owner = int.parse(value.toString());
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
                                  groupValue: _owner,
                                  onChanged: (value) {
                                    setState(() {
                                      _owner = int.parse(value.toString());
                                    });
                                  }),
                              const Text("Không chung chủ")
                            ],
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Center(
                      child: Text(
                        "Trạng thái",
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
                                  groupValue: _type,
                                  onChanged: (value) {
                                    setState(() {
                                      _type = int.parse(value.toString());
                                    });
                                  }),
                              const Text("Phòng trống")
                            ],
                          ),
                        ),
                        Expanded(
                          child: Row(
                            children: [
                              Radio(
                                  value: 2,
                                  groupValue: _type,
                                  onChanged: (value) {
                                    setState(() {
                                      _type = int.parse(value.toString());
                                    });
                                  }),
                              const Text("Phòng ghép")
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
                        PeopleWidget(peopleController),
                        AcreageWidget(acreageController),
                      ],
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    CostWidget(costController),
                    const SizedBox(
                      height: 24,
                    ),
                    LocationWidget(locationController),
                    const SizedBox(
                      height: 24,
                    ),
                    PhoneWidget(phoneController),
                    const SizedBox(
                      height: 24,
                    ),
                    Center(
                      child: ElevatedButton(
                        onPressed: () {
                          if (_owner == 1) {
                            owner = 'Chung chủ';
                          } else {
                            owner = 'Không chung chủ';
                          }
                          if (_type == 1) {
                            type = 'Phòng trống';
                          } else {
                            type = 'Phòng ghép';
                          }
                          bloc.add(
                            CheckData(
                              owner,
                              type,
                              peopleController.text.trim(),
                              acreageController.text.trim(),
                              costController.text.trim(),
                              locationController.text.trim(),
                              phoneController.text.trim(),
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
      ),
    );
  }
}
