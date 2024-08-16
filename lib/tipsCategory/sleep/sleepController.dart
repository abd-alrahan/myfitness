// ignore_for_file: file_names, avoid_print

import 'package:get/get.dart';
import 'package:myfitness/constants/constants.dart';
import 'package:myfitness/models/tipsModel.dart';
import 'package:myfitness/services/showTips_service.dart';

class ShowSleepController extends GetxController {
  var tipsList = <TipsModel>[].obs;
  var isLoading = false.obs;
  var errorMessage = ''.obs;
  var categoryId = catMap['sleep'];

  final ShowTipsService showTipsService = ShowTipsService();

  Future<void> fetchTips(int categoryId) async {
    try {
      print('IN SLEEP CONTROLLER__________');
      isLoading(true);
      errorMessage('');
      var tips = await showTipsService.fetchTips(categoryId);
      print('AFTER FETCH SLEEP CONTROLLER_________');
      tipsList.assignAll(tips);
    } catch (error) {
      errorMessage('Failed to load tips');
    } finally {
      isLoading(false);
    }
  }
}
