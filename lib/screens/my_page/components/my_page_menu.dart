import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class BookImage extends StatelessWidget {
  final String bookImageUrl;

  const BookImage({Key? key, required this.bookImageUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.all(15),
      child: CachedNetworkImage(
        width: MediaQuery.of(context).size.width * 0.8,
        fit: BoxFit.cover,
        imageUrl: bookImageUrl,
        placeholder: (context, url) {
          return const Center(
            child: CircularProgressIndicator(
              strokeWidth: 2,
            ),
          );
        },
      ),
    );
  }
}