import 'package:myfitness/APIs/diohelper.dart';
import 'package:myfitness/services/userLogIn_service.dart';

class UserLogOutService {
  Future<void> userLogOut() async {
    try {
      var response = await DioHelper.userLogOut(token: UserLogInService.getUserToken()!);
      print('IN USER LOG OUT SERVICE________');
      print(response.statusCode);
      print(response.data);
      if (response.statusCode == 200) {
        print('user log out successfully');
      } else {
        throw Exception('Failed to log out user');
      }
    } catch (error) {
      print('Error log out: $error');
      throw Exception('Error log out');
    }
  }
}