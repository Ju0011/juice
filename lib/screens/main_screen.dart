import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:juice/screens/home/home_screen.dart';
import 'package:juice/screens/search_library/search_library_screen.dart';
import 'package:juice/screens/search_page/search_page_screen.dart';
import 'my_page/my_page_screen.dart';


class MainScreens extends StatefulWidget {
  @override
  _MainScreensState createState() => _MainScreensState();
}

class _MainScreensState extends State<MainScreens> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: [HomeScreen(), SearchPage(),SearchLibraryScreen(), MyPageScreen()],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(label: '홈', icon: Icon(CupertinoIcons.home)),
          BottomNavigationBarItem(label: '책 검색', icon: Icon(CupertinoIcons.square_on_square)),
          const BottomNavigationBarItem(label: '서점 찾기', icon: Icon(CupertinoIcons.placemark)),
          //BottomNavigationBarItem(label: '베스트셀러', icon: Icon(CupertinoIcons.chat_bubble_2)),
          BottomNavigationBarItem(label: '마이페이지', icon: Icon(CupertinoIcons.person)),
        ],
      ),
    );
  }
}
