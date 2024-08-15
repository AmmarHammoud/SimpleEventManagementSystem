import 'package:admainp/view/add_Accessories.dart';
import 'package:admainp/view/add_Location.dart';
import 'package:admainp/view/add_food.dart';
import 'package:admainp/view/add_photography.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Category extends StatelessWidget {
  const Category({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add New Element'),
      ),
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                colors: [Colors.deepPurpleAccent, Colors.purpleAccent])),
        child: SizedBox(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const add_Location()));
                  },
                  child: const Text(
                    'Location',
                    style: TextStyle(fontSize: 25),
                  )),
              const SizedBox(
                height: 40,
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Add_new_element()));
                  },
                  child: const Text(
                    'Food',
                    style: TextStyle(fontSize: 25),
                  )),
              const SizedBox(
                height: 40,
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => add_photography()));
                  },
                  child: const Text(
                    'photography',
                    style: TextStyle(fontSize: 25),
                  )),
              const SizedBox(
                height: 40,
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const add_Accessories()));
                  },
                  child: const Text(
                    'Accessories',
                    style: TextStyle(fontSize: 25),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
