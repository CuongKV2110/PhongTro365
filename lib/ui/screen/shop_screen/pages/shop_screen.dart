import 'package:flutter/material.dart';
import 'package:phongtro/resources/colors.dart';
import '../widgets/build_shop.dart';
import '../widgets/build_shop_bar.dart';

class ShopScreen extends StatefulWidget {
  const ShopScreen({Key? key}) : super(key: key);

  @override
  _ShopScreenState createState() => _ShopScreenState();
}

class _ShopScreenState extends State<ShopScreen>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Scaffold(
        backgroundColor: AppColors.white,
        body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: ListView(
              physics: const BouncingScrollPhysics(),
              children: const [
                SizedBox(
                  height: 10,
                ),
                BuildShopBar(),
                BuildShop(),
              ],
            )),
      ),
    );
  }
}
