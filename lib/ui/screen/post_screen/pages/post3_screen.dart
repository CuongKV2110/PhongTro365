import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:open_file/open_file.dart';
import 'package:phongtro/bloc/create_post/create_post_bloc.dart';
import 'package:phongtro/bloc/create_post/create_post_event.dart';
import 'package:phongtro/bloc/create_post/create_post_state.dart';
import 'package:phongtro/models/room.dart';
import 'package:phongtro/ui/screen/post_screen/pages/post_notify_screen.dart';
import 'package:phongtro/ui/screen/post_screen/widgets/content_widget.dart';
import '../../../../helpers/ui_helper.dart';
import '../../../../resources/colors.dart';
import '../../../../resources/dimensions.dart';

class Post3Screen extends StatefulWidget {
  String owner;
  String people;
  String acreage;
  String cost;
  String location;
  String phone;
  String water;
  String electricity;
  String internet;
  bool wifi;
  bool wc;
  bool time;
  bool vehicle;
  bool kitchen;
  bool fridge;
  bool washing;
  bool conditioning;

  Post3Screen(
    this.owner,
    this.people,
    this.acreage,
    this.cost,
    this.location,
    this.phone,
    this.water,
    this.electricity,
    this.internet,
    this.wifi,
    this.wc,
    this.time,
    this.vehicle,
    this.kitchen,
    this.fridge,
    this.washing,
    this.conditioning,
  );

  @override
  _Post3ScreenState createState() => _Post3ScreenState();
}

class _Post3ScreenState extends State<Post3Screen> {
  CreatePostBloc _createPostBloc = CreatePostBloc();
  TextEditingController contentController = TextEditingController();
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
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
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
              builder: (BuildContext context) {
                return PostNotifyScreen(_createPostBloc.postId);
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
                    physics: BouncingScrollPhysics(),
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
                          Container(
                            width: AppDimensions.d90w,
                            height: AppDimensions.d30h,
                            color: AppColors.gray,
                            child: Column(
                              children: [
                                Expanded(
                                  child: _image == null
                                      ? Center(
                                          child: Text('Images'),
                                        )
                                      : Image.file(_image!),
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 6,
                          ),
                          ElevatedButton(
                              onPressed: () {
                                imagePickerMethod();
                              },
                              child: Text('Add images')),
                          const SizedBox(
                            height: 20,
                          ),
                          ContentWidget(contentController),
                          const SizedBox(
                            height: 24,
                          ),
                          Center(
                            child: ElevatedButton(
                              onPressed: () {
                                Room room = Room(
                                  owner: widget.owner,
                                  people: widget.people,
                                  acreage: widget.acreage,
                                  cost: widget.cost,
                                  location: widget.location,
                                  phone: widget.phone,
                                  water: widget.water,
                                  electricity: widget.electricity,
                                  internet: widget.internet,
                                  wifi: widget.wifi,
                                  wc: widget.wc,
                                  time: widget.time,
                                  vehicle: widget.vehicle,
                                  kitchen: widget.kitchen,
                                  fridge: widget.fridge,
                                  washing: widget.washing,
                                  conditioning: widget.conditioning,
                                  content: contentController.text.trim(),
                                  imgUrl: _image!.path,
                                  postID: '',
                                );
                                _createPostBloc.add(
                                  CreatePost(
                                    room.owner,
                                    room.people,
                                    room.acreage,
                                    room.cost,
                                    room.location,
                                    room.phone,
                                    room.water,
                                    room.electricity,
                                    room.internet,
                                    room.wifi,
                                    room.wc,
                                    room.time,
                                    room.vehicle,
                                    room.kitchen,
                                    room.fridge,
                                    room.washing,
                                    room.conditioning,
                                    room.content,
                                    room.imgUrl,
                                    room.postID,
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
