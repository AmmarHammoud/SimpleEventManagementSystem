import 'package:admainp/network/api1.dart';

class Food {
  int id;
  String name;
  int price;
  String description;

  Food({
    required this.id,
    required this.name,
    required this.price,
    required this.description,
  });

  Map<String, dynamic> tojson() =>
      {'id': id, 'name': name, 'price': price, 'description': description};
}

class PostFood {
  final int id;
  final String name;
  final Media media;

  PostFood({required this.id, required this.name, required this.media});

  factory PostFood.fromJson(Map<String, dynamic> json) {
    return PostFood(
      id: json['id'],
      name: json['name'],
      media: json['imageUrl'], // Adjust this to match your API's key
    );
  }
}

class Media {
  late int id;
  late String media_url;

  //Media({required this.id, required this.media_url});

  Media.fromJson(Map<String, dynamic> json) {
     //Media(id: jsonData['id'], media_url: jsonData['media_url']);
    id = json['id'];
    media_url = json['media_url'];
  }

  get imageUrl => null;
}

class MyFoodModel {
  late int id;
  late String name;
  late int price;
  late String description;
  late Media media;

  MyFoodModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    price = json['price'];
    description = json['description'];
    media = Media.fromJson(json['media']);
  }
}
