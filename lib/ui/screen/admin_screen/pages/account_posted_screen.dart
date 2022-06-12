import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phongtro/helpers/date_helper.dart';
import 'package:phongtro/models/account.dart';
import 'package:phongtro/models/room.dart';
import 'package:phongtro/models/write_detail.dart';
import 'package:phongtro/ui/screen/admin_screen/bloc/account_posted_bloc/account_posted_bloc.dart';
import 'package:phongtro/ui/screen/admin_screen/bloc/account_posted_bloc/account_posted_state.dart';

import '../../../../resources/colors.dart';
import '../widget/shimer_widget.dart';

class AccountPostedScreen extends StatefulWidget {
  Account account;

  AccountPostedScreen(this.account);

  @override
  _AccountPostedScreenState createState() => _AccountPostedScreenState();
}

class _AccountPostedScreenState extends State<AccountPostedScreen> {
  AccountPostedBloc accountPostedBloc = AccountPostedBloc();

  @override
  void initState() {
    accountPostedBloc.loadListPosted(widget.account);
    super.initState();
  }

  @override
  void dispose() {
    accountPostedBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            'Bài viết đã đăng',
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
        body: BlocProvider<AccountPostedBloc>(
          create: (context) => accountPostedBloc,
          child: BlocBuilder<AccountPostedBloc, AccountPostedState>(
            builder: (context, state) {
              if (state is AccountPostedLoading) {
                return const ShimmerWidget();
              }
              if (state is AccountPostedLoaded) {
                if (state.room.isEmpty && state.write.isEmpty) {
                  return const Center(
                    child: Text('Không có bài viết nào'),
                  );
                } else {
                  return Padding(
                    padding: const EdgeInsets.fromLTRB(24, 10, 24, 0),
                    child: ListView(
                      children: [
                        const SizedBox(
                          height: 10,
                        ),
                        const Text(
                          'Bài viết cho thuê phòng',
                          style: TextStyle(
                              color: AppColors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 22),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        _buildListRoom(state.room),
                        SizedBox(
                          height: 10,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text(
                          'Bài viết tìm phòng trọ',
                          style: TextStyle(
                              color: AppColors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 22),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        _buildListWrite(state.write),
                      ],
                    ),
                  );
                }
              }
              return const Center();
            },
          ),
        ),
      ),
    );
  }

  Widget _buildListWrite(List<WriteDetail> write) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      itemCount: write.length,
      itemBuilder: (context, index) {
        return Row(
          children: [
            Image.asset(
              'images/write.png',
              width: 60,
              height: 60,
            ),
            SizedBox(
              width: 16,
            ),
            Expanded(child: Text(write[index].write.content))
          ],
        );
      },
      separatorBuilder: (context, index) {
        return Column(
          children: const [
            SizedBox(
              height: 10,
            ),
            Divider(),
          ],
        );
      },
    );
  }

  Widget _buildListRoom(List<Room> list) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      itemCount: list.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          behavior: HitTestBehavior.translucent,
          onLongPress: () {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(32.0),
                    ),
                  ),
                  title: const Text(
                    "Xác nhận xóa bài",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  content: const Text("Bạn muốn xóa bài viết này ?"),
                  actions: [
                    TextButton(
                      child: const Text(
                        "Xóa",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      onPressed: () {
                        /*bloc.deleteWrite(postID);*/
                        Navigator.of(context).pop();
                      },
                    ),
                    TextButton(
                      child: const Text(
                        "Thoát",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                );
              },
            );
          },
          child: Row(
            children: [
              Container(
                width: 80,
                height: 80,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(16)),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: CachedNetworkImage(
                    imageUrl: list[index].imgUrl![0],
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      list[index].content,
                      style: const TextStyle(
                        color: AppColors.black,
                        fontSize: 13,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(list[index].status == 0
                        ? 'Đang đợi duyệt'
                        : DateHelper.getTimeAgo(list[index].timePost)),
                  ],
                ),
              ),
              /*Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(32.0),
                              ),
                            ),
                            title: const Text(
                              "Xác nhận xóa người dùng",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                            content: const Text("Bạn muốn xóa tài khoản này ?"),
                            actions: [
                              TextButton(
                                child: const Text(
                                  "Xóa",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                                onPressed: () {
                                  accountBloc.deleteAccount(list[index]);
                                  Navigator.of(context).pop();
                                },
                              ),
                              TextButton(
                                child: const Text(
                                  "Thoát",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                            ],
                          );
                        },
                      );
                    },
                    child: const Icon(Ionicons.trash_outline),
                  ),
                  const SizedBox(width: 10),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (builder) {
                            return SavedScreen();
                          },
                        ),
                      );
                    },
                    child: const Icon(Ionicons.chevron_forward_outline),
                  ),
                ],
              )*/
            ],
          ),
        );
      },
      separatorBuilder: (context, index) {
        return Column(
          children: const [
            SizedBox(
              height: 10,
            ),
            Divider(),
          ],
        );
      },
    );
  }
}
