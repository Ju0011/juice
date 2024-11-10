import 'package:flutter/material.dart';

class ProfileInfo extends StatelessWidget {
  const ProfileInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CircleAvatar(
          radius: 30,
          backgroundImage: AssetImage('asset/img/posi.jpg'), // 프로필 이미지 URL
        ),
        SizedBox(height: 10),
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
    );
  }
}
