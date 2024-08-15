import 'package:admainp/network/api1.dart';
class  Food{
  int id;
  String name;
  int price;
  String description;
  Food({required this.id,required this.name,required this.price,required this.description, });

  Map<String,dynamic> tojson() => {'id':id , 'name':name,'price':price,'description':description};

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



class Media{
  final  int id;
  final String media_url;
  Media({required this.id,required this.media_url}) ;
  factory Media.fromJson(jsonData){
    return  Media(id: jsonData['id'], media_url: jsonData['media_url']);
  }

  get imageUrl => null;
}