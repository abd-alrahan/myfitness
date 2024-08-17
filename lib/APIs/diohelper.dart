import 'package:dio/dio.dart';

class DioHelper {
  static late Dio dio;

  static init() {
    dio = Dio(BaseOptions(
      baseUrl: 'http://192.168.1.4:8000/api/',
      receiveDataWhenStatusError: true,
    ));
  }

  static Future<Response> userRegister(
      {required String name,
      required String email,
      required String password,
      required String gender,
      required int age,
      required int tall,
      required int weight}) async {
    return await dio.post(
      'user/register',
      queryParameters: {
        'name': name,
        'email': email,
        'password': password,
        'gender': gender,
        'age': age,
        'tall': tall,
        'weight': weight
      },
      options: Options(
        headers: {'Accept': 'application/json'},
        followRedirects: false,
        validateStatus: (status) {
          return status! < 500;
        },
      ),
    );
  }

  static Future<Response> userLogIn(
      {required String email, required String password}) async {
    return await dio.post('user/login',
        data: {'email': email, 'password': password},
        options: Options(
            headers: {'Accept': 'application/json'},
            followRedirects: false,
            validateStatus: (status) {
              return true;
            }));
  }

  static Future<Response> userLogOut({required String token}) async {
    return await dio.post('user/logout',
        options: Options(
            headers: {
              'Accept': 'application/json',
              'Authorization': 'Bearer $token'
            },
            followRedirects: false,
            validateStatus: (status) {
              return true;
            }));
  }

  static Future<Response> postSearch({required String description}) async {
    return await dio.post('searchrecipe',
        queryParameters: {'description': description},
        options: Options(
            headers: {'Accept': 'application/json'},
            followRedirects: false,
            validateStatus: (status) {
              return true;
            }));
  }

  // static Future<List<TipsModel>> postSearch1() {
  //   Future<Response> abd = postSearch(description: " ");
  //   List<TipsModel> a = TipsModel.fromJson(abd as Map<String, dynamic>);
  // }

  static Future<Response> showtips(int categoryId) async {
    return await dio.get(
      'showadvice',
      queryParameters: {'category_id': categoryId},
      options: Options(
        headers: {'Accept': 'application/json'},
        followRedirects: false,
        validateStatus: (status) {
          return true;
        },
      ),
    );
  }

  static Future<Response> showDiets({required int dayId}) async {
    try {
      Response response = await dio.get(
        'showrecipe',
        queryParameters: {'day_id': dayId},
        options: Options(
          headers: {'Accept': 'application/json'},
        ),
      );
      return response;
    } catch (e) {
      if (e is DioException) {
        print('DioException: ${e.response?.data}');
      } else {
        print('Error fetching diets: $e');
      }
      rethrow;
    }
  }

  static Future<Response> showExercise({required String categoryName}) async {
    try {
      Response response = await dio.get(
        'gatcategory',
        queryParameters: {'category_name': categoryName},
        options: Options(
          headers: {'Accept': 'application/json'},
        ),
      );
      return response;
    } catch (e) {
      if (e is DioException) {
        print('DioException: ${e.response?.data}');
      } else {
        print('Error fetching diets: $e');
      }
      rethrow;
    }
  }
}
