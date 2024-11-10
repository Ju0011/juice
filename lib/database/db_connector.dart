import 'package:mysql_client/mysql_client.dart';

import '../models/product.dart';

Future<List<Product>> dbConnector() async {
  print("Connecting to mysql server...");

  // MySQL 접속 설정
  final conn = await MySQLConnection.createConnection(
    host: '10.0.2.2',
    port: 3306,
    userName: 'root',
    password: 'qkrwndud8103!',
    databaseName: 'book', // optional
  );

  await conn.connect();
  print("Connected");

  final result = await conn.execute("SELECT * FROM books");


  List<Product> productList = [];

  // 데이터베이스에서 가져온 데이터를 Product 객체 리스트로 변환
  for (final row in result.rows) {
    final product = Product.fromDatabase({
      'book_id': int.parse(row.colByName('isbn')!),
      'title': row.colByName('title')!,
      'bookImageUrl': row.colByName('bookImageUrl')!,
      'publishedDate': row.colByName('publishedDate')!,
      'price': double.parse(row.colByName('price')!),
    });
    productList.add(product);
  }

  await conn.close();
  return productList;
}