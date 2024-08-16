import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:myfitness/APIs/diohelper.dart';
import 'package:myfitness/dietsCategory/flexibility/flexibilityDiets.dart';
import 'package:myfitness/dietsCategory/musclyBuildingDiets/musclyBuildingDiets.dart';
import 'package:myfitness/dietsCategory/weightLossDiets/weightLossDiets.dart';
import 'package:myfitness/homepage/hompage.dart';
import 'package:myfitness/services/userLogIn_service.dart';
import 'package:myfitness/tipsCategory/eating/eating.dart';
import 'package:myfitness/tipsCategory/sleep/sleep.dart';
import 'package:myfitness/userLogIn/userLogIn.dart';
import 'package:myfitness/userRegister/userRegister.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
  await UserLogInService.init();
  runApp(const MyFitness());
}

class MyFitness extends StatelessWidget {
  const MyFitness({super.key});

  @override
  Widget build(BuildContext context) {
    print('current token: ${UserLogInService.getUserToken() == null}');
    return GetMaterialApp(
      home: UserLogInService.getUserToken() == null ? UserLogIn() : const HomePage(),
      debugShowCheckedModeBanner: false,
      //initialRoute: '/login',
      getPages: [
        GetPage(name: '/register', page: () => UserRegister()),
        GetPage(name: '/login', page: () => UserLogIn()),
        GetPage(name: '/homepage', page: () => const HomePage()),
        GetPage(name: '/eating', page: () => const Eating()),
        GetPage(name: '/sleep', page: () => const Sleep()),
        GetPage(name: '/weightlossdiets', page: () => WeightLossDiets()),
        GetPage(name: '/musclybuilddiets', page: () => MusclyBuildingDiets()),
        GetPage(name: '/flexibilityddiets', page: () => FlexibilityDiets()),
      ],
    );
  }
}
