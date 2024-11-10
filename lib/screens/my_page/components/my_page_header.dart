import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyPageHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(

        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
        child: Column(
          children: [
            _buildProfile(),
          ],
        ),
      ),
    );
  }

  Widget _buildProfile() {
    return Container(
      padding: const EdgeInsets.all(16.0), // 내부 여백
      decoration: const BoxDecoration(
        color: Colors.green, // 배경색 설정
        borderRadius: BorderRadius.all(Radius.circular(10)), // 모서리 둥글게
      ),
      child: const Row(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundImage: AssetImage('asset/img/posi.jpg'), // 프로필 이미지 URL
          ),
          SizedBox(width: 10), // 이미지와 텍스트 사이 간격
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '박 주영',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'parkjy@smsoftlab.co.kr',
                style: TextStyle(
                  color: Colors.white70,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }


}
