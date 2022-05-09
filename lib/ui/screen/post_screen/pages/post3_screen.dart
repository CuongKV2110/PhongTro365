import 'dart:io';
import 'dart:ui';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:open_file/open_file.dart';
import 'package:phongtro/bloc/create_post/create_post_bloc.dart';
import 'package:phongtro/bloc/create_post/create_post_event.dart';
import 'package:phongtro/bloc/create_post/create_post_state.dart';
import 'package:phongtro/models/room.dart';
import 'package:phongtro/ui/screen/home_screen/pages/home_screen.dart';
import 'package:phongtro/ui/screen/saved_screen/pages/saved_screen.dart';

import '../../../../helpers/ui_helper.dart';
import '../../../../resources/colors.dart';
import '../../../../resources/dimensions.dart';
import '../../../../resources/fontsizes.dart';

class Post3Screen extends StatefulWidget {
  String people;
  String acreage;
  String cost;
  String location;
  String water;
  String electricity;
  String internet;

  Post3Screen(this.people, this.acreage, this.cost, this.location, this.water,
      this.electricity, this.internet);

  @override
  _Post3ScreenState createState() => _Post3ScreenState();
}

class _Post3ScreenState extends State<Post3Screen> {
  CreatePostBloc _createPostBloc = CreatePostBloc();
  TextEditingController contentController = TextEditingController();
  FilePickerResult? result1;
  FilePickerResult? result2;
  PlatformFile? file1;
  PlatformFile? file2;
  late bool hide1 = false;
  late bool hide2 = false;

  void hideImage1(int index) {
    setState(() {
      if (index == 1) {
        hide1 = true;
      }
      if (index == 2) {
        hide1 = true;
      }
    });
  }

  void pickFiles(int index) async {
    if (index == 1) {
      result1 = await FilePicker.platform.pickFiles();
      if (result1 == null) return;
      file1 = result1!.files.first;
      setState(() {
        hide1 = false;
      });
    }
    if (index == 2) {
      result2 = await FilePicker.platform.pickFiles();
      if (result2 == null) return;
      file2 = result2!.files.first;
      setState(() {
        hide2 = false;
      });
    }
  }

  void viewFile(PlatformFile file) {
    OpenFile.open(file.path);
  }

  @override
  void dispose() {
    contentController.dispose();
    _createPostBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener(
      bloc: _createPostBloc,
      listener: (context, state) {
        if (state is CreatePostProcessing) {
          UiHelper.showLoading(context);
        }
        if (state is CreatePostError) {
          UiHelper.hideLoading(context);
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(_createPostBloc.errorMessage),
          ));
        }
        if (state is CreatePostSuccess) {
          print('Đăng bài thành công');
          UiHelper.hideLoading(context);
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (context) {
                return const SavedScreen();
              },
            ),
          );
        }
      },
      child: BlocBuilder(
          bloc: _createPostBloc,
          builder: (context, state) {
            return SafeArea(
              child: GestureDetector(
                onTap: () {
                  FocusScope.of(context).requestFocus(FocusNode());
                },
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
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(14, 4, 14, 4),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 20,
                          ),
                          const Text(
                            'Thêm ảnh',
                            style: TextStyle(
                                fontSize: 18,
                                color: AppColors.black,
                                fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: (file1 == null)
                                    ? Container(
                                        height: AppDimensions.d20h,
                                        color: AppColors.gray,
                                        child: GestureDetector(
                                          onTap: () {
                                            pickFiles(1);
                                          },
                                          child: const Icon(
                                            Icons.add,
                                            color: AppColors.black,
                                          ),
                                        ),
                                      )
                                    : ((hide1 == true)
                                        ? const SizedBox(
                                            height: 10,
                                          )
                                        : Container(
                                            width: AppDimensions.d40w,
                                            height: AppDimensions.d40h,
                                            child: Image.file(
                                              File(file1!.path.toString()),
                                            ),
                                          )),
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              Expanded(
                                child: (file2 == null)
                                    ? Container(
                                        height: AppDimensions.d20h,
                                        color: AppColors.gray,
                                        child: GestureDetector(
                                          onTap: () {
                                            pickFiles(2);
                                          },
                                          child: const Icon(
                                            Icons.add,
                                            color: AppColors.black,
                                          ),
                                        ),
                                      )
                                    : ((hide2 == true)
                                        ? const SizedBox(
                                            height: 10,
                                          )
                                        : Container(
                                            width: AppDimensions.d40w,
                                            height: AppDimensions.d40h,
                                            child: Image.file(
                                              File(file2!.path.toString()),
                                              fit: BoxFit.fill,
                                              width: AppDimensions.d40w,
                                              height: AppDimensions.d40h,
                                            ),
                                          )),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Nội dung',
                                style: TextStyle(
                                    fontSize: 18,
                                    color: AppColors.black,
                                    fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              TextField(
                                controller: contentController,
                                textAlign: TextAlign.start,
                                maxLines: 6,
                                decoration: const InputDecoration(
                                    hintText: 'Viết bài',
                                    hintStyle:
                                        TextStyle(color: AppColors.gray)),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 24,
                          ),
                          Center(
                            child: ElevatedButton(
                              onPressed: () {
                                String people = widget.people;
                                String acreage = widget.acreage;
                                String cost = widget.cost;
                                String location = widget.location;
                                String water = widget.water;
                                String electricity = widget.electricity;
                                String internet = widget.internet;
                                String content = contentController.text.trim();

                                Room room = Room(
                                    people: people,
                                    acreage: acreage,
                                    cost: cost,
                                    location: location,
                                    water: water,
                                    electricity: electricity,
                                    internet: internet,
                                    content: content);
                                _createPostBloc.add(CreatePost(
                                  room.people,
                                  room.acreage,
                                  room.cost,
                                  room.location,
                                  room.water,
                                  room.electricity,
                                  room.internet,
                                  room.content,
                                ));

                                print(room.electricity);
                                print(room.water);
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
                                    'Đăng bài',
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
          }),
    );
  }
}
