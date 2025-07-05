import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:shambalingapp/screens/animalMenu.dart';
import 'package:shambalingapp/screens/dectectplants.dart';
import 'package:shambalingapp/screens/plantMenu.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'The beginning of the Future ',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // home: Animalmenu(),
      home: Plantsmenu(),
    );
  }
}
