import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ionicons/ionicons.dart';
import 'package:phongtro/models/room.dart';
import 'package:phongtro/resources/dimensions.dart';
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
  List<Room> _foundList = [];
  ShareBloc shareBloc = ShareBloc();

  void _runSearch(String text) {
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
  }

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
                  for (int i = 0; i < state.listRoom.length; i++) {
                    if (state.listRoom[i].type == 'Phòng ghép') {
                      _foundList.add(state.listRoom[i]);
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
                                    _runSearch(_searchController.text);
                                  },
                                  style:
                                      const TextStyle(color: AppColors.black),
                                  decoration: const InputDecoration(
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: AppColors.black),
                                    ),
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: AppColors.black),
                                    ),
                                    border: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: AppColors.black),
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
                          /*Expanded(
                            child: _foundList.isNotEmpty
                                ? GridView.builder(
                                    shrinkWrap: true,
                                    physics: const BouncingScrollPhysics(),
                                    gridDelegate:
                                        const SliverGridDelegateWithMaxCrossAxisExtent(
                                      maxCrossAxisExtent: 200,
                                      childAspectRatio: 0.6,
                                      crossAxisSpacing: 20,
                                      mainAxisSpacing: 20,
                                    ),
                                    itemCount: _foundList.length,
                                    itemBuilder: (_, index) {
                                      return Container(
                                        alignment: Alignment.center,
                                        child: GestureDetector(
                                          onTap: () {
                                            Navigator.of(context).push(
                                              CupertinoPageRoute(
                                                builder: (context) {
                                                  return PostedScreen(
                                                    back: 0,
                                                    postId: _foundList[index]
                                                        .postID,
                                                  );
                                                },
                                              ),
                                            );
                                          },
                                          child: ShareItem(_foundList[index]),
                                        ),
                                        decoration: BoxDecoration(
                                          color: Colors.amber,
                                          borderRadius:
                                              BorderRadius.circular(15),
                                        ),
                                      );
                                    },
                                  )
                                : const Text(
                                    'Khong co ket qua',
                                    style: TextStyle(fontSize: 24),
                                  ),
                          )*/
                        ],
                      ),
                    ),
                  );
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
    );
  }
}
