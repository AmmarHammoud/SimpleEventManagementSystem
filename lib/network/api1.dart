import 'dart:convert';

import 'package:http/http.dart' as http;

import '../model/food_model.dart';
class API{
  static const String _BASE_URL='http://localhost:8888';
  static Future<http.Response> creatFood(Food food) async{
 final http.Response response = await http.post('$_BASE_URL/foodItem' as Uri, headers: <String,String>{
   'Content-Type':'application/json;charset=UTF-8'
 },
 body: jsonEncode(food.tojson()));//her mmmmmmmmmmmmmmmmmmmmmmmmm
    if(response.statusCode==200){

      print(response.body);
    }
    else{
      print('error');
    }
    return response;
  }

}
