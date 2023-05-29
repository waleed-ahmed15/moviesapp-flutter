import 'package:flutter/material.dart';
import 'package:moviesapp/screens/watch_tab/watch_tab_page_controller.dart';

class WatchTabPages extends StatefulWidget {
  const WatchTabPages({super.key});

  @override
  State<WatchTabPages> createState() => _WatchTabPagesState();
}

class _WatchTabPagesState extends State<WatchTabPages>
    with TickerProviderStateMixin {
  late final PageController _pageController = PageController(
    initialPage: 0,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        scrollDirection: Axis.horizontal,
        physics: const NeverScrollableScrollPhysics(),
        pageSnapping: true,
        controller: globalPageControllerForWatchTab,
        children: watchTabPages,
      ),
    );
  }
}
