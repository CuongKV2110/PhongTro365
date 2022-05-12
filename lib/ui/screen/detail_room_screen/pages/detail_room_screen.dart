import 'package:flutter/material.dart';
import 'package:phongtro/ui/screen/home_screen/pages/home_screen.dart';
import '../../../../models/extension.dart';
import '../../../../resources/colors.dart';
import '../../../../resources/dimensions.dart';
import '../widgets/extension_item_widget.dart';
import '../widgets/image_widget.dart';
import '../widgets/info_widget.dart';

class DetailRoomScreen extends StatefulWidget {
  const DetailRoomScreen({Key? key}) : super(key: key);

  @override
  _DetailRoomScreenState createState() => _DetailRoomScreenState();
}

class _DetailRoomScreenState extends State<DetailRoomScreen> {
  final List<Extension> lisExtension = [
    Extension(
      icon: 'images/wifi.png',
      name: 'wifi',
      isPress: false,
    ),
    Extension(
      icon: 'images/toilet.png',
      name: 'WC riêng',
      isPress: false,
    ),
    Extension(
      icon: 'images/time.png',
      name: 'Giờ giấc',
      isPress: false,
    ),
    Extension(
      icon: 'images/xemay.png',
      name: 'Để xe',
      isPress: false,
    ),
    Extension(
      icon: 'images/bep.png',
      name: 'Bếp',
      isPress: false,
    ),
    Extension(
      icon: 'images/tulanh.png',
      name: 'Tủ lạnh',
      isPress: false,
    ),
    Extension(
      icon: 'images/maygiat.png',
      name: 'Máy giặt',
      isPress: false,
    ),
    Extension(
      icon: 'images/dieuhoa.png',
      name: 'Điều hòa',
      isPress: false,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: ListView(
            shrinkWrap: true,
            children: [
              ImageWidget(),
              InfoWidget(
                'Location',
                'cost',
                'acreage',
                'owner',
                'phone',
                'time',
              ),
              const SizedBox(
                height: 20,
              ),
              GridView.builder(
                physics: const BouncingScrollPhysics(),
                shrinkWrap: true,
                itemCount: lisExtension.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                ),
                itemBuilder: (context, index) {
                  return ExtensionItemWidget(lisExtension[index]);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
