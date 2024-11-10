import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class SearchResultItem extends StatelessWidget {
  final dynamic item;

  SearchResultItem({required this.item});

  Future<void> _launchURL(Uri url) async {
    await canLaunchUrl(url)
        ? await launchUrl(url)
        : throw 'Could not launch $url';
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          minVerticalPadding: 15,     // 세로 padding 값
          horizontalTitleGap: 20,     // leading, title, trailing 위젯 간의 사이
          leading: SizedBox(
            width: 80,
            height: 100,
            child: Image.network(
              item['image'],
              fit: BoxFit.contain,
            ),
          ),
          title: Text(
            item['title'].replaceAll('<b>', '').replaceAll('</b>', ''), // 태그 제거
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
          ),
          subtitle: Text(
            "${item['discount']}원 \n"
                "${item['author']} 저자(글) \n"
                "${item['publisher']} / ${item['pubdate']} 출판",
            style: const TextStyle(fontSize: 13),
          ),
          onTap: () {
            _launchURL(Uri.parse(item['link']));
          },
        ),
        Text(
          item['description'],
          maxLines: 6,
          overflow: TextOverflow.ellipsis,
        ),
        const SizedBox(height: 15), // Divider 위 공백 추가
        const Divider(), // 각 항목마다 구분선 추가
      ],
    );
  }
}
