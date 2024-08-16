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

  static Future<Response> addAccessories(
      {required String category,
      required String name,
      required int price,
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
      'accessory_type': category,
      'media': multipartFile
    });

    return await dio.post(
      'storeAccessory',
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

  static Future<Response> getAllFood() async {
    return await dio.get(
      'allFoods',
      options: Options(headers: {
        'Accept': 'application/json',
        'Authorization':
            'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiI5Y2M1OTNmMC1lNDk0LTQ0NmMtYjk1Ny1hMmFiYzA1YmE1ZmYiLCJqdGkiOiJiOWMyN2JiYmYyNzIyMDVlMWM0MTkwYzJiNmU2NGJhM2Y3NjFkOWQ1ZmE2YzM5ZDlmMDM3NDgyODg4ZWMwM2RkN2JjNGE0Y2IwMThiNGUyYiIsImlhdCI6MTcyMzgwODYwOS42OTc5ODcsIm5iZiI6MTcyMzgwODYwOS42OTc5OSwiZXhwIjoxNzU1MzQ0NjA5LjYwNTUyNSwic3ViIjoiNTA1Iiwic2NvcGVzIjpbXX0.p1aZaAZlqrGUgW3O1W-vFS5CgWcosMtqVm1O8C9eGi4UGPD0qFAP4U3XZ_JhA_VbHn01YU4JaOte7hTlWdUFdvnEY1CZlTtvoZvgFdxBaaCH4o-AGhXGX04Gxv_qTjOrygcbRd1Ui_9yhgjnkcW5JiXPltE-tM4xJzg-EHNdnN75uaDkS2P0Lk-y55z6_78O-hGUf6RlcH_CT8aKtFJtKeQ_AUbjlm81lHU0kNzNjdm1o3bte3_veRlp8s7q0ajcz3PCjAre7kc873fsYFHc8KmrL7DWr5CENAmUAJ9ehT71o5aJ7c-YTXgMpchnOBtLEhFBBED2oIAAClI8LPeMDh11gUOFxTTXxHe-W0cp9U4CmZOGB0bKcAppWgU8-0nENLPrV0oCzvgJsyx_frLTFD_ji3nOxmENFUDqo5JKRxgeHQed8B0ZGBuApitzD3oiyOwbjiclUKhinFeGkdF1C7Vyx8AjgoAm62BNqAz9ZV8AHbi6utFmr793WDNCf1c_udX7ibOYf9fut96J_Q2Y_x91ScYCsW2kzrdUW8zf-o1LhE5Gl9UuJc0yVHpVH1GLcoO2sI1rFgQiFWJknHSKTPKc0nb9DX0VWoj0NuT5P8vFtT7mhhrUAQlLLLhyTHcSxeOY9kM_Rtf8GBwN-XVDNsH4ejICiXzlz5RcYOlezx8'
      }),
    );
  }

  static Future<Response> deleteFood({required int id}) async {
    return await dio.delete(
      'deleteFood/$id',
      //data: {'id': id},
      options: Options(headers: {
        'Accept': 'application/json',
        'Authorization':
            'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiI5Y2M1OTNmMC1lNDk0LTQ0NmMtYjk1Ny1hMmFiYzA1YmE1ZmYiLCJqdGkiOiJiOWMyN2JiYmYyNzIyMDVlMWM0MTkwYzJiNmU2NGJhM2Y3NjFkOWQ1ZmE2YzM5ZDlmMDM3NDgyODg4ZWMwM2RkN2JjNGE0Y2IwMThiNGUyYiIsImlhdCI6MTcyMzgwODYwOS42OTc5ODcsIm5iZiI6MTcyMzgwODYwOS42OTc5OSwiZXhwIjoxNzU1MzQ0NjA5LjYwNTUyNSwic3ViIjoiNTA1Iiwic2NvcGVzIjpbXX0.p1aZaAZlqrGUgW3O1W-vFS5CgWcosMtqVm1O8C9eGi4UGPD0qFAP4U3XZ_JhA_VbHn01YU4JaOte7hTlWdUFdvnEY1CZlTtvoZvgFdxBaaCH4o-AGhXGX04Gxv_qTjOrygcbRd1Ui_9yhgjnkcW5JiXPltE-tM4xJzg-EHNdnN75uaDkS2P0Lk-y55z6_78O-hGUf6RlcH_CT8aKtFJtKeQ_AUbjlm81lHU0kNzNjdm1o3bte3_veRlp8s7q0ajcz3PCjAre7kc873fsYFHc8KmrL7DWr5CENAmUAJ9ehT71o5aJ7c-YTXgMpchnOBtLEhFBBED2oIAAClI8LPeMDh11gUOFxTTXxHe-W0cp9U4CmZOGB0bKcAppWgU8-0nENLPrV0oCzvgJsyx_frLTFD_ji3nOxmENFUDqo5JKRxgeHQed8B0ZGBuApitzD3oiyOwbjiclUKhinFeGkdF1C7Vyx8AjgoAm62BNqAz9ZV8AHbi6utFmr793WDNCf1c_udX7ibOYf9fut96J_Q2Y_x91ScYCsW2kzrdUW8zf-o1LhE5Gl9UuJc0yVHpVH1GLcoO2sI1rFgQiFWJknHSKTPKc0nb9DX0VWoj0NuT5P8vFtT7mhhrUAQlLLLhyTHcSxeOY9kM_Rtf8GBwN-XVDNsH4ejICiXzlz5RcYOlezx8'
      }),
    );
  }
}
