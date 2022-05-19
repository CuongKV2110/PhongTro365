import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phongtro/ui/screen/detail_room_screen/pages/detail_room_screen.dart';
import 'package:phongtro/ui/screen/profile_screen/pages/profile_screen.dart';
import '../../../../resources/colors.dart';
import '../../../../resources/dimensions.dart';
import '../bloc/shop_bloc.dart';
import '../bloc/shop_state.dart';
import '../pages/shop_detail_screen.dart';
import 'button_widget.dart';
import 'info_widget.dart';

class BuildShop extends StatefulWidget {
  const BuildShop({Key? key}) : super(key: key);

  @override
  _BuildShopState createState() => _BuildShopState();
}

class _BuildShopState extends State<BuildShop> {
  ShopBloc bloc = ShopBloc();

  @override
  void initState() {
    bloc.getData();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ShopBloc>(
      create: (context) => bloc,
      child: BlocBuilder<ShopBloc, ShopState>(builder: (context, state) {
        if (state is ShopLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is ShopLoaded) {
          return ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: bloc.list.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Container(
                      width: AppDimensions.d90w,
                      height: AppDimensions.d50h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(7),
                        color: AppColors.black50.withOpacity(0.2),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(19),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _buildHeader(index),
                            const SizedBox(height: 10),
                            _buildImage(index),
                            const SizedBox(height: 10),
                            _buildIcon(index),
                            const SizedBox(height: 10),
                            _buildContent(index),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    )
                  ],
                );
              });
        } else if (state is ShopError) {
          return const Center(
            child: const Text('Loi'),
          );
        }
        return const Center();
      }),
    );
  }

  Widget _buildHeader(int index) {
    return Row(
      children: [
        GestureDetector(
          onTap: () {
            Navigator.of(context).push(
              CupertinoPageRoute(
                builder: (context) {
                  return ProfileScreen();
                },
              ),
            );
          },
          child: InfoWidget(index),
        ),
        const Spacer(),
        const ButtonWidget(),
      ],
    );
  }

  Widget _buildImage(int index) {
    return Expanded(
      child: GestureDetector(
        child: Row(
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(6),
                  child: CachedNetworkImage(
                    imageUrl: bloc.list[index].img1,
                    fit: BoxFit.fill,
                    width: AppDimensions.d50w,
                    height: AppDimensions.d40h,
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Column(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                      ],
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(6),
                      child: CachedNetworkImage(
                        imageUrl: bloc.list[index].img2,
                        fit: BoxFit.fill,
                        width: AppDimensions.d30w,
                        height: 100,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                      ],
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(6),
                      child: CachedNetworkImage(
                        imageUrl: bloc.list[index].img3,
                        fit: BoxFit.fill,
                        width: AppDimensions.d30w,
                        height: 100,
                      ),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _buildIcon(int index) {
    return Row(
      children: [
        Row(
          children: [
            GestureDetector(
              onTap: () {
                setState(() {
                  bloc.list[index].isTym = !bloc.list[index].isTym;
                });
              },
              child: Icon(
                bloc.list[index].isTym
                    ? Icons.favorite
                    : Icons.favorite_outline,
                color:
                    bloc.list[index].isTym ? AppColors.red2 : AppColors.black,
              ),
            ),
            const SizedBox(
              width: 4,
            ),
            const Text(
              '2.3K',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: AppColors.black,
                fontSize: 12,
              ),
            )
          ],
        ),
        const Spacer(),
        GestureDetector(
          onTap: () {
            setState(() {
              bloc.list[index].isSave = !bloc.list[index].isSave;
            });
          },
          child: Icon(
            bloc.list[index].isSave ? Icons.bookmark : Icons.bookmark_outline,
            color: AppColors.black,
          ),
        ),
      ],
    );
  }

  Widget _buildContent(int index) {
    return Text(
      bloc.list[index].content,
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
      style: const TextStyle(color: AppColors.black, fontSize: 12, height: 1.7),
    );
  }
}
