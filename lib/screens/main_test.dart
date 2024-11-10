import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../../models/product.dart';

import '../../database/db_connector.dart';
import 'drawer/drawer_screen.dart';
import 'home/components/product_item.dart';

class HomeTestScreen extends StatelessWidget {
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
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return const Center(child: Text('오류 발생'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('데이터가 없습니다.'));
          } else {
            final productList = snapshot.data!;
            return PageView.builder(
              itemCount: productList.length,
              itemBuilder: (context, index) {
                return Center(
                  child: ProductItem(
                    product: productList[index],
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
