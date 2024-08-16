// ignore_for_file: non_constant_identifier_names, avoid_print, deprecated_member_use

import 'package:myfitness/APIs/diohelper.dart';
import 'package:myfitness/models/tipsModel.dart';

class ShowTipsService {
  Future<List<TipsModel>> fetchTips(int categoryId) async {
    try {
      var response = await DioHelper.showtips(categoryId);
      print('IN SHOW TIPS SERVICE________');
      print(response.statusCode);
      print(response.data);
      if (response.statusCode == 200) {
        print('OK_____________');
        List<dynamic> data = response.data['data'];
        return data.map((item) => TipsModel.fromJson(item)).toList();
      } else {
        print('NO____________');
        throw Exception('Failed to load tips');
      }
    } catch (error) {
      print('Error fetching tips: $error');
      throw Exception('Error fetching tips');
    }
  }
}
