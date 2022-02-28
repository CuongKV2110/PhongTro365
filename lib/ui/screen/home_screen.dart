import 'package:flutter/material.dart';
import 'package:phongtro/resources/colors.dart';
import 'package:phongtro/resources/dimensions.dart';
import 'package:phongtro/ui/screen/newfeed_sreen.dart';
import 'package:phongtro/ui/screen/post_screen.dart';
import 'package:phongtro/ui/screen/profile_screen.dart';
import 'package:phongtro/ui/screen/saved_screen.dart';
import 'package:phongtro/ui/screen/search_screen.dart';

import 'menu_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  void _onTapScreen(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: _buildBody(),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: AppColors.white,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: AppColors.blue,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home_outlined,
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.search_outlined,
              ),
              label: 'Search',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.account_circle_outlined,
              ),
              label: 'Account',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.favorite_outline_outlined,
              ),
              label: 'Saved',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.menu,
              ),
              label: 'Menu',
            )
          ],
          onTap: (int index) {
            _onTapScreen(index);
          },
          currentIndex: _selectedIndex,
        ),
      ),
    );
  }

  Widget _buildBody() {
    if (_selectedIndex == 0) {
      return NewFeedScreen();
    } else if (_selectedIndex == 1) {
      return SearchScreen();
    } else if (_selectedIndex == 2) {
      return ProfileScreen();
    } else if (_selectedIndex == 3) {
      return SavedScreen();
    } else {
      return MenuScreen();
    }
  }

}
