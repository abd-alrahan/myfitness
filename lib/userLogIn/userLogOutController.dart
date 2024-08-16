// ignore_for_file: file_names

import 'package:get/get.dart';
import 'package:myfitness/services/userLogOut_service.dart';

class UserLogOutController extends GetxController {
  var isLoading = false.obs;
  // var loadingUsers = <int, bool>{}.obs;
  var errorMessage = ''.obs;

  final UserLogOutService userLogOutService = UserLogOutService();

  Future<void> userLogOut() async {
    try {
      await userLogOutService.userLogOut();
      Get.snackbar('Success', 'User log out successfully');
      Get.toNamed('/login');
    } catch (e) {
      errorMessage(e.toString());
      Get.snackbar('Error', 'Failed to delete user');
    }
  }
}
