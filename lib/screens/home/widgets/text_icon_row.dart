import 'package:flutter/material.dart';
import 'package:moviesapp/screens/watch_tab/watch_tab_page_controller.dart';
import 'package:moviesapp/utils/text_styles.dart';

class Watch_Search_Row extends StatelessWidget {
  const Watch_Search_Row({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          "Watch",
          style: title_text_Style,
        ),
        const Spacer(),
        IconButton(
          onPressed: () {
            globalCurrentIndexForWatchTab = 1;
            globalPageControllerForWatchTab.animateToPage(
              1,
              duration: const Duration(milliseconds: 100),
              curve: Curves.ease,
            );
            // globalPageControllerForWatchTab.positions.last.animateTo(
            //   1.sw,
            //   duration: const Duration(milliseconds: 100),
            //   curve: Curves.ease,
            // );
            // print('object');
          },
          icon: const Icon(Icons.search),
        ),
      ],
    );
  }
}
