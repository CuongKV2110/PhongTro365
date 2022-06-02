import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ionicons/ionicons.dart';
import 'package:phongtro/models/room.dart';
import 'package:phongtro/ui/screen/detail_room_screen/pages/detail_room_screen.dart';
import 'package:phongtro/ui/screen/posted_screen/pages/posted_screen.dart';
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
  final TextEditingController _searchController = TextEditingController();
  ShareBloc shareBloc = ShareBloc();

  final List<String> items = [
    'Tìm theo giá',
    'Tìm theo khu vực',
    'Tìm phòng trống',
    'Tìm phòng ghép',
  ];
  String? selectedValue;

  /*void _runSearch(String text) {
    List<Room> _results = [];
    if (text.isEmpty) {
      _results = [];
    } else {
      _results = _foundList
          .where((Room) => Room.cost.toLowerCase().contains(text.toLowerCase()))
          .toList();
    }

    setState(() {
      _foundList = _results;
    });
  }*/

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

    return SizedBox(
      height: double.infinity,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(19, 0, 29, 0),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _searchController,
                    onChanged: (value) {
                      /*_runSearch(_searchController.text);*/
                    },
                    style: const TextStyle(color: AppColors.black),
                    decoration: const InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: AppColors.black),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: AppColors.black),
                      ),
                      border: UnderlineInputBorder(
                        borderSide: BorderSide(color: AppColors.black),
                      ),
                      hintText: 'Tìm kiếm',
                      hintStyle: TextStyle(
                        color: AppColors.black50,
                        fontSize: 15,
                      ),
                      prefixIcon: Icon(
                        Icons.search,
                        color: AppColors.black50,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                GestureDetector(
                  onTap: () {},
                  child: const Icon(Ionicons.options_outline,
                      color: AppColors.orange1),
                )
              ],
            ),
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
                  buttonWidth: 80,
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
                  dropdownMaxHeight: 200,
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
                itemCount: selectedValue == 'Tìm phòng ghép'
                    ? listPhongGhep.length
                    : (selectedValue == 'Tìm phòng trống'
                        ? listPhongTrong.length
                        : list.length),
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
                                postId: selectedValue == 'Tìm phòng ghép'
                                    ? listPhongGhep[index].postID
                                    : (selectedValue == 'Tìm phòng trống'
                                        ? listPhongTrong[index].postID
                                        : list[index].postID),
                              );
                            },
                          ),
                        );
                      },
                      child: ShareItem(
                        selectedValue == 'Tìm phòng ghép'
                            ? listPhongGhep[index]
                            : (selectedValue == 'Tìm phòng trống'
                                ? listPhongTrong[index]
                                : list[index]),
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
