import 'package:get/get.dart';
import 'package:myfitness/models/userRegisterModel.dart';
import 'package:myfitness/services/userRegister_service.dart';

class UserRegisterController extends GetxController {
  var name = ''.obs;
  var email = ''.obs;
  var password = ''.obs;
  var gender = ''.obs;
  var age = 0.obs;
  var tall = 0.obs;
  var weight = 0.obs;
  var isLoading = false.obs;

  final UserRegisterService userRegisterService = UserRegisterService();

  void userRegister() async {
    print('IN USER REGISTER CONTROLLER');
    if (name.value.isNotEmpty &&
        email.value.isNotEmpty &&
        password.value.isNotEmpty &&
        gender.value.isNotEmpty &&
        age.value.isFinite &&
        tall.value.isFinite &&
        weight.value.isFinite) {

      print(name.value);
      print(email.value);
      print(password.value);
      print(gender.value);
      print(age.value);
      print(tall.value);
      print(weight.value);
      isLoading.value = true;

      UserRegisterModel userRegisterModel = UserRegisterModel(
          name: name.value,
          email: email.value,
          password: password.value,
          gender: gender.value,
          age: age.value,
          tall: tall.value,
          weight: weight.value,);

      bool success = await userRegisterService.userRegister(userRegisterModel);
      isLoading.value = false;

      if (success) {
        Get.snackbar('Success', 'User registered successfully!');
        print(name.value);
        print(email.value);
        print(password.value);
        print(gender.value);
        print(age.value);
        print(tall.value);
        print(weight.value);
      } else {
        Get.snackbar('Error', 'Failed to register user!');
      }
    }
  }
}
