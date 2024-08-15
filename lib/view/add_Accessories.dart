import 'package:admainp/view/cubit/cubit.dart';
import 'package:admainp/view/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart';

class add_Accessories extends StatefulWidget {
  const add_Accessories({super.key});

  @override
  State<add_Accessories> createState() => _add_AccessoriesState();
}

class _add_AccessoriesState extends State<add_Accessories> {
  // Initialize accessory_type with an empty string or a default value
  late String accessory_type =
      'Flowers'; // Could be 'Flowers' or any initial value
  List listAccessories = [
    "Flowers",
    "Baloones",
    "Lights",
    "Cars",
    "Show Band",
    "Music and Chanting",
    "Quran"
  ];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ManagingRequestsCubit(),
      child: BlocConsumer<ManagingRequestsCubit, ManagingRequestsStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var addAccessoriesObject = ManagingRequestsCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: Text('Add Accessories'),
            ),
            body: Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [Colors.deepPurpleAccent, Colors.purpleAccent])),
              padding: EdgeInsets.all(20),
              child: Column(
                children: [
                  TextField(
                    controller: addAccessoriesObject.nameController,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(), hintText: 'Name'),
                  ),
                  SizedBox(height: 30),
                  TextField(
                    controller: addAccessoriesObject.priceController,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(), hintText: 'price'),
                  ),
                  SizedBox(height: 30),
                  DropdownButton(
                    hint: Text('Accessory type'),
                    dropdownColor: Colors.purple,
                    style: TextStyle(color: Colors.black),
                    icon: Icon(Icons.arrow_drop_down),
                    iconSize: 40,
                    isExpanded: true,
                    value: accessory_type,
                    onChanged: (newValue) {
                      setState(() {
                        // Fix: Assign the new value, not the string 'newValue'
                        accessory_type = newValue.toString();
                      });
                    },
                    items: listAccessories.map((valueItem) {
                      return DropdownMenuItem(
                          value: valueItem, child: Text(valueItem));
                    }).toList(),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  TextButton(
                      onPressed: () {
                        addAccessoriesObject.pickImage();
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Add Image',
                            style: TextStyle(fontSize: 20),
                          ),
                          Icon(Icons.photo_camera_back)
                        ],
                      )),
                  SizedBox(
                    height: 100,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        addAccessoriesObject.addAccessories(
                            context: context,
                            category: accessory_type,
                            name: addAccessoriesObject.nameController.text,
                            price: int.parse(
                                addAccessoriesObject.priceController.text),
                            description: addAccessoriesObject
                                .descriptionController.text);
                      },
                      child: Text(
                        'Save',
                        style: TextStyle(fontSize: 25),
                      ))
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
