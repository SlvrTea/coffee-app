
class ItemData {
  ItemData({
    required this.price,
    required this.score,
    required this.name,
    required this.subname,
    required this.type,
    required this.description,
    required this.imagePath
  });

  ItemData.sample({
    this.imagePath = 'https://neurosciencenews.com/files/2023/06/coffee-brain-caffeine-neuroscincces.jpg',
    this.name = 'Cappuccino',
    this.score = 4.8,
    this.price = 4.99,
    this.type = 'Cappuccino',
    this.description = 'Some description jaskcankjfkjsdkjfaksfkjaskjfnksanfknsajfnkasnkfsjdfnskfhkjsfhsdkfskhfjksdfhshfksfjhskfhkdshfkshfks',
    this.subname = 'with Chocolate'
  });

  final String imagePath;
  final double price;
  final double score;
  final String name;
  final String subname;
  final String description;
  final String type;
}