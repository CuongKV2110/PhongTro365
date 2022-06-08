import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phongtro/helpers/date_helper.dart';
import 'package:phongtro/models/account.dart';
import 'package:phongtro/models/room.dart';
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
        body: BlocProvider<AccountPostedBloc>(
          create: (context) => accountPostedBloc,
          child: BlocBuilder<AccountPostedBloc, AccountPostedState>(
            builder: (context, state) {
              if (state is AccountPostedLoading) {
                return const ShimmerWidget();
              }
              if (state is AccountPostedLoaded) {
                if (state.data.isEmpty) {
                  return const Center(
                    child: Text('Không có bài viết nào'),
                  );
                } else {
                  return Padding(
                    padding: const EdgeInsets.fromLTRB(24, 10, 24, 0),
                    child: _buildListAccount(state.data),
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

  Widget _buildListAccount(List<Room> list) {
    return ListView.separated(
      physics: const BouncingScrollPhysics(),
      itemCount: list.length,
      itemBuilder: (context, index) {
        return Row(
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
