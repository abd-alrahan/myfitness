import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:myfitness/components/components.dart';
import 'package:myfitness/userLogIn/userLogInController.dart';

class UserLogIn extends StatelessWidget {
  UserLogIn({super.key});

  UserLogInController userLogInController = Get.put(UserLogInController());
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.grey,
          title: Center(child: MyText(text: 'Home Workout App', fontsize: 25))),
      body: SingleChildScrollView(
        //  child: Container(
        // width: double.infinity,
        // decoration: const BoxDecoration(
        //   image: DecorationImage(
        //     fit: BoxFit.cover,
        //     image: AssetImage('assets/images/login1.jpeg'),
        //   ),
        // ),
        child: Form(
          key: _formKey,
          autovalidateMode: AutovalidateMode.always,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Container(
              //   width: 300,
              //   height: 150,
              //   margin: const EdgeInsets.only(top: 30, left: 60),
              //   decoration: const BoxDecoration(
              //     image: DecorationImage(
              //       fit: BoxFit.fill,
              //       image: AssetImage('assets/images/logoapp.png'),
              //     ),
              //   ),
              // ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.blueGrey.withOpacity(0.25),
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const SizedBox(height: 15),
                    MyText(
                      text: 'LOGIN',
                      fontsize: 25,
                    ),
                    const SizedBox(height: 40),
                    CustomTextFormField(
                      onChanged: (dynamic) {
                        userLogInController.email.value = dynamic;
                      },
                      labelText: 'Email',
                      prefixIcon: Icons.person,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your email';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 10),
                    CustomTextFormField(
                      onChanged: (dynamic) {
                        userLogInController.password.value = dynamic;
                      },
                      labelText: 'Password',
                      prefixIcon: Icons.lock,
                      obscureText: true,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your password';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 30),
                    Obx(() {
                      return userLogInController.isLoading.value
                          ? const CircularProgressIndicator()
                          : MaterialButton(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                              padding: const EdgeInsets.all(15),
                              minWidth: 400,
                              color: const Color.fromARGB(255, 49, 0, 71),
                              onPressed: userLogInController.userLogIn,
                              child: const Text(
                                'Log In',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w700,
                                  color: Color.fromARGB(255, 161, 153, 153),
                                ),
                              ),
                            );
                    }),
                    const SizedBox(height: 20),
                    Addtips(buttonText: 'go to Register page', routName: '/register'),
                  ],
                ),
              ),
            ],
          ),
        ),
        //),
      ),
    );
  }
}
