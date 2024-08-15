

import 'package:admainp/view/Planner%20Request.dart';
import 'package:admainp/view/category.dart';
import 'package:admainp/view/category1.dart';
import 'package:flutter/material.dart';

class add extends StatelessWidget {
  const add({super.key});

  @override
  Widget build(BuildContext context) {

    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => const Category()));
          }, child: const Text('Add New Element', style: TextStyle(fontSize: 25),)),
          const SizedBox(height: 30,),
          ElevatedButton(onPressed: (){

            Navigator.push(context, MaterialPageRoute(builder: (context) => const Category1()));
          }, child: const Text('Delet Element',style: TextStyle(fontSize: 25),)),
          const SizedBox(height: 30,),
          ElevatedButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => const Planner_Request()));
          }, child: const Text('Planner Request',style: TextStyle(fontSize: 25),)),
          const SizedBox(height: 30,),
          ElevatedButton(onPressed: (){

          }, child: const Text('Users',style: TextStyle(fontSize: 25),)),


        ],
      ),
    );
  }
}
