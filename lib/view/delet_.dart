import 'dart:convert';

import 'package:admainp/view/cubit/cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import '../model/food_model.dart';
import 'cubit/states.dart';

class delet_food extends StatefulWidget {
  const delet_food({super.key, required this.name});

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
    final response =
        await http.get(Uri.parse('http://127.0.0.1:8000/api/allFoods'));

    if (response.statusCode == 200) {
      final List<dynamic> jsonData = json.decode(response.body);
      setState(() {
        posts =
            jsonData.map((postJson) => PostFood.fromJson(postJson)).toList();
        print('its done bbbbbbbbbbbbbb');
      });
    } else {
      // Handle errors (e.g., show an error message)
      print('Error fetching data: ${response.statusCode}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ManagingRequestsCubit()..getAllFood(),
      child: BlocConsumer<ManagingRequestsCubit, ManagingRequestsStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var deleteFoodObject = ManagingRequestsCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              centerTitle: true,
              backgroundColor: Colors.purple,
              elevation: 0,
              title: Text(
                'Food',
                style: TextStyle(color: Colors.black),
              ),
            ),
            body: ListView.builder(
              itemCount: deleteFoodObject.allFood.length,
              itemBuilder: (context, index) {
                //final post = posts[index];
                return TextButton(
                  child: Text(deleteFoodObject.allFood[index].name),
                  onPressed: () {
                    deleteFoodObject.deleteFood(
                        context: context,
                        id: deleteFoodObject.allFood[index].id);
                  },
                );
              },
            ),
          );
        },
      ),
    );
  }
}
