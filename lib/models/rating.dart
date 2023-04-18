class Rating {
  String rate;
  int count;
  Rating({required this.rate, required this.count});
  factory Rating.fromJson(Map<String, dynamic> rating) {
    return Rating(rate: rating["rate"].toString(), count: rating["count"]);
  }
}
