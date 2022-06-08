import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ionicons/ionicons.dart';
import 'package:phongtro/ui/screen/admin_screen/bloc/account_bloc/account_bloc.dart';
import 'package:phongtro/ui/screen/admin_screen/pages/account_posted_screen.dart';
import 'package:phongtro/ui/screen/admin_screen/widget/shimer_widget.dart';
import '../../../../models/account.dart';
import '../../../../resources/colors.dart';
import '../bloc/account_bloc/account_state.dart';

class AccountManagerScreen extends StatefulWidget {
  const AccountManagerScreen({Key? key}) : super(key: key);

  @override
  _AccountManagerScreenState createState() => _AccountManagerScreenState();
}

class _AccountManagerScreenState extends State<AccountManagerScreen> {
  AccountBloc accountBloc = AccountBloc();

  @override
  void initState() {
    accountBloc.getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: RefreshIndicator(
        onRefresh: () async {
          await Future.delayed(
            const Duration(seconds: 2),
          );
          accountBloc.refreshData();
        },
        child: Scaffold(
          body: BlocProvider<AccountBloc>(
            create: (context) => accountBloc,
            child: BlocBuilder<AccountBloc, AccountState>(
              builder: (context, state) {
                if (state is AccountLoading) {
                  return const ShimmerWidget();
                }
                if (state is AccountLoaded) {
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
      ),
    );
  }

  Widget _buildListAccount(List<Account> list) {
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
                  imageUrl: list[index].avt,
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
                    list[index].displayName,
                    style: const TextStyle(
                      color: AppColors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(list[index].email),
                ],
              ),
            ),
            Row(
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
                          return AccountPostedScreen(list[index]);
                        },
                      ),
                    );
                  },
                  child: const Icon(Ionicons.chevron_forward_outline),
                ),
              ],
            )
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
