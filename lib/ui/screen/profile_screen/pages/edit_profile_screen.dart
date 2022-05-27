import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:open_file/open_file.dart';
import 'package:phongtro/providers/singleton.dart';
import 'package:phongtro/ui/screen/home_screen/pages/home_screen.dart';
import 'package:phongtro/ui/screen/profile_screen/bloc/edit_bloc.dart';
import 'package:phongtro/ui/screen/profile_screen/bloc/edit_state.dart';

import '../../../../models/account.dart';
import '../../../../resources/colors.dart';
import '../../../../resources/dimensions.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({Key? key}) : super(key: key);

  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  Account account = Singleton.instance.account;
  EditBloc bloc = EditBloc();
  TextEditingController displayName = TextEditingController();
  TextEditingController phoneNumber = TextEditingController();
  TextEditingController address = TextEditingController();

  FilePickerResult? result1;
  PlatformFile? file1;
  bool isOpen = false;
  File? _image;
  ImagePicker _imagePicker = ImagePicker();

  Future imagePickerMethod() async {
    final pick = await _imagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      if (pick != null) {
        _image = File(pick.path);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('Error'),
        ));
      }
    });
  }

  void pickFiles() async {
    result1 = await FilePicker.platform.pickFiles();
    if (result1 == null) return;
    file1 = result1!.files.first;
    setState(() {
      isOpen = !isOpen;
    });
  }

  void viewFile(PlatformFile file) {
    OpenFile.open(file.path);
  }

  @override
  void initState() {
    displayName.text = Singleton.instance.account.displayName;
    super.initState();
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
            title: const Text(
              'Cập nhật thông tin cá nhân',
              style: TextStyle(
                color: AppColors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            automaticallyImplyLeading: false,
            backgroundColor: Colors.black,
            elevation: 0,
          ),
          body: BlocProvider<EditBloc>(
            create: (context) => bloc,
            child: BlocBuilder<EditBloc, EditState>(
              builder: (context, state) {
                if (state is EditInitial) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 20,
                          ),
                          Column(
                            children: [
                              Stack(
                                children: [
                                  Container(
                                    child: _image == null
                                        ? CircleAvatar(
                                            radius: 50,
                                            backgroundImage:
                                                CachedNetworkImageProvider(
                                                    Singleton
                                                        .instance.account.avt),
                                          )
                                        : Container(
                                            width: 50,
                                            height: 50,
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(50),
                                              child: Image.file(_image!,
                                                  fit: BoxFit.fill),
                                            ),
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(30)),
                                          ),
                                    width: 100,
                                    height: 100,
                                    decoration: BoxDecoration(
                                      gradient: const LinearGradient(
                                        begin: Alignment.topCenter,
                                        end: Alignment.bottomCenter,
                                        colors: [
                                          AppColors.orange1,
                                          AppColors.orange2,
                                        ],
                                      ),
                                      borderRadius: BorderRadius.circular(50),
                                    ),
                                  ),
                                  Positioned(
                                    bottom: 3,
                                    right: 10,
                                    child: GestureDetector(
                                      behavior: HitTestBehavior.translucent,
                                      onTap: () {
                                        imagePickerMethod();
                                      },
                                      child: const CircleAvatar(
                                        backgroundColor: AppColors.orange1,
                                        radius: 12,
                                        child: Icon(
                                          Icons.edit_outlined,
                                          color: AppColors.white,
                                          size: 14,
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              const Text(
                                'Cập nhật ảnh đại diện',
                                style: TextStyle(
                                  color: AppColors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Tên hiển thị',
                                style: TextStyle(
                                  color: AppColors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              TextField(
                                controller: displayName,
                                decoration: const InputDecoration(),
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
                                'Số điện thoại',
                                style: const TextStyle(
                                  color: AppColors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              TextField(
                                controller: phoneNumber,
                                decoration:
                                    const InputDecoration(hintText: 'Thêm SĐT'),
                                keyboardType: TextInputType.phone,
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
                                'Địa chỉ',
                                style: TextStyle(
                                  color: AppColors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              TextField(
                                controller: address,
                                decoration: const InputDecoration(
                                    hintText: 'Thêm địa chỉ'),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Center(
                            child: ElevatedButton(
                              onPressed: () {
                                String name = displayName.text.isEmpty
                                    ? "Đang cập nhật"
                                    : displayName.text.trim();
                                String phone = phoneNumber.text.isEmpty
                                    ? "Đang cập nhật"
                                    : phoneNumber.text.trim();
                                String locate = address.text.isEmpty
                                    ? "Đang cập nhật"
                                    : address.text.trim();
                                bloc.editProfile(
                                    name, phone, locate, _image!.path);
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
                                  height: 50,
                                  alignment: Alignment.center,
                                  child: const Text(
                                    'Cập nhật',
                                    style: TextStyle(fontSize: 18),
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                }
                if (state is EditLoading) {
                  return const Center();
                }
                if (state is EditSuccess) {
                  return Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(
                              height: 20,
                            ),
                            Column(
                              children: [
                                Container(
                                  child: Padding(
                                    padding: const EdgeInsets.all(3),
                                    child: CircleAvatar(
                                      radius: 50,
                                      backgroundImage:
                                          CachedNetworkImageProvider(
                                              state.account.avt),
                                    ),
                                  ),
                                  width: 100,
                                  height: 100,
                                  decoration: BoxDecoration(
                                    gradient: const LinearGradient(
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                      colors: [
                                        AppColors.orange1,
                                        AppColors.orange2,
                                      ],
                                    ),
                                    borderRadius: BorderRadius.circular(50),
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 40,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Tên hiển thị',
                                  style: TextStyle(
                                    color: AppColors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  account.displayName,
                                  style:
                                      const TextStyle(color: AppColors.black),
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Số điện thoại',
                                  style: TextStyle(
                                    color: AppColors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  account.phoneNumber,
                                  style:
                                      const TextStyle(color: AppColors.black),
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Địa chỉ',
                                  style: TextStyle(
                                    color: AppColors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  account.address,
                                  style:
                                      const TextStyle(color: AppColors.black),
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            Center(
                              child: ElevatedButton(
                                onPressed: () {
                                  Navigator.of(context).push(
                                    CupertinoPageRoute(
                                      builder: (context) {
                                        return const HomeScreen();
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
                                    height: 50,
                                    alignment: Alignment.center,
                                    child: const Text(
                                      'Về trang chủ',
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
                  );
                } else {
                  return const Center(
                    child: Text('Lỗi'),
                  );
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}
