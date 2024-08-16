import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:myfitness/components/components.dart';
import 'package:myfitness/userLogIn/userLogOutController.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final UserLogOutController userLogOutController = Get.put(UserLogOutController());
    // final NumuserController numuserController = Get.put(NumuserController());

    return Scaffold(
      body: Stack(
        children: [
          // Background image with opacity
          BackgroundImage(
            image: 'assets/images/homepage.jpeg',
          ),
          // Centered Lottie animations
          // Column(
          //   mainAxisAlignment: MainAxisAlignment.start,
          //   children: [
          //     const SizedBox(height: 120),
          //     Row(mainAxisAlignment: MainAxisAlignment.start, children: [
          //       const SizedBox(width: 360),
          //       Container(
          //         width: 500,
          //         height: 300,
          //         margin: const EdgeInsets.only(top: 30, left: 60),
          //         decoration: const BoxDecoration(
          //           image: DecorationImage(
          //             fit: BoxFit.fill,
          //             image: AssetImage('assets/images/logoapp.png'),
          //           ),
          //         ),
          //       ),
          //     ])
          //   ],
          // ),
          // Blurring effect at specific position
          Center(
            child: BlurContainer(
              height: 460,
              width: 310,
              list: [
                SizedBox(
                  height: 100,
                  width: 250,
                  child: Addtips(
                    buttonText: 'Exercises',
                  ),
                ),
                SizedBox(
                  height: 100,
                  width: 250,
                  child: Addtips(
                    buttonText: 'Diets',
                    list: [
                      Addtips(
                        buttonText: 'Weight Loss Deit',
                        routName: '/weightlossdiets',
                      ),
                      Addtips(
                        buttonText: 'Muscly Building Deit',
                        routName: '/musclybuilddiets',
                      ),
                      Addtips(
                        buttonText: 'Flexibility Deit',
                        routName: '/flexibilityddiets',
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 100,
                  width: 250,
                  child: Addtips(
                    buttonText: 'Tips',
                    list: [
                      Addtips(buttonText: 'Eating', routName: '/eating'),
                      Addtips(buttonText: 'Sleep', routName: '/sleep'),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: SizedBox(width: 175, 
            child: Obx(() {
                        return userLogOutController.isLoading.value
                            ? const CircularProgressIndicator()
                            : MaterialButton(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                padding: const EdgeInsets.all(15),
                                minWidth: 400,
                                color: const Color.fromARGB(255, 49, 0, 71),
                                onPressed: userLogOutController.userLogOut,
                                child: const Text(
                                  'Log Out',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w700,
                                    color: Color.fromARGB(255, 161, 153, 153),
                                  ),
                                ),
                              );
                      })),
          )
          // BlurContainer(
          //   height: 641,
          //   width: 350,
          //   list: [
          //     SizedBox(
          //       width: 175,
          //       height: 175,
          //       child: ClipRRect(
          //         borderRadius: BorderRadius.circular(90),
          //         child: Image.asset('assets/images/adminpic2.jpg'),
          //       ),
          //     ),
          //     Container(
          //       margin: const EdgeInsets.only(left: 10, right: 10),
          //       child: MyText(
          //         text:
          //             'Manage your sports world with ease and efficiency. Welcome to the control center for all things sports!',
          //         fontsize: 20,
          //       ),
          //     ),
          //     Column(
          //       children: [
          //         Container(
          //           margin: const EdgeInsets.only(left: 10, right: 10),
          //           child: MyText(
          //             text: 'Number of users:',
          //             fontsize: 20,
          //           ),
          //         ),
          //         const SizedBox(
          //           height: 30,
          //         ),
          //         // Obx(() {
          //         //   if (numuserController.isLoading.value) {
          //         //     return const Center(child: CircularProgressIndicator());
          //         //   } else if (numuserController.errorMessage.isNotEmpty) {
          //         //     return Center(
          //         //         child: Text(numuserController.errorMessage.value));
          //         //   } else {
          //         //     return SizedBox(
          //         //       width: 325,
          //         //       child: Addtips(
          //         //         buttonText:
          //         //             '${numuserController.userCount.value} USERS',
          //         //         routName: '/usersinfo',
          //         //       ),
          //         //     );
          //         //   }
          //         // }),
          //       ],
          //     ),
          //   ],
          // ),
        ],
      ),
    );
  }
}
