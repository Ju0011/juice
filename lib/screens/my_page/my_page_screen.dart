
import 'package:flutter/material.dart';
import 'components/my_page_header.dart';


class MyPageScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('마이 페이지'),
        bottom: const PreferredSize(
          preferredSize: Size.fromHeight(0.5),
          child: Divider(thickness: 0.5, height: 0.5, color: Colors.grey),
        ),
      ),
      body: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          MyPageHeader(),

        ],
      ),
    );
  }
}
