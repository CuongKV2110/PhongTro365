import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:phongtro/ui/screen/newfeed_screen/pages/newfeed_sreen.dart';
import 'package:phongtro/ui/screen/notify_screen/pages/notify_screen.dart';
import 'package:phongtro/ui/screen/post_screen/pages/post1_screen.dart';
import 'package:phongtro/ui/screen/share_screen/pages/share_screen.dart';

import '../../../../resources/colors.dart';
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
          drawer: const BuildDrawer(),
          appBar: AppBar(
            centerTitle: true,
            title: Text(
              _currentIndex == 0
                  ? 'Home Page'
                  : (_currentIndex == 1
                      ? 'Share Room'
                      : (_currentIndex == 2
                          ? 'Create New Post'
                          : 'Notifications')),
              style: TextStyle(
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
                    MaterialPageRoute(
                      builder: (context) {
                        return const ProfileScreen();
                      },
                    ),
                  );
                },
                child: Container(
                  alignment: Alignment.center,
                  child: ClipRRect(
                    child: Image.asset(
                      'images/avt.jpg',
                      fit: BoxFit.cover,
                      width: 40,
                      height: 40,
                    ),
                    borderRadius: BorderRadius.circular(10),
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
              Post1Screen(),
              NotifyScreen(),
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
      items: const [
        BottomNavigationBarItem(
          icon: Icon(
            Ionicons.home_outline,
          ),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Ionicons.people_circle_outline,
          ),
          label: 'Share',
          backgroundColor: AppColors.white,
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Ionicons.add_circle_outline,
          ),
          label: 'Create',
          backgroundColor: AppColors.white,
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Ionicons.notifications_outline,
          ),
          label: 'Notify',
        ),
      ],
    );
  }
}
