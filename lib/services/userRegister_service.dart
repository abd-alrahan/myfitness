import 'package:myfitness/APIs/diohelper.dart';
import 'package:myfitness/models/userRegisterModel.dart';

class UserRegisterService {
  Future<bool> userRegister(UserRegisterModel userRegisterModel) async {
    try {
      print('IN USER REGISTER SERVICE');
      var response = await DioHelper.userRegister(
        name: userRegisterModel.name,
        email: userRegisterModel.email,
        password: userRegisterModel.password,
        gender: userRegisterModel.gender,
        age: userRegisterModel.age,
        tall: userRegisterModel.tall,
        weight: userRegisterModel.weight
      );
      print(response.statusCode);
      print(response.data);
      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (error) {
      print(error.toString());
      return false;
    }
  }
}
