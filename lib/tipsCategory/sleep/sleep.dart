import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myfitness/components/components.dart';
import 'package:myfitness/tipsCategory/sleep/sleepController.dart';

class Sleep extends StatelessWidget {
  const Sleep({super.key});

  @override
  Widget build(BuildContext context) {
    final ShowSleepController showsleepController =
        Get.put(ShowSleepController());

    showsleepController.fetchTips(showsleepController.categoryId);
    // // Fetch the tips when the widget is initialized
    // WidgetsBinding.instance.addPostFrameCallback((_) {
    //   showsleepController.fetchTips(showsleepController.categoryId);
    // });

    return Scaffold(
      body: Stack(
        children: [
          BackgroundImage(image: 'assets/images/homepage.jpeg'),
          // Align(alignment: Alignment.bottomRight,
          // child: SizedBox(
          //   width: 225,
          //   child: Addtips(buttonText: 'Go to Home Page',routName: '/home'),
          // ),
          // ),
          Center(
            child: BlurContainer(
              height: 660,
              width: 370,
              list: [
                Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: MyText(text: 'Sleep Tips:', fontsize: 35),
                ),
                const SizedBox(height: 15),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 23, right: 23, top: 20, bottom: 20),
                    child: Obx(() {
                      if (showsleepController.isLoading.value) {
                        return const Center(child: CircularProgressIndicator());
                      } else if (showsleepController.errorMessage.isNotEmpty) {
                        return Center(
                            child:
                                Text(showsleepController.errorMessage.value));
                      } else if (showsleepController.tipsList.isEmpty) {
                        return const Center(child: Text('No tips found'));
                      } else {
                        return ListView.builder(
                          itemCount: showsleepController.tipsList.length,
                          itemBuilder: (context, index) {
                            var tip = showsleepController.tipsList[index];
                            return Container(
                              height: 70,
                              padding: const EdgeInsets.all(8.0),
                              margin: const EdgeInsets.symmetric(vertical: 5.0),
                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.5),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Row(
                                children: [
                                  const SizedBox(height: 10),
                                  Expanded(
                                    child: Text(
                                      tip.description,
                                      style: const TextStyle(fontSize: 16),
                                    ),
                                  ),
                                  // Align(
                                  //     alignment: Alignment.centerRight,
                                  //     child: SizedBox(
                                  //       height: 25,
                                  //       width: 50,
                                  //       child: Obx(() {
                                  //         return deleteTipController
                                  //                     .loadingTips[tip.id] ==
                                  //                 true
                                  //             ? const Center(
                                  //                 child: SizedBox(
                                  //                   width: 20,
                                  //                   height: 20,
                                  //                   child:
                                  //                       CircularProgressIndicator(
                                  //                           strokeWidth: 2.0),
                                  //                 ),
                                  //               )
                                  //             : MaterialButton(
                                  //                 color: Colors.red,
                                  //                 textColor: Colors.white,
                                  //                 child: const Text(
                                  //                   'Remove',
                                  //                   style: TextStyle(
                                  //                       fontSize: 9.3),
                                  //                 ),
                                  //                 onPressed: () async {
                                  //                   if (tip.id != null) {
                                  //                     await deleteTipController
                                  //                         .deleteTip(tip
                                  //                             .id!); // Call delete method
                                  //                     showsleepController
                                  //                         .tipsList
                                  //                         .removeAt(index);
                                  //                   } else {
                                  //                     // Handle the case where id is null
                                  //                     Get.snackbar('Error',
                                  //                         'Tip ID is not available');
                                  //                   }
                                  //                 },
                                  //               );
                                  //       }),
                                  //     )),
                                ],
                              ),
                            );
                          },
                        );
                      }
                    }),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
