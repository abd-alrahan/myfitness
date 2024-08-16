import 'package:dio/dio.dart';
import 'package:myfitness/APIs/diohelper.dart';
import 'package:myfitness/models/dietsModel.dart';

class ShowExerciseService {
  static Future<List<DeitsModel>> getDietsByDayId(String categoryName) async {
    try {
      print('IN SHOW EXERCISE SERVICE__________');
      Response response = await DioHelper.showExercise(categoryName: categoryName);
      print('after diohelper');
      print(response.data);
      print(response.statusCode);
      if (response.statusCode == 200) {
        print('in service condition');
        List<dynamic> data = response.data['data'];
        print('stored in list successfully');
        return data.map((item) => DeitsModel.fromJson(item)).toList();
      } else {
        throw Exception('The "diets" key is missing or not a list');
      }
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
