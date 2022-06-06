import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phongtro/providers/extension.dart';
import 'package:phongtro/ui/screen/edit_post_screen/bloc/edit_post_bloc.dart';
import 'package:phongtro/ui/screen/edit_post_screen/bloc/edit_post_state.dart';
import 'package:phongtro/ui/screen/edit_post_screen/pages/edit_post_notify.dart';
import '../../../../models/extension.dart';
import '../../../../models/room.dart';
import '../../../../resources/colors.dart';
import '../../../../resources/dimensions.dart';
import '../../../../resources/fontsizes.dart';
import '../../post_screen/widgets/acreage_widget.dart';
import '../../post_screen/widgets/content_widget.dart';
import '../../post_screen/widgets/cost_widget.dart';
import '../../post_screen/widgets/electricity_widget.dart';
import '../../post_screen/widgets/internet_widget.dart';
import '../../post_screen/widgets/location_widget.dart';
import '../../post_screen/widgets/people_widget.dart';
import '../../post_screen/widgets/phone_widget.dart';
import '../../post_screen/widgets/water_widget.dart';

class EditPostScreen extends StatefulWidget {
  Room room;

  EditPostScreen(this.room);

  @override
  _EditPostScreenState createState() => _EditPostScreenState();
}

class _EditPostScreenState extends State<EditPostScreen> {
  int _owner = 0;
  int _type = 0;
  String type = '';
  String owner = '';
  TextEditingController peopleController = TextEditingController();
  TextEditingController acreageController = TextEditingController();
  TextEditingController costController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController waterController = TextEditingController();
  TextEditingController electricityController = TextEditingController();
  TextEditingController internetController = TextEditingController();
  TextEditingController contentController = TextEditingController();
  bool wifi = false;
  bool wc = false;
  bool time = false;
  bool vehicle = false;
  bool kitchen = false;
  bool fridge = false;
  bool washing = false;
  bool conditioning = false;
  EditPostBloc bloc = EditPostBloc();

  List<Extension> list = ListExtension.listExtension;

  @override
  void initState() {
    peopleController.text = widget.room.people;
    acreageController.text = widget.room.acreage;
    costController.text = widget.room.cost;
    locationController.text = widget.room.location;
    phoneController.text = widget.room.phone;
    waterController.text = widget.room.water;
    electricityController.text = widget.room.electricity;
    internetController.text = widget.room.internet;
    contentController.text = widget.room.content;
    list[0].isPress = widget.room.wifi;
    list[1].isPress = widget.room.wc;
    list[2].isPress = widget.room.time;
    list[3].isPress = widget.room.vehicle;
    list[4].isPress = widget.room.kitchen;
    list[5].isPress = widget.room.fridge;
    list[6].isPress = widget.room.washing;
    list[7].isPress = widget.room.conditioning;

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
              'Sửa bài viết',
              style: TextStyle(
                color: AppColors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            automaticallyImplyLeading: false,
            backgroundColor: Colors.black,
            elevation: 0,
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
          body: BlocProvider<EditPostBloc>(
            create: (context) => bloc,
            child: BlocBuilder<EditPostBloc, EditPostState>(
              builder: (context, state) {
                if (state is EditPostInitial) {
                  return _buildEditPost();
                }
                if (state is EditPostLoading) {
                  return const Center();
                }
                if (state is EditPostSuccess) {
                  return EditPostNotify(state.room.postID);
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

  _buildEditPost() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 20,
            ),
            ContentWidget(contentController),
            const SizedBox(
              height: 20,
            ),
            Text(
              "Thông tin cơ bản",
              style: TextStyle(
                  fontSize: AppFontSizes.fs16,
                  fontWeight: FontWeight.bold,
                  color: AppColors.orange1),
            ),
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
              height: 20,
            ),
            Text(
              "Các chi phí khác",
              style: TextStyle(
                  fontSize: AppFontSizes.fs16,
                  fontWeight: FontWeight.bold,
                  color: AppColors.orange1),
            ),
            const SizedBox(
              height: 20,
            ),
            WaterWidget(waterController),
            const SizedBox(
              height: 20,
            ),
            ElectricityWidget(electricityController),
            const SizedBox(
              height: 20,
            ),
            InternetWidget(internetController),
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
                      fontWeight: FontWeight.bold,
                      color: AppColors.orange1),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            GridView.builder(
              physics: const BouncingScrollPhysics(),
              shrinkWrap: true,
              itemCount: list.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
              ),
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      list[index].isPress = !list[index].isPress;
                    });
                    print('A');
                  },
                  child: Column(
                    children: [
                      Image.asset(
                        list[index].icon,
                        width: 40,
                        height: 40,
                        color: list[index].isPress
                            ? AppColors.blue
                            : AppColors.black,
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      Text(
                        list[index].name,
                        style: TextStyle(
                          color: list[index].isPress
                              ? AppColors.blue
                              : AppColors.black,
                        ),
                      )
                    ],
                  ),
                );
              },
            ),
            const SizedBox(
              height: 20,
            ),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  print(wifi);
                  print(wc);
                  print(vehicle);
                  print(conditioning);
                  wifi = list[0].isPress;
                  wc = list[1].isPress;
                  time = list[2].isPress;
                  vehicle = list[3].isPress;
                  kitchen = list[4].isPress;
                  washing = list[5].isPress;
                  fridge = list[6].isPress;
                  conditioning = list[7].isPress;
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
                  bloc.EditPost(
                    widget.room.status,
                    owner,
                    type,
                    peopleController.text.trim(),
                    acreageController.text.trim(),
                    costController.text.trim(),
                    locationController.text.trim(),
                    phoneController.text.trim(),
                    waterController.text.trim(),
                    electricityController.text.trim(),
                    internetController.text.trim(),
                    wifi,
                    wc,
                    time,
                    vehicle,
                    kitchen,
                    fridge,
                    washing,
                    conditioning,
                    contentController.text.trim(),
                    widget.room.postID,
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
                      'Cập nhật',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
