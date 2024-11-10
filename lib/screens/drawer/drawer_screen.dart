import 'package:flutter/material.dart';
import '../../theme.dart';
import 'components/drawer_header.dart';


class DrawerScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          // 드로어 헤더
          const DrawerHeader(
            decoration: drawerHeaderDecoration, // theme.dart에서 설정한 스타일 사용
            child: ProfileInfo(), // components.dart에서 불러온 ProfileInfo 위젯 사용
          ),
          // 드로어 메뉴 항목
          ListTile(
            leading: Icon(Icons.home),
            title: Text('홈'),
            onTap: () {
              Navigator.pop(context); // 드로어 닫기
            },
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text('프로필'),
            onTap: () {
              Navigator.pop(context); // 드로어 닫기
            },
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('설정'),
            onTap: () {
              Navigator.pop(context); // 드로어 닫기
            },
          ),
          Divider(), // 구분선
          ListTile(
            leading: Icon(Icons.logout),
            title: Text('로그아웃'),
            onTap: () {
              Navigator.pop(context); // 드로어 닫기
            },
          ),
        ],
      ),
    );
  }
}
