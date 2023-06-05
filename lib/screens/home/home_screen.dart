import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:moviesapp/screens/watch_tab/watch_tab_page_controller.dart';
import 'package:moviesapp/screens/watch_tab/watch_tab_pages.dart';
import 'package:moviesapp/utils/app_colors.dart';

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
  int _selectedIndex = 1;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      if (index == 1 && globalCurrentIndexForWatchTab != 0) {
        globalCurrentIndexForWatchTab = 0;
        globalPageControllerForWatchTab.animateToPage(
          globalCurrentIndexForWatchTab,
          duration: const Duration(milliseconds: 100),
          curve: Curves.ease,
        );
      }
      print(globalCurrentIndexForWatchTab);
    });
  }

  final List<Widget> Screens = <Widget>[
    const Text('Dashboard'),
    const WatchTabPages(),
    const Text('Media Library'),
    const Text('More'),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: WillPopScope(
        onWillPop: () {
          return Future.value(false);
        },
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
      ),
    );
  }
}
