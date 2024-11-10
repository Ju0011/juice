import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../../../models/product.dart';
import '../../components/constants.dart';
import '../../home_detail/home_detail_screen.dart';

class ProductItem extends StatelessWidget {
  final Product product;
  ProductItem({required this.product});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context){
            return ItemDetailsPage(product: product);
          },
        ));
      },
      child: Container(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center, //가운데 정렬
          children: [
            Expanded(
              child: CachedNetworkImage(
                height: 150,
                fit: BoxFit.cover,
                imageUrl: product.bookImageUrl,
                placeholder: (context, url) {
                  return const Center(
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 4),
              child: Text(
                product.title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
                overflow: TextOverflow.ellipsis, // 텍스트가 넘칠 때 말줄임표 표시
                maxLines: 2, // 최대 2줄로 제한
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 4),
              child: Text(
                "${numberFormat.format(product.price)}원",
                style: const TextStyle(fontSize: 12),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
