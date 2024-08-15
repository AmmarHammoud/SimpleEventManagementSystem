import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../model/food_model.dart';

class delet_food extends StatefulWidget {
  const delet_food({super.key,required this.name});
  final String name;
  @override
  State<delet_food> createState() => _delet_foodState();
}

class _delet_foodState extends State<delet_food> {
  List<PostFood> posts = [];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    final response = await http.get(Uri.parse('http://127.0.0.1:8000/api/allFoods'));

    if (response.statusCode == 200) {
      final List<dynamic> jsonData = json.decode(response.body);
      setState(() {
        posts = jsonData.map((postJson) => PostFood.fromJson(postJson)).toList();
        print('its done bbbbbbbbbbbbbb');
      });
    } else {
      // Handle errors (e.g., show an error message)
      print('Error fetching data: ${response.statusCode}');
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.purple,
        elevation: 0,
        title: Text('Food',style: TextStyle(color: Colors.black),

        ),

      ),
      body: ListView.builder(
        itemCount: posts.length,
        itemBuilder: (context, index) {
          final post = posts[index];
          return ListTile(
            leading: post.media?.imageUrl != null
                ? Image.network(post.media!.imageUrl!)
                : Placeholder(), // Or a custom placeholder image



            title: Text(post.name),
          );
        },
      ),
    );

  }
}
