

import 'package:admainp/view/add_Accessories.dart';
import 'package:admainp/view/add_Location.dart';
import 'package:admainp/view/add_food.dart';
import 'package:admainp/view/add_photography.dart';
import 'package:admainp/view/delet_.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Category1 extends StatelessWidget {
  const Category1({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: Text('Add New Element'),),
      body: Container(

        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
              Colors.deepPurpleAccent,
              Colors.purpleAccent])
        ),
        child: SizedBox(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(onPressed: (){

              }, child: Text('Location', style: TextStyle(fontSize: 25),)),
              SizedBox(height: 40,),
              ElevatedButton(onPressed: (){

                Navigator.push(context, MaterialPageRoute(builder: (context) => delet_food(name: 'name',)));
              }, child: Text('Food',style: TextStyle(fontSize: 25),)),
              SizedBox(height: 40,),
              ElevatedButton(onPressed: (){

              }, child: Text('photography',style: TextStyle(fontSize: 25),)),
              SizedBox(height: 40,),

              ElevatedButton(onPressed: (){

              }, child: Text('Accessories', style: TextStyle(fontSize: 25),)),

            ],
          ),
        ),
      ),
    );
  }
}
