import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class SearchLibraryItem extends StatelessWidget {
  final dynamic item;

  SearchLibraryItem({required this.item});


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          minVerticalPadding: 10,     // 세로 padding 값
          horizontalTitleGap: 10,     // leading, title, trailing 위젯 간의 사이

          title: Text(
            item['title'].replaceAll('<b>', '').replaceAll('</b>', ''), // 태그 제거
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
          ),
          subtitle: Text(
            "주소 : ${item['address']} \n",
            style: const TextStyle(fontSize: 13),
          ),
        ),
        const Divider(), // 각 항목마다 구분선 추가
      ],
    );
  }
}
