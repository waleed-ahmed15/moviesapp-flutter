import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:moviesapp/utils/app_colors.dart';

import '../watch_tab/watch_tab_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  static const List<String> _labelOptions = <String>[
    'Dashboard',
    'Watch',
    'Media Library',
    'More',
  ];
  static const List<IconData> _icons = <IconData>[
    Icons.dashboard,
    Icons.play_circle_filled,
    Icons.folder,
    Icons.menu,
  ];
  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Widget> Screens = <Widget>[
    const Text('Dashboard'),
    const WatchTabScreen(),
    const Text('Media Library'),
    const Text('More'),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Screens.elementAt(_selectedIndex),
        ),
        bottomNavigationBar: ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.r),
            topRight: Radius.circular(20.r),
          ),
          child: Container(
            height: 75.h,
            decoration: const BoxDecoration(),
            child: BottomNavigationBar(
              showUnselectedLabels: true,
              showSelectedLabels: true,
              type: BottomNavigationBarType.fixed,
              items: List.generate(
                _icons.length,
                (index) => BottomNavigationBarItem(
                  icon: Icon(_icons[index]),
                  label: _labelOptions[index],
                ),
              ),
              currentIndex: _selectedIndex,
              backgroundColor: AppColors.navbarColor,
              selectedItemColor: Colors.white,
              unselectedItemColor: Colors.grey,
              onTap: _onItemTapped,
            ),
          ),
        ),
      ),
    );
  }
}
