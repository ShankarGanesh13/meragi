import 'package:meragi/models/rating.dart';

class Product {
  int id;
  String title;
  String price;
  String description;
  String category;
  String image;
  Rating rating;
  Product(
      {required this.category,
      required this.description,
      required this.price,
      required this.image,
      required this.id,
      required this.title,
      required this.rating});
  factory Product.fromJson(Map<String, dynamic> product) {
    return Product(
      category: product["category"],
      description: product["description"],
      price: product["price"].toString(),
      image: product["image"],
      id: product["id"],
      title: product["title"],
      rating: Rating.fromJson(product["rating"]),
    );
  }
}





// {
// 		"id": 1,
// 		"title": "Fjallraven - Foldsack No. 1 Backpack, Fits 15 Laptops",
// 		"price": 109.95,
// 		"description": "Your perfect pack for everyday use and walks in the forest. Stash your laptop (up to 15 inches) in the padded sleeve, your everyday",
// 		"category": "men's clothing",
// 		"image": "https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg",
// 		"rating": {
// 			"rate": 3.9,
// 			"count": 120
// 		}