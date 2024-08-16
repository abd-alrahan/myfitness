import 'package:get/get.dart';

class DayController extends GetxController {
  var selectedDay = 0.obs;

  void setSelectedDay(int day) {
    selectedDay.value = day;
  }
}