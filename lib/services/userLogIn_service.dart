// ignore_for_file: depend_on_referenced_packages, avoid_print

import 'package:myfitness/APIs/diohelper.dart';
import 'package:myfitness/models/userLogInModel.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserLogInService {
  static late SharedPreferences sharedPreferences;

  static init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  Future<bool> userLogIn(UserLogInModel userLogInModel) async {
    print('IN USER LOGIN SERVICE');
    var response = await DioHelper.userLogIn(
        email: userLogInModel.email, password: userLogInModel.password);

    print(response.statusCode);
    print(response.data);
    var response1 = response.data['data'];

    putUser(userToken: response1['token']);
    print(response1['token']);

    return response1['name'] != null;
  }

  Future<bool> putUser({required String userToken}) async {
    bool putUserToken = await sharedPreferences.setString('token', userToken);
    print(userToken);
    return putUserToken;
  }

  static String? getUserToken(){
    return sharedPreferences.getString('token');
  }
}



// import 'package:shared_preferences/shared_preferences.dart';

// class CashHelper {
//   static late SharedPreferences sharedPreferences;

//   static init() async {
//     sharedPreferences = await SharedPreferences.getInstance();
//   }

//   static Future<bool> putString({required key, required value})async{
//     return await sharedPreferences.setString(key, value);
//   }

//   static String? getString({required String key}) {
//     return sharedPreferences.getString(key);
//   }

//   static Future<bool> putUser({required String userToken})async{
//     bool putUserToken = await sharedPreferences.setString('token', userToken);
//     return putUserToken;
//   }
//   static Future<bool> putUserEmail({required String email}) async{
//     return await sharedPreferences.setString('email', email);
//   }

//   static Future<bool> putUserPhone({required String mobile}) async{
//     return await sharedPreferences.setString('mobile', mobile);
//   }

//   static String? getUserToken(){
//     return sharedPreferences.getString('token');
//   }

//   static String? getUserPhone() {
//     return sharedPreferences.getString('mobile');
//   }
//   static bool isAdmin(){
//     //print('in isAdmin function: ${getUserPhone()}');
//     return getUserPhone() == '0991996920';
//   }
//   static Future<bool> putUserId({required int id}) async{
//     return await sharedPreferences.setInt('id', id);
//   }
//   static int? getUserId(){
//     return sharedPreferences.getInt('id');
//   }
//   static logoutUser(){
//     sharedPreferences.clear();
//   }
// }