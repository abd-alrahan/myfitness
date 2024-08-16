// ignore_for_file: file_names

import 'package:get/get.dart';
import 'package:myfitness/models/userLogInModel.dart';
import 'package:myfitness/services/userLogIn_service.dart';

class UserLogInController extends GetxController {
  var email = ''.obs;
  var password = ''.obs;
  var isLoading = false.obs;

  final UserLogInService userLogInService = UserLogInService();

  void userLogIn() async {
    print('IN USER LOGIN CONTROLLER');

    if (email.isNotEmpty && password.isNotEmpty) {
      print(email.value);
      print(password.value);

      isLoading.value = true;
      UserLogInModel userLogInModel =
          UserLogInModel(email: email.value, password: password.value);
      bool success = await userLogInService.userLogIn(userLogInModel);
      print('the succss is $success');
      isLoading.value = false;
      if (success) {
        
        print(email.value);
        print(password.value);
        Get.toNamed('/homepage');
      } else {
        Get.snackbar('Error', 'Login failed. Please try again.');
      }
    } else {
      Get.snackbar('Error', 'Please enter email and password.');
    }
  }
}
