import 'dart:typed_data';

import 'package:admainp/network/dio_helper.dart';
import 'package:admainp/shared/components.dart';
import 'package:admainp/view/cubit/states.dart';
import 'package:bloc/bloc.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ManagingRequestsCubit extends Cubit<ManagingRequestsStates> {
  ManagingRequestsCubit() : super(ManagingRequestsInitialState());

  static ManagingRequestsCubit get(context) => BlocProvider.of(context);

  late Uint8List fileBytes;

  TextEditingController nameController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  adminLogin() {}

  Future<void> pickImage() async {
    try {
      final result = await FilePicker.platform.pickFiles(type: FileType.any);
      if (result != null && result.files.isNotEmpty) {
        fileBytes = result.files.first.bytes!;
        final fileName = result.files.first.name;
        print('File selected: $fileName');
      } else {
        print("No file selected or file is empty");
      }
    } catch (e) {
      print("Error picking file: $e");
    }
  }

  addFood(
      {required context,
      required String category,
      required String name,
      required int price,
      required String description}) {
    emit(ManagingRequestsLoadingState());
    DioHelper.addFood(
            name: name,
            price: price,
            description: description,
            category: category,
            image: fileBytes)
        .then((value) {
      print(value.data);
      print(value.statusCode);
      showToast(
          context: context,
          text: value.data['message'],
          color: value.statusCode == 201 ? Colors.green : Colors.red);
      emit(ManagingRequestsSuccessState());
    }).onError((error, stackTrace) {
      print('ADD FOOD ERROR: ${error.toString()}');
      emit(ManagingRequestsErrorState());
    });
  }

  addAccessories(
      {required context,
      required String category,
      required String name,
      required int price,
      required String description}) {
    emit(ManagingRequestsLoadingState());
    DioHelper.addAccessories(
            category: category, name: name, price: price, image: fileBytes)
        .then((value) {
      print(value.data);
      print(value.statusCode);
      showToast(
          context: context,
          text: value.data['message'],
          color: value.statusCode == 201 ? Colors.green : Colors.red);
      emit(ManagingRequestsSuccessState());
    }).onError((error, stackHolder) {
      print('ADD ACCESSORIES ERROR: ${error.toString()}');
      emit(ManagingRequestsErrorState());
    });
  }
}
