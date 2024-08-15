import 'package:admainp/network/api1.dart';
import 'package:admainp/view/add.dart';
import 'package:admainp/view/cubit/cubit.dart';
import 'package:admainp/view/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../model/food_model.dart';

class Add_new_element extends StatefulWidget {
  const Add_new_element({super.key});

  @override
  State<Add_new_element> createState() => _Add_new_elementState();
}

class _Add_new_elementState extends State<Add_new_element> {
  late String food_type = 'Dessert'; // Could be 'Flowers' or any initial value
  List listFood = ["Dessert", "appetizers", "Eastern sweets", "drinks"];
  late String foodName;
  late String name;
  late int price;
  late String description;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ManagingRequestsCubit(),
      child: BlocConsumer<ManagingRequestsCubit, ManagingRequestsStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var addFoodObject = ManagingRequestsCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              title: const Text(
                'Food',
              ),
            ),
            body: Container(
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                      colors: [Colors.deepPurpleAccent, Colors.purpleAccent])),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    children: [
                      TextField(
                        controller: addFoodObject.nameController,
                        decoration: const InputDecoration(
                          labelText: 'name',
                        ),
                      ),
                      const SizedBox(height: 30),
                      DropdownButton(
                        hint: const Text('.', style: TextStyle(fontSize: 40)),
                        dropdownColor: Colors.purple,
                        style: const TextStyle(color: Colors.black),
                        icon: const Icon(Icons.arrow_drop_down),
                        iconSize: 40,
                        isExpanded: true,
                        value: food_type,
                        onChanged: (newValue) {
                          setState(() {
                            // Fix: Assign the new value, not the string 'newValue'
                            food_type = newValue.toString();
                          });
                        },
                        items: listFood.map((valueItem) {
                          return DropdownMenuItem(
                              value: valueItem, child: Text(valueItem));
                        }).toList(),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      TextField(
                        controller: addFoodObject.priceController,
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                          labelText: 'price',
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      TextField(
                        controller: addFoodObject.descriptionController,
                        decoration:
                            const InputDecoration(labelText: 'description'),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      TextButton(
                          onPressed: () {
                            addFoodObject.pickImage();
                          },
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Add Image',
                                style: TextStyle(fontSize: 20),
                              ),
                              Icon(Icons.photo_camera_back)
                            ],
                          )),
                      const SizedBox(
                        height: 50,
                      ),
                      ElevatedButton(
                          onPressed: () {
                            //API.creatFood(foodName as Food); //save data to server
                            addFoodObject.addFood(
                              context: context,
                                category: food_type,
                                name: addFoodObject.nameController.text,
                                price: int.parse(
                                    addFoodObject.priceController.text),
                                description:
                                    addFoodObject.descriptionController.text);
                          },
                          child: const Text(
                            'Save',
                            style: TextStyle(fontSize: 25),
                          ))
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
