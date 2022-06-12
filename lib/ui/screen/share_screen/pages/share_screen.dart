import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ionicons/ionicons.dart';
import 'package:phongtro/models/room.dart';
import 'package:phongtro/resources/dimensions.dart';
import 'package:phongtro/ui/screen/detail_room_screen/pages/detail_room_screen.dart';
import 'package:phongtro/ui/screen/share_screen/bloc/share_bloc.dart';
import 'package:phongtro/ui/screen/share_screen/widgets/share_item.dart';
import '../../../../resources/colors.dart';
import '../bloc/share_state.dart';

class ShareScreen extends StatefulWidget {
  const ShareScreen({Key? key}) : super(key: key);

  @override
  _ShareScreenState createState() => _ShareScreenState();
}

class _ShareScreenState extends State<ShareScreen> {
  ShareBloc shareBloc = ShareBloc();

  final List<String> items = [
    'Tất cả phòng',
    'Phòng dưới 3 triệu',
    'Phòng từ 3 - 5 triệu',
    'Phòng trên 5 triệu',
    'Phòng ghép',
    'Phòng trống',
    'Phòng ở Hà Nội',
    'Phòng ở Hồ Chí Minh',
  ];
  String? selectedValue;

  @override
  void initState() {
    shareBloc.getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: RefreshIndicator(
          onRefresh: () async {
            await Future.delayed(
              const Duration(seconds: 2),
            );
            shareBloc.refreshData();
          },
          child: Scaffold(
            backgroundColor: AppColors.white,
            body: BlocProvider<ShareBloc>(
              create: (context) => shareBloc,
              child: BlocBuilder<ShareBloc, ShareState>(
                builder: (context, state) {
                  if (state is ShareLoading) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (state is ShareLoaded) {
                    return _buildSearch(state.listRoom);
                  } else if (state is ShareError) {
                    return const Center(
                      child: Text('Loi'),
                    );
                  }
                  return const Center();
                },
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSearch(List<Room> list) {
    List<Room> listPhongGhep = [];
    List<Room> listPhongTrong = [];
    List<Room> list3tr = [];
    List<Room> list5tr = [];
    List<Room> list3to5tr = [];
    List<Room> listHN = [];
    List<Room> listHCM = [];
    for (int i = 0; i < list.length; i++) {
      if (list[i].type == 'Phòng ghép') {
        listPhongGhep.add(list[i]);
      }
    }
    for (int i = 0; i < list.length; i++) {
      if (list[i].type == 'Phòng trống') {
        listPhongTrong.add(list[i]);
      }
    }
    for (int i = 0; i < list.length; i++) {
      if (list[i].cost < 3000000) {
        list3tr.add(list[i]);
      }
    }
    for (int i = 0; i < list.length; i++) {
      if (list[i].cost > 5000000) {
        list5tr.add(list[i]);
      }
    }
    for (int i = 0; i < list.length; i++) {
      if (list[i].cost >= 3000000 && 5000000 > list[i].cost) {
        list3to5tr.add(list[i]);
      }
    }
    for (int i = 0; i < list.length; i++) {
      if (list[i].location.contains('HN') ||
          list[i].location.contains('Hà Nội')) {
        listHN.add(list[i]);
      }
    }
    for (int i = 0; i < list.length; i++) {
      if (list[i].location.contains('HCM') ||
          list[i].location.contains('Hồ Chí Minh')) {
        listHCM.add(list[i]);
      }
    }

    return SizedBox(
      height: double.infinity,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(19, 0, 29, 0),
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            Center(
              child: DropdownButtonHideUnderline(
                child: DropdownButton2(
                  isExpanded: true,
                  items: items
                      .map((item) => DropdownMenuItem<String>(
                            value: item,
                            child: Text(
                              item,
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ))
                      .toList(),
                  value: selectedValue,
                  onChanged: (value) {
                    setState(() {
                      selectedValue = value as String;
                    });
                  },
                  icon: const Icon(Ionicons.options_outline,
                      color: AppColors.orange1),
                  iconSize: 26,
                  buttonHeight: 50,
                  buttonWidth: AppDimensions.d90w,
                  buttonPadding: const EdgeInsets.only(left: 14, right: 14),
                  buttonDecoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14),
                    border: Border.all(
                      color: Colors.black26,
                    ),
                    color: Colors.white,
                  ),
                  buttonElevation: 2,
                  itemHeight: 40,
                  itemPadding: const EdgeInsets.only(left: 14, right: 14),
                  dropdownMaxHeight: 400,
                  alignment: Alignment.center,
                  dropdownWidth: 200,
                  dropdownPadding: null,
                  dropdownDecoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14),
                    color: Colors.redAccent,
                  ),
                  dropdownElevation: 8,
                  scrollbarRadius: const Radius.circular(40),
                  scrollbarThickness: 6,
                  scrollbarAlwaysShow: true,
                  offset: const Offset(-20, 0),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: GridView.builder(
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 200,
                  childAspectRatio: 0.6,
                  crossAxisSpacing: 26,
                  mainAxisSpacing: 36,
                ),
                itemCount: selectedValue == "Tất cả phòng"
                    ? list.length
                    : (selectedValue == 'Phòng dưới 3 triệu'
                        ? list3tr.length
                        : (selectedValue == 'Phòng từ 3 - 5 triệu'
                            ? list3to5tr.length
                            : (selectedValue == 'Phòng trên 5 triệu'
                                ? list5tr.length
                                : (selectedValue == 'Phòng ghép'
                                    ? listPhongGhep.length
                                    : (selectedValue == 'Phòng trống'
                                        ? listPhongTrong.length
                                        : (selectedValue == 'Phòng ở Hà Nội'
                                            ? listHN.length
                                            : (selectedValue ==
                                                    'Phòng ở Hồ Chí Minh'
                                                ? listHCM.length
                                                : list.length))))))),
                itemBuilder: (context, index) {
                  return Container(
                    alignment: Alignment.center,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          CupertinoPageRoute(
                            builder: (context) {
                              return DetailRoomScreen(
                                  back: 0,
                                  postId: selectedValue == 'Tất cả phòng'
                                      ? list[index].postID
                                      : (selectedValue == 'Phòng dưới 3 triệu'
                                          ? list3tr[index].postID
                                          : (selectedValue ==
                                                  'Phòng từ 3 - 5 triệu'
                                              ? list3to5tr[index].postID
                                              : (selectedValue ==
                                                      'Phòng trên 5 triệu'
                                                  ? list5tr[index].postID
                                                  : (selectedValue == 'Phòng ghép'
                                                      ? listPhongGhep[
                                                              index]
                                                          .postID
                                                      : (selectedValue ==
                                                              'Phòng trống'
                                                          ? listPhongTrong[
                                                                  index]
                                                              .postID
                                                          : (selectedValue ==
                                                                  'Phòng ở Hà Nội'
                                                              ? listHN[index]
                                                                  .postID
                                                              : (selectedValue ==
                                                                      'Phòng ở Hồ Chí Minh'
                                                                  ? listHCM[
                                                                          index]
                                                                      .postID
                                                                  : list[index]
                                                                      .postID))))))));
                            },
                          ),
                        );
                      },
                      child: ShareItem(
                        selectedValue == 'Tất cả phòng'
                            ? list[index]
                            : (selectedValue == 'Phòng dưới 3 triệu'
                                ? list3tr[index]
                                : (selectedValue == 'Phòng từ 3 - 5 triệu'
                                    ? list3to5tr[index]
                                    : (selectedValue == 'Phòng trên 5 triệu'
                                        ? list5tr[index]
                                        : (selectedValue == 'Phòng ghép'
                                            ? listPhongGhep[index]
                                            : (selectedValue == 'Phòng trống'
                                                ? listPhongTrong[index]
                                                : (selectedValue ==
                                                        'Phòng ở Hà Nội'
                                                    ? listHN[index]
                                                    : (selectedValue ==
                                                            'Phòng ở Hồ Chí Minh'
                                                        ? listHCM[index]
                                                        : list[index]))))))),
                      ),
                    ),
                    decoration: BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.circular(15),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
