import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../../models/product.dart';
import '../drawer/drawer_screen.dart';
import 'components/product_item.dart';
import '../../database/db_connector.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("베스트 셀러"),
      ),
      drawer: DrawerScreen(),
      body: FutureBuilder<List<Product>>(
        future: dbConnector(), // MySQL에서 데이터를 로드하는 함수
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            // 데이터 로딩 중일 때 로딩 인디케이터 표시
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            // 오류 발생 시 오류 메시지 표시
            return const Center(child: Text('오류 발생'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            // 데이터가 없는 경우 메시지 표시
            return const Center(child: Text('데이터가 없습니다.'));
          } else {
            // 데이터를 성공적으로 로드한 경우 ListView로 표시
            final productList = snapshot.data!;
            return GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                childAspectRatio: 0.9,
                crossAxisCount: 2,
              ),
              itemCount: productList.length,
              itemBuilder: (context, index) {
                return ProductItem(
                  product: productList[index],
                );
              },
            );
          }
        },
      ),
    );
  }
}
