
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:shopping_app/views/screens/authScreen.dart';
import 'package:shopping_app/views/screens/productOverview.dart';


void main() {
   runApp(const MyApp());
}

class MyApp extends StatelessWidget {
   const MyApp({Key? key}) : super(key: key);


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
      ),
      home:const AuthScreen(),

      // onReady:()=> Get.find<AuthController>().isAuth? ProductOverview():const AuthScreen(),
    );
  }
}



