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

class BookTitle extends StatelessWidget {
  final String title;

  const BookTitle({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
    );
  }
}

class PublishedDate extends StatelessWidget {
  final String publishedDate;

  const PublishedDate({Key? key, required this.publishedDate}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      '출판일 : $publishedDate',
      style: TextStyle(fontSize: 16, color: Colors.grey[700]),
    );
  }
}

class Price extends StatelessWidget {
  final double price;

  const Price({Key? key, required this.price}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      '$price원',
      style: TextStyle(fontSize: 20, color: Colors.green, fontWeight: FontWeight.bold),
    );
  }
}
