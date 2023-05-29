import 'package:flutter/cupertino.dart';
import 'package:moviesapp/screens/watch_tab/watch_tab_genres_screen.dart';
import 'package:moviesapp/screens/watch_tab/watch_tab_screen.dart';

int globalCurrentIndexForWatchTab = 0;
final PageController globalPageControllerForWatchTab =
    PageController(initialPage: globalCurrentIndexForWatchTab);

final List<Widget> watchTabPages = [
  const WatchTabScreen(),
  const WatchTabGenreScreen(),
  const Text('page3'),
  // const ChatListScreen(),
  // const CreateNewChat(),
  // const BannedChats(),
  // Container(color: Colors.blue),
];
