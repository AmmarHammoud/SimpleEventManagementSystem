import 'package:flutter/material.dart';
import 'package:http/http.dart';

class add_Location extends StatefulWidget {
  const add_Location({super.key});

  @override
  State<add_Location> createState() => _add_LocationState();
}

class _add_LocationState extends State<add_Location> {
  // Initialize accessory_type with an empty string or a default value
  late String location_type = 'Wedding Halls'; // Could be 'Flowers' or any initial value
  List listLocation = [
    "Wedding Halls", "Hotels",
    "Resturants", "Natural Places", "Centers", "Farms", "Quran"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Add Location'),
      ),
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [
              Colors.deepPurpleAccent,
              Colors.purpleAccent])
        ),
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(), hintText: 'Name'
                ),
              ),
              const SizedBox(height: 30),
              const TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(), hintText: 'cost'
                ),
              ),
              const SizedBox(height: 30),
              DropdownButton(
                hint: const Text('Accessory type'),
                dropdownColor: Colors.purple,
                style: const TextStyle(color: Colors.black),
                icon: const Icon(Icons.arrow_drop_down),
                iconSize: 40,
                isExpanded: true,
                value: location_type,
                onChanged: (newValue) {
                  setState(() {
                    // Fix: Assign the new value, not the string 'newValue'
                    location_type = newValue.toString();
                  });
                },
                items: listLocation .map((valueItem) {
                  return DropdownMenuItem(
                      value: valueItem,
                      child: Text(valueItem)
                  );
                }).toList(),
              ),
              const SizedBox(height: 30),
              const TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(), hintText: 'Phone Number'
                ),
              ),
              const SizedBox(height: 30),
              const TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(), hintText: 'Address'
                ),
              ),
              /////////////////////////////////////
              const SizedBox(height: 30),
              const Text('Add Sub_Location'),
              const Card(

                color:Colors.white12,
             child: Column(
               children: [
                 TextField(
           decoration: InputDecoration(
               border: OutlineInputBorder(), hintText: 'Name'
           ),
                 ),
                 SizedBox(height: 30),
                 TextField(
           decoration: InputDecoration(
               border: OutlineInputBorder(), hintText: 'cost'
           ),
                 ),
                 SizedBox(height: 30),
                 TextField(
           decoration: InputDecoration(
               border: OutlineInputBorder(), hintText: 'Phone Number'
           ),
                 ),
                 SizedBox(height: 30),
                 TextField(
           decoration: InputDecoration(
               border: OutlineInputBorder(), hintText: 'Address'
           ),
                 ),
               ],
             ),
              ),
              const SizedBox(height: 30),
              const Text('Add Sub_Location'),
              const Card(
                color:Colors.white12,


                child: Column(
                  children: [
                    TextField(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(), hintText: 'Name'
                      ),
                    ),
                    SizedBox(height: 30),
                    TextField(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(), hintText: 'cost'
                      ),
                    ),
                    SizedBox(height: 30),
                    TextField(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(), hintText: 'Phone Number'
                      ),
                    ),
                    SizedBox(height: 30),
                    TextField(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(), hintText: 'Address'
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 100,),
              ElevatedButton(onPressed: (){
                //save data to server
              }, child: const Text('Save', style: TextStyle(fontSize: 25),)),
            ],
          ),
        ),
      ),
    );
  }
}
