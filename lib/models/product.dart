class Product {
  late int bookId;
  late String title;
  String ? description;
  late String bookImageUrl;
  late double price;
  late String publishedDate;

  Product({
    required this.bookId,
    required this.title,
    this.description,
    required this.bookImageUrl,
    required this.price,
    required this.publishedDate
  });

  //api 데이터
  Product.fromJson(Map<String, dynamic> json) {
    bookId = int.parse(json['bookId']);
    title = json['title'];
    description = json['description'];
    bookImageUrl = json['bookImageUrl'];
    price = double.parse(json['price']);
    publishedDate = json['publishedDate'];
  }

  // 데이터베이스에서 가져온 데이터를 Product 객체로 변환
  factory Product.fromDatabase(Map<String, dynamic> data) {
    return Product(
      bookId: data['book_id'],
      title: data['title'],
      bookImageUrl: data['bookImageUrl'],
      publishedDate: data['publishedDate'],
      price: data['price'],
    );
  }
}