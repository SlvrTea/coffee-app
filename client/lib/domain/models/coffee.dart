
class Coffee {
  final String imageUrl;
  final double price;
  final double score;
  final String name;
  final String subname;
  final String description;

  Coffee({
    required this.imageUrl,
    required this.price,
    required this.name,
    required this.subname,
    required this.description,
    required this.score
  });

  factory Coffee.fromMap(Map<String, dynamic> map) {
    return Coffee(
      imageUrl: map['img'],
      price: map['price'],
      score: map['score'],
      name: map['name'],
      subname: map['subname'],
      description: map['description']
    );
  }
}