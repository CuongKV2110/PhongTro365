import 'package:flutter/material.dart';
import 'package:phongtro/ui/screen/admin_screen/pages/post_manager_screen.dart';
import 'package:phongtro/ui/screen/admin_screen/pages/postwaitting_screen.dart';
import 'package:phongtro/ui/screen/newfeed_screen/pages/newfeed_screen.dart';

import '../../../../resources/colors.dart';
import '../../share_screen/pages/share_screen.dart';
import '../widget/admin_drawer.dart';

class AdminScreen extends StatefulWidget {
  const AdminScreen({Key? key}) : super(key: key);

  @override
  _AdminScreenState createState() => _AdminScreenState();
}

class _AdminScreenState extends State<AdminScreen> {
  int _currentIndex = 0;
  final _controller = PageController(
    initialPage: 0,
  );
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
          drawer: AdminDrawer(),
          appBar: AppBar(
            centerTitle: true,
            title: Text(
              _currentIndex == 0
                  ? 'Quản lý bài viết'
                  : (_currentIndex == 1 ? 'Đợi duyệt' : 'Quản lý tài khoản'),
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
              PostManagerScreen(),
              PostWattingScreen(),
              ShareScreen(),
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
              'images/managerpost.png',
              color: _currentIndex == 0 ? AppColors.orange2 : AppColors.gray,
              width: 26,
              height: 26,
            ),
          ),
          label: 'Quản lý bài viết',
        ),
        BottomNavigationBarItem(
          icon: Padding(
            padding: const EdgeInsets.symmetric(vertical: 2),
            child: Image.asset(
              'images/managerpost2.png',
              color: _currentIndex == 1 ? AppColors.orange2 : AppColors.gray,
              width: 26,
              height: 26,
            ),
          ),
          label: 'Đợi duyệt',
        ),
        BottomNavigationBarItem(
          icon: Padding(
            padding: const EdgeInsets.symmetric(vertical: 2),
            child: Image.asset(
              'images/manageraccount.png',
              color: _currentIndex == 2 ? AppColors.orange2 : AppColors.gray,
              width: 26,
              height: 26,
            ),
          ),
          label: 'Quản lý tài khoản',
        ),
      ],
    );
  }
}
