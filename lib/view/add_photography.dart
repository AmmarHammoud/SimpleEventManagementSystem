import 'package:admainp/network/api1.dart';
import 'package:flutter/material.dart';
import '../model/food_model.dart';
class add_photography extends StatefulWidget {
  const add_photography({super.key});

  @override
  State<add_photography> createState() => _Add_new_elementState();
}

class _Add_new_elementState extends State<add_photography> {
  late String photography_Name;
  late String name;
  late int cost;
  late String address;
  late int phone_number;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('photography'),),
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
              Colors.deepPurpleAccent,
              Colors.purpleAccent])
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                TextField(
                  decoration: InputDecoration(labelText: 'name'),
                ),
                SizedBox(height: 30,),
                TextField(
                  decoration: InputDecoration(labelText: 'cost'),
                ),
                SizedBox(height: 30,),
                TextField(
                  decoration: InputDecoration(labelText: 'address'),
                ),
                SizedBox(height: 30,),
                TextField(
                  decoration: InputDecoration(labelText: 'phone_number'),
                ),
                SizedBox(height: 30,),
                TextButton(
                    onPressed: () {  }, child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Add Image' ,style: TextStyle(fontSize: 20),),
                    Icon(Icons.photo_camera_back)
                  ],
                )
                ),
                SizedBox(height: 100,),
                ElevatedButton(onPressed: (){
                  API.creatFood(photography_Name as Food); //save data to server
                }, child: Text('Save', style: TextStyle(fontSize: 25),))
              ],
            ),
          ),
        ),
      ),
    );
  }
}

