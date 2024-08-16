import 'package:get/get.dart';
import 'package:myfitness/models/dietsModel.dart';
import 'package:myfitness/services/showDiets_service.dart';

class ShowDietsController extends GetxController {
  var dietsList = <DeitsModel>[].obs;
  var isLoading = false.obs;
  var errorMessage = ''.obs;

  void fetchDietsByDayId(int dayId) async {
    try {
      print('IN SHOW DIETS CONTROLLER________');
      isLoading(true);
      errorMessage('');
      List<DeitsModel> diets = await ShowDietsService.getDietsByDayId(dayId);
      dietsList.assignAll(diets);
    } catch (e) {
      errorMessage(e.toString());
    } finally {
      isLoading(false);
    }
  }
}
