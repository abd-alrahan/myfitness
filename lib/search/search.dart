import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:myfitness/APIs/diohelper.dart';
import 'package:myfitness/models/tipsModel.dart';

class MySearchAAA extends StatefulWidget {
  const MySearchAAA({super.key});

  @override
  State<MySearchAAA> createState() => _MySearchAAAState();
}

class _MySearchAAAState extends State<MySearchAAA> {
  @override
  Widget build(BuildContext context) {
//  final searchValidator = GlobalKey<FormState>();
    final searchController = TextEditingController();
    // TextEditingController textController = TextEditingController(text: '');
    final GlobalKey<ScaffoldState> scaffoldKeySearch =
        GlobalKey<ScaffoldState>();

    String query = '';

    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.only(top: 10),
          child: FutureBuilder<dynamic>(
            future: DioHelper.postSearch(description: "${query}"),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                print('error');

                return Center(child: Text(snapshot.error.toString()));
              } else if (snapshot.hasData) {
                print('hasDa[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[ta');
                print(snapshot.data);

                TipsModel Proudect1 = snapshot.data!;
                return Padding(
                  padding: const EdgeInsets.only(left: 5, right: 5),
                  child: Card(
                    elevation: 10,
                    shadowColor: Colors.blue, //Colors.black,
                    //color: Colors.grey,
                    color: Colors.blue,
                    child: ListView.separated(
                      itemCount: 1,
                      separatorBuilder: (context, index) => SizedBox(),
                      itemBuilder: (context, index) => Container(
                        child: Text(Proudect1.description.toString()),

                        color: Colors.green,
                      ),
                    ),
                  ),
                );
              } else {
                return const Center(
                    child: CircularProgressIndicator(
                  strokeWidth: 3,
                ));
              }
            },
          ),
        ),
      ),
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Get.back();

            ///abd delete  Get.back(); or   Navigator.pop(context);
            //   Navigator.pop(context);
            // navigateAndFinish(context, MySearchAAA());
          },
          icon: const Icon(
            Icons.arrow_back_sharp,
            color: Color(0xff34D399),
            size: 30,
          ),
        ),
        title: TextFormField(
          textInputAction: TextInputAction.send,
          keyboardType: TextInputType.name,
          controller: searchController,
          style: const TextStyle(fontSize: 18),
          validator: (value) {
            return !GetUtils.isUsername(value!) ? 'not_valid_Username' : null;
          },
          decoration: InputDecoration(
            suffixIcon: IconButton(
              onPressed: () {
                // sear2.myClear();
                // sear1.myClear();
                // sear.myClear();
                // sear.textController.clear();
                // sear.query = '';
                // sear.mySearch(searchText: sear.query);
                // sear1.mySearch(searchText: sear.query);
                // sear2.mySearch(searchText: sear.query);
              },
              icon: const Icon(
                Icons.close,
                color: Colors.black,
              ),
            ),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(100),
                borderSide: const BorderSide(
                  color: Colors.green, // <-- تغيير اللون هنا
                  width: 2, // <-- يمكنك تغيير عرض الحد أيضًا
                )),
            focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(100),
                borderSide: const BorderSide(
                  color: Colors.red,
                  style: BorderStyle.solid,
                  width: 2, // <-- يمكنك تغيير عرض الحد أيضًا
                )),

            isDense: true,
            suffixIconColor: Colors.black,

            contentPadding:
                const EdgeInsets.symmetric(vertical: 6, horizontal: 20),
            filled: true,
            fillColor: Colors.white.withOpacity(0.5),
            hintStyle: const TextStyle(color: Colors.green, fontSize: 34),
            labelStyle: const TextStyle(
                // decorationColor: Colors.white,
                //decoration: TextDecoration.underline,
                color: Colors.black38,
                fontWeight: FontWeight.w300,
                fontSize: 13),
            // errorText: "there are problem",
            errorStyle: TextStyle(color: Colors.red.shade300, fontSize: 10),
            errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(100),
                borderSide: const BorderSide(
                  style: BorderStyle.none,
                  color: Colors.black45,
                  width: 1,
                )),
            errorMaxLines: 1,
            labelText: "enter name of search",
            hoverColor: Colors.green,
            focusColor: Colors.green,

            border: OutlineInputBorder(
              borderSide: const BorderSide(
                  style: BorderStyle.solid, color: Colors.white),
              borderRadius: BorderRadius.circular(100),
            ),
          ),
          onTap: () {},
          onChanged: (value) {
            query = value!;
            setState(() {
              query = value!;
            });
            // sear.query = value!;
            // sear.mySearch(searchText: sear.query);
            // sear1.mySearch(searchText: sear.query);
            // sear2.mySearch(searchText: sear.query);
            // print(value);
          },
        ),
        iconTheme: const IconThemeData(color: Colors.black),
        actionsIconTheme: const IconThemeData(color: Colors.black),
      ),
    );
  }
}
