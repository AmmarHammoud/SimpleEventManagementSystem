import 'package:admainp/helper/api.dart';
import 'package:admainp/model/accessories_madel.dart';

class AddAccessory{
  Future<AccessoriesModel> addAccessory( {required String name,required int price,required String accessory_type,String? media}) async{
    Map<String,dynamic>data= await Api().post(url: 'puturl access', body:{
         'name':name,
        'price':price,
        'accessory_type':accessory_type,
'media':media,}

        );
    return AccessoriesModel.fromJson(data);
  }
}