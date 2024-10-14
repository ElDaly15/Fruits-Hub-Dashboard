class ReviewEntity {
  final String name;
  final String image;
  final num rate;
  final String review;
  final String date;

  ReviewEntity(
      {required this.name,
      required this.image,
      required this.rate,
      required this.review,
      required this.date});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['image'] = image;
    data['rate'] = rate;
    data['review'] = review;
    data['date'] = date;
    return data;
  }
}
