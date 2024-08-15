class AccessoriesModel{
  final int id ;
  final int accessory_type_id;
  final int media_id;
  final String name;
  final int price;
  final Media media;
  final AccessoryType accessoryType;


  AccessoriesModel({required this.id,
    required this.accessory_type_id,
    required this.media_id,
    required this.name,
    required this.price,
    required this.media,
    required this.accessoryType
  });
  factory AccessoriesModel.fromJson(jsonData){
    return AccessoriesModel(id: jsonData['id'],
        accessory_type_id: jsonData['accessory_type_id'],
        media_id: jsonData['media_id'],
        name:jsonData['name'],
        price: jsonData['price'],
        media: Media.fromJson(jsonData['media']),
        accessoryType: AccessoryType.fromJson(jsonData['accessoryType'])

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
}
class AccessoryType{
  final  int id;
  final String type;
  AccessoryType({required this.id,required this.type}) ;
  factory AccessoryType.fromJson(jsonData){
    return  AccessoryType(id: jsonData['id'], type: jsonData['media_url']);
  }

}