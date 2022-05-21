import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../../../../models/shop_detail.dart';
import '../../../../resources/colors.dart';
import '../../detail_room_screen/pages/detail_room_screen.dart';

class BuildShopDetail extends StatefulWidget {
  const BuildShopDetail({Key? key}) : super(key: key);

  @override
  _BuildShopDetailState createState() => _BuildShopDetailState();
}

class _BuildShopDetailState extends State<BuildShopDetail> {
  final List<ShopDetail> list = [];
  List<ShopDetail> _foundlist = [];

  void _runSearch(String text) {
    List<ShopDetail> _results = [];
    if (text.isEmpty) {
      _results = list;
    } else {
      _results = list
          .where((ShopDetail) =>
              ShopDetail.name.toLowerCase().contains(text.toLowerCase()))
          .toList();
    }

    setState(() {
      _foundlist = _results;
    });
  }

  @override
  void initState() {
    list.add(
      ShopDetail(
        img:
            'https://file.hstatic.net/1000061481/file/2.3_c3d5765c94e440c5b408a6849fc70466.jpeg',
        name: 'Adidas Predator X3.21',
        isTym: false,
        cost: 30,
      ),
    );
    list.add(
      ShopDetail(
        img: 'https://cf.NewFeedee.vn/file/3f217175d2ef0417ec83325907137a47',
        name: 'Nike Phantom 2.1',
        isTym: false,
        cost: 25,
      ),
    );
    list.add(
      ShopDetail(
        img: 'https://cf.NewFeedee.vn/file/fbfdad77c8d108e2f6aff2036c8f8980',
        name: 'Nike Mercurial Pro',
        isTym: false,
        cost: 16,
      ),
    );
    list.add(
      ShopDetail(
        img: 'https://cf.NewFeedee.vn/file/7203786a758abb3f916e729e73dd2a88',
        name: 'Thuong Dinh Sport',
        isTym: false,
        cost: 53,
      ),
    );
    list.add(
      ShopDetail(
        img:
            'https://vn-live-01.slatic.net/p/b3a8ea7dafb92528edd3fdee3bbeef01.jpg',
        name: 'Puma Special 2.2',
        isTym: false,
        cost: 28,
      ),
    );
    list.add(
      ShopDetail(
        img:
            'https://file.hstatic.net/1000061481/file/giay_co_nhan_tao_tot__4__c4441963d57949f686c024e00dfa5e96.jpg',
        name: 'Adidas Predator X20.3',
        isTym: false,
        cost: 23,
      ),
    );
    list.add(
      ShopDetail(
        img: 'https://cf.NewFeedee.vn/file/fc749d2ba69234945471b263a36d76d9',
        name: 'Puma Neymar Pro',
        isTym: false,
        cost: 43,
      ),
    );
    list.add(
      ShopDetail(
        img:
            'https://www.sport9.vn/images/uploaded/Vapor%2013%20FTL2/87c301bb223ed860812f.jpg',
        name: 'Nike Focus X4.5',
        isTym: false,
        cost: 51,
      ),
    );
    list.add(
      ShopDetail(
        img:
            'https://giaydabonghana.com/wp-content/uploads/2019/03/giay-da-bong-san-co-nhan-tao-mitre-vang-tf-hana-1.jpg',
        name: 'Mizuno X8 AG',
        isTym: false,
        cost: 49,
      ),
    );
    list.add(
      ShopDetail(
        img:
            'https://i.pinimg.com/originals/36/bf/43/36bf43eabcbd15f6c5215e3a056d21e5.jpg',
        name: 'Adidas Special Summer',
        isTym: false,
        cost: 62,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SliverGrid(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) {
                    return DetailRoomScreen();
                  },
                ),
              );
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(7),
                gradient: const LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    AppColors.orange1,
                    AppColors.orange2,
                  ],
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(1),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7),
                    color: AppColors.black,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(4, 2, 4, 2),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(4),
                            child: CachedNetworkImage(
                              imageUrl: list[index].img,
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Text(
                              '\$' + list[index].cost.toString(),
                              style: TextStyle(
                                color: AppColors.orange1,
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                              ),
                            ),
                            const Spacer(),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  list[index].isTym = !list[index].isTym;
                                });
                              },
                              child: Icon(
                                list[index].isTym
                                    ? Icons.favorite
                                    : Icons.favorite_outline,
                                color: list[index].isTym
                                    ? AppColors.red2
                                    : AppColors.white,
                              ),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          list[index].name,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: AppColors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(
                          height: 6,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
        childCount: list.length,
      ),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 30,
        crossAxisSpacing: 10,
        childAspectRatio: 0.6,
      ),
    );
  }
}
