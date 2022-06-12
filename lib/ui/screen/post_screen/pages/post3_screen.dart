import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:open_file/open_file.dart';
import 'package:phongtro/models/room.dart';
import 'package:phongtro/providers/singleton.dart';
import 'package:phongtro/ui/screen/post_screen/pages/post_notify_screen.dart';
import 'package:phongtro/ui/screen/post_screen/widgets/content_widget.dart';
import '../../../../helpers/ui_helper.dart';
import '../../../../resources/colors.dart';
import '../../../../resources/dimensions.dart';
import '../bloc/create_post/create_post_bloc.dart';
import '../bloc/create_post/create_post_event.dart';
import '../bloc/create_post/create_post_state.dart';

class Post3Screen extends StatefulWidget {
  String owner;
  String type;
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
    this.type,
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
  FilePickerResult? result2;
  FilePickerResult? result3;
  PlatformFile? file1;
  PlatformFile? file2;
  PlatformFile? file3;
  bool isOpen1 = false;
  bool isOpen2 = false;
  bool isOpen3 = false;
  File? _image1;
  File? _image2;
  File? _image3;
  ImagePicker _imagePicker1 = ImagePicker();
  ImagePicker _imagePicker2 = ImagePicker();
  ImagePicker _imagePicker3 = ImagePicker();

  Future image1PickerMethod() async {
    final pick1 = await _imagePicker1.pickImage(source: ImageSource.gallery);
    setState(() {
      if (pick1 != null) {
        _image1 = File(pick1.path);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('Error'),
        ));
      }
    });
  }

  void pickFiles1() async {
    result1 = await FilePicker.platform.pickFiles();
    if (result1 == null) return;
    file1 = result1!.files.first;
    setState(() {
      isOpen1 = !isOpen1;
    });
  }

  Future image2PickerMethod() async {
    final pick2 = await _imagePicker2.pickImage(source: ImageSource.gallery);
    setState(() {
      if (pick2 != null) {
        _image2 = File(pick2.path);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('Error'),
        ));
      }
    });
  }

  void pickFiles2() async {
    result2 = await FilePicker.platform.pickFiles();
    if (result2 == null) return;
    file2 = result2!.files.first;
    setState(() {
      isOpen2 = !isOpen2;
    });
  }

  Future image3PickerMethod() async {
    final pick3 = await _imagePicker3.pickImage(source: ImageSource.gallery);
    setState(() {
      if (pick3 != null) {
        _image3 = File(pick3.path);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('Error'),
        ));
      }
    });
  }

  void pickFiles3() async {
    result3 = await FilePicker.platform.pickFiles();
    if (result3 == null) return;
    file3 = result3!.files.first;
    setState(() {
      isOpen3 = !isOpen3;
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
                    physics: const BouncingScrollPhysics(),
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
                          SizedBox(
                            width: AppDimensions.d100w,
                            height: AppDimensions.d30h,
                            child: Row(
                              children: [
                                Expanded(
                                  child: Column(
                                    children: [
                                      Expanded(
                                        child: _image1 == null
                                            ? Center(
                                                child: GestureDetector(
                                                  onTap: () {
                                                    image1PickerMethod();
                                                  },
                                                  child: Container(
                                                    width: double.maxFinite,
                                                    height: double.maxFinite,
                                                    child: const Center(
                                                      child: Text(
                                                        '+',
                                                        style: TextStyle(
                                                            fontSize: 30,
                                                            color: AppColors
                                                                .gray8),
                                                      ),
                                                    ),
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                      color: AppColors.gray,
                                                    ),
                                                  ),
                                                ),
                                              )
                                            : GestureDetector(
                                                onTap: () {
                                                  image1PickerMethod();
                                                },
                                                child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  child: Image.file(
                                                    _image1!,
                                                    width: AppDimensions.d50w,
                                                    height: AppDimensions.d30h,
                                                    fit: BoxFit.fill,
                                                  ),
                                                ),
                                              ),
                                      )
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  width: 4,
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Column(
                                    children: [
                                      Expanded(
                                        child: _image2 == null
                                            ? Center(
                                                child: GestureDetector(
                                                  onTap: () {
                                                    image2PickerMethod();
                                                  },
                                                  child: Container(
                                                    width: double.maxFinite,
                                                    height: double.maxFinite,
                                                    child: const Center(
                                                      child: Text(
                                                        '+',
                                                        style: const TextStyle(
                                                            fontSize: 26,
                                                            color: AppColors
                                                                .gray8),
                                                      ),
                                                    ),
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                      color: AppColors.gray,
                                                    ),
                                                  ),
                                                ),
                                              )
                                            : GestureDetector(
                                                onTap: () {
                                                  image2PickerMethod();
                                                },
                                                child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  child: Image.file(
                                                    _image2!,
                                                    width: AppDimensions.d40w,
                                                    height: AppDimensions.d15h,
                                                    fit: BoxFit.fill,
                                                  ),
                                                ),
                                              ),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Expanded(
                                        child: _image3 == null
                                            ? Center(
                                                child: GestureDetector(
                                                  onTap: () {
                                                    image3PickerMethod();
                                                  },
                                                  child: Container(
                                                    width: double.maxFinite,
                                                    height: double.maxFinite,
                                                    child: const Center(
                                                      child: Text(
                                                        '+',
                                                        style: TextStyle(
                                                            fontSize: 26,
                                                            color: AppColors
                                                                .gray8),
                                                      ),
                                                    ),
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                      color: AppColors.gray,
                                                    ),
                                                  ),
                                                ),
                                              )
                                            : GestureDetector(
                                                onTap: () {
                                                  image3PickerMethod();
                                                },
                                                child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  child: Image.file(
                                                    _image3!,
                                                    width: AppDimensions.d40w,
                                                    height: AppDimensions.d15h,
                                                    fit: BoxFit.fill,
                                                  ),
                                                ),
                                              ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
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
                                List<String> imgUrl = [
                                  _image1!.path,
                                  _image2!.path,
                                  _image3!.path
                                ];
                                Room room = Room(
                                  status: 0,
                                  owner: widget.owner,
                                  type: widget.type,
                                  people: int.parse(widget.people),
                                  acreage: int.parse(widget.acreage),
                                  cost: int.parse(widget.cost),
                                  location: widget.location,
                                  phone: int.parse(widget.phone),
                                  water: int.parse(widget.water),
                                  electricity: int.parse(widget.electricity),
                                  internet: int.parse(widget.internet),
                                  wifi: widget.wifi,
                                  wc: widget.wc,
                                  time: widget.time,
                                  vehicle: widget.vehicle,
                                  kitchen: widget.kitchen,
                                  fridge: widget.fridge,
                                  washing: widget.washing,
                                  conditioning: widget.conditioning,
                                  content: contentController.text.trim(),
                                  imgUrl: imgUrl,
                                  comment: [],
                                  postID: '',
                                  userID: Singleton.instance.account.userID,
                                  userAvatar: Singleton.instance.account.avt,
                                  userName:
                                      Singleton.instance.account.displayName,
                                  timePost:
                                      DateTime.now().millisecondsSinceEpoch ~/
                                          1000,
                                );
                                _createPostBloc.add(
                                  CreatePost(
                                      room.status,
                                      room.owner,
                                      room.type,
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
                                      room.imgUrl!,
                                      room.comment!,
                                      room.postID,
                                      room.userID,
                                      room.userAvatar,
                                      room.userName,
                                      room.timePost),
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
