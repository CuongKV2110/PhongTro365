import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phongtro/models/room.dart';
import 'package:phongtro/providers/singleton.dart';
import 'package:phongtro/resources/colors.dart';
import 'package:phongtro/resources/dimensions.dart';
import 'package:phongtro/resources/fontsizes.dart';
import 'package:phongtro/ui/screen/posted_screen/pages/posted_screen.dart';
import 'package:phongtro/ui/screen/saved_screen/bloc/saved_bloc.dart';
import 'package:phongtro/ui/screen/saved_screen/bloc/saved_event.dart';

import '../bloc/saved_state.dart';

class SavedScreen extends StatefulWidget {
  const SavedScreen({Key? key}) : super(key: key);

  @override
  _SavedScreenState createState() => _SavedScreenState();
}

class _SavedScreenState extends State<SavedScreen> {
  SavedBloc savedBloc = SavedBloc();

  @override
  void initState() {
    savedBloc.add(GetData());
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 1,
          centerTitle: true,
          backgroundColor: AppColors.black,
          title: const Text(
            'Bài viết đã đăng',
            style: TextStyle(
              color: AppColors.white,
              fontSize: 20,
            ),
          ),
        ),
        body: BlocProvider<SavedBloc>(
          create: (context) => savedBloc,
          child: BlocBuilder<SavedBloc, SavedState>(
            builder: (context, state) {
              if (state is SavedLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is SavedLoaded) {
                List<Room> list = [];
                for (int i = 0; i < state.listRoom.length; i++) {
                  Room room = state.listRoom[i];
                  String userID = Singleton.instance.account.userID;
                  if (room.userID == userID) {
                    list.add(room);
                  }
                }

                if (list.isEmpty) {
                  return const Center(
                    child: Text('Bạn chưa có bài đăng nào'),
                  );
                } else {
                  return ListView.builder(
                    itemCount: list.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(16),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(
                              CupertinoPageRoute(
                                builder: (context) {
                                  return PostedScreen(
                                      back: 0, postId: list[index].postID);
                                },
                              ),
                            );
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  SizedBox(
                                    width: AppDimensions.d30w,
                                    height: AppDimensions.d12h,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: CachedNetworkImage(
                                        imageUrl: list[index].imgUrl![0],
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        width: AppDimensions.d49w,
                                        height: AppDimensions.d8h,
                                        child: Text(
                                          list[index].content,
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 3,
                                          style: TextStyle(
                                              fontSize: AppFontSizes.fs12),
                                        ),
                                      ),
                                      Text(list[index].cost),
                                    ],
                                  ),
                                ],
                              ),
                              GestureDetector(
                                onTap: () {
                                  AwesomeDialog(
                                    context: context,
                                    dialogType: DialogType.QUESTION,
                                    width: 360,
                                    buttonsBorderRadius:
                                        BorderRadius.circular(20),
                                    headerAnimationLoop: false,
                                    animType: AnimType.SCALE,
                                    showCloseIcon: false,
                                    btnOkOnPress: () {
                                      savedBloc
                                          .add(DeletePost(list[index].postID));
                                      savedBloc.add(GetData());
                                    },
                                    btnOkText: 'Xóa',
                                    btnCancelOnPress: () {},
                                    btnCancelText: 'Chỉnh sửa',
                                    btnCancelColor: AppColors.red,
                                    btnOkColor: AppColors.green2,
                                  ).show();
                                },
                                child: const Icon(
                                  Icons.more_horiz_outlined,
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  );
                }
              } else if (state is SavedError) {
                return const Center(
                  child: Text('Loi'),
                );
              }
              return const Center();
            },
          ),
        ),
      ),
    );
  }
}
