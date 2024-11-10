import 'package:flutter/material.dart';
import '../../models/product.dart';
import 'components/product_detail.dart';

class ItemDetailsPage extends StatelessWidget {
  final Product product;

  const ItemDetailsPage({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(product.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BookImage(bookImageUrl: product.bookImageUrl),
            const SizedBox(height: 16),
            BookTitle(title: product.title),
            const SizedBox(height: 8),
            PublishedDate(publishedDate: product.publishedDate),
            const SizedBox(height: 8),
            Price(price: product.price),
          ],
        ),
      ),
    );
  }
}
