import 'dart:io';
import 'dart:typed_data';

import 'package:admainp/view/add_Accessories.dart';
import 'package:dio/dio.dart';

/*
Stack overflow:
when running on web
const String proxyUrl = 'https://cors-anywhere.herokuapp.com/';
const String baseUrl = proxyUrl + "BASE_URL.com";
* */
//192.168.52.17 mobile
//10.0.2.2 emulator
class DioHelper {
  static late Dio dio;

  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: 'http://localhost:8000/api/',
        receiveDataWhenStatusError: true,
      ),
    );
  }

  static Future<Response> adminLogin() async {
    return await dio.post('login');
  }

  static Future<Response> addFood(
      {required String category,
      required String name,
      required int price,
      required String description,
      required dynamic image}) async {
    MultipartFile multipartFile;

    if (image is File) {
      print('from file before');
      multipartFile = await MultipartFile.fromFile(image.path,
          filename: image.path.split('/').last);
      print('from file after');
    } else if (image is Uint8List) {
      print('from bytes before');
      multipartFile =
          MultipartFile.fromBytes(image, filename: 'upload_image.jpg');
      print('from bytes after');
    } else {
      throw Exception('Invalid image type');
    }
    print(multipartFile.filename.toString());

    FormData formData = FormData.fromMap({
      'name': name,
      'price': price,
      'description': description,
      'food_category': category,
      'media': multipartFile
    });

    return await dio.post(
      'storeFood',
      //     data: {
      //   'name': name,
      //   'price': price,
      //   'description': description,
      //   'category': category,
      //   'media': multipartFile
      // },
      data: formData,
      options: Options(
        headers: {
          'Accept': 'application/json',
          'Authorization':
              'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiI5Y2M1OTNmMC1lNDk0LTQ0NmMtYjk1Ny1hMmFiYzA1YmE1ZmYiLCJqdGkiOiJiNGZjY2VlZGY2Yzk1NjQyNjgxY2I3NzE2OTQ3YTEyMzdjMWExZTY1ZTk2N2U5ZDk2NWJjYzFiNmJjMTg0NTJmNjBkNWRhNGU3M2YzMDM0ZiIsImlhdCI6MTcyMzcyNDU0My4zNjAyNDYsIm5iZiI6MTcyMzcyNDU0My4zNjAyNDgsImV4cCI6MTc1NTI2MDU0My4zNTI3NjMsInN1YiI6IjUwNSIsInNjb3BlcyI6W119.gtqSuYyeq7PMVpEG0OTttZsFitqK4xff8LUER1nZj3lw92M7rgH0ESHNUGDvJfThIMKM2F2t0usbOxk9aPsi3Q7aAi-zHiUzxEkDmcgz6XPKa7gQiADEo030Dl1zCAexXfZxNngxHjSAOvTAZL4F6W2LH_ujHFMJeuO_xAK6vTEIGfElZ6p5rF9P1XGcyu0wiiKgwBHgvsF3TaGEKVPgCzkvUBr0mYeAUzTHgv6Z49DJP3QmsC32ug0WJu-haVtZqLcOlt1LM7NRj4msMMmy3g5RfQtQwMjbjekLqZBDXo-J-T8E_XcXIuFpjY5-mJgfJM08kfXTNurXg8VBRvoEv53tFgbFBo4SM-0QUKHQOqWYo2bgzgyf6sxrlS9M7l5lzTqWthv6x2sWwtBJlQOiEKbzCKf32i7ICSA54kMDMv4enNGs-ZBgd3ZjDiSVzqzAlvscNqUNHEDG8zAu1yPT4mGlmVFVdRscEmEa4KuWewdsC2AOYrmEtMRHhAg0Wb8MqM4K0_Eq-9ZR5aR9j3ITkxZ2xMeRTyHygrnqJV-HSY_EGO9gOL2oFD09hXETJ2QZHU8PJ5-mi6qlKgZ_nF7UBP-_xrK8tz-0C7PljylXOYsuT7np8Eh6NMC-WE06Cs0sL23ekObHObDRX8MxmS72ydvtkr79XRBZaJk1ZL--fjo'
        },
        followRedirects: true,
        validateStatus: (status) {
          print('The status is $status');
          return status! < 500;
        },
      ),
    );
  }

  static Future<Response> add_deits({
    required String time,
    required int day_id,
    required String description,
    required dynamic image,
  }) async {
    try {
      MultipartFile multipartFile;

      if (image is File) {
        multipartFile = await MultipartFile.fromFile(image.path,
            filename: image.path.split('/').last);
      } else if (image is Uint8List) {
        multipartFile =
            MultipartFile.fromBytes(image, filename: 'upload_image.jpg');
      } else {
        throw Exception('Invalid image type');
      }

      // Create form data
      FormData formData = FormData.fromMap({
        'time': time,
        'day_id': day_id,
        'description': description,
        'image': multipartFile,
      });

      print('Form Data: ${formData.fields}, ${formData.files}');

      // Send the POST request
      Response response = await dio.post(
        'addrecipe', // Replace with your actual backend URL
        data: formData,
        options: Options(
          headers: {'Accept': 'application/json'},
          followRedirects: true,
          validateStatus: (status) {
            print('The status is $status');
            return status! < 500;
          },
        ),
      );

      print('Response: ${response.data}');
      return response;
    } catch (e) {
      if (e is DioException) {
        print('DioException: ${e.response?.data}');
      } else {
        print('Error uploading image: $e');
      }
      rethrow;
    }
  }
}
