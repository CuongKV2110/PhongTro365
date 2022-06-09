import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:phongtro/providers/singleton.dart';
import 'package:phongtro/ui/screen/create_post/pages/create_post_screen.dart';
import 'package:phongtro/ui/screen/newfeed_screen/pages/newfeed_screen.dart';
import 'package:phongtro/ui/screen/share_screen/pages/share_screen.dart';
import 'package:phongtro/ui/screen/post_screen/pages/post1_screen.dart';
import '../../../../resources/colors.dart';
import '../../blog_screen/pages/blog_screen.dart';
import '../../profile_screen/pages/profile_screen.dart';
import '../widgets/build_drawer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with AutomaticKeepAliveClientMixin {
  int _currentIndex = 0;
  final _controller = PageController(
    initialPage: 0,
  );

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return SafeArea(
      child: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            colors: [
              AppColors.black,
              AppColors.black,
            ],
          ),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          drawer: BuildDrawer(),
          appBar: AppBar(
            centerTitle: true,
            title: Text(
              _currentIndex == 0
                  ? 'Trang chủ'
                  : (_currentIndex == 1
                      ? 'Tìm kiếm'
                      : (_currentIndex == 2
                          ? 'Chọn chế độ bài viết'
                          : 'Tin tức')),
              style: const TextStyle(
                color: AppColors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            automaticallyImplyLeading: false,
            backgroundColor: Colors.transparent,
            elevation: 0,
            leading: Builder(
              builder: (context) => IconButton(
                icon: const Icon(
                  Icons.menu_outlined,
                  color: AppColors.white,
                ),
                onPressed: () => Scaffold.of(context).openDrawer(),
              ),
            ),
            actions: [
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
                child: Container(
                  alignment: Alignment.center,
                  child: ClipRRect(
                    child: CachedNetworkImage(
                      imageUrl: Singleton.instance.account.avt,
                      fit: BoxFit.cover,
                      width: 40,
                      height: 40,
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
              const SizedBox(
                width: 14,
              )
            ],
          ),
          body: PageView(
            physics: const NeverScrollableScrollPhysics(),
            onPageChanged: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
            controller: _controller,
            children: const [
              NewFeedScreen(),
              ShareScreen(),
              CreatePostScreen(),
              BlogScreen(),
            ],
          ),
          bottomNavigationBar: _buildBottom(),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  Widget _buildBottom() {
    return BottomNavigationBar(
      backgroundColor: AppColors.black,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: AppColors.orange2,
      selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
      unselectedItemColor: AppColors.gray,
      currentIndex: _currentIndex,
      onTap: (int index) {
        _controller.jumpToPage(index);
        setState(() {
          _currentIndex = index;
        });
      },
      items: [
        BottomNavigationBarItem(
          icon: Padding(
            padding: const EdgeInsets.symmetric(vertical: 2),
            child: Image.asset(
              'images/home1.png',
              color: _currentIndex == 0 ? AppColors.orange2 : AppColors.gray,
              width: 26,
              height: 26,
            ),
          ),
          label: 'Trang chủ',
        ),
        BottomNavigationBarItem(
          icon: Padding(
            padding: const EdgeInsets.symmetric(vertical: 2),
            child: Image.asset(
              'images/search.png',
              color: _currentIndex == 1 ? AppColors.orange2 : AppColors.gray,
              width: 26,
              height: 26,
            ),
          ),
          label: 'Tìm kiếm',
        ),
        BottomNavigationBarItem(
          icon: Padding(
            padding: const EdgeInsets.symmetric(vertical: 2),
            child: Image.asset(
              'images/create.png',
              color: _currentIndex == 2 ? AppColors.orange2 : AppColors.gray,
              width: 24,
              height: 24,
            ),
          ),
          label: 'Tạo bài viết',
        ),
        BottomNavigationBarItem(
          icon: Padding(
            padding: const EdgeInsets.symmetric(vertical: 2),
            child: Image.asset(
              'images/blog2.png',
              color: _currentIndex == 3 ? AppColors.orange2 : AppColors.gray,
              width: 26,
              height: 26,
            ),
          ),
          label: 'Tin tức',
        ),
      ],
    );
  }
}
