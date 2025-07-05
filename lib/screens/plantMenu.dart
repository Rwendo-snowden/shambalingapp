import 'package:flutter/material.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:shambalingapp/customWidget/AdsBox.dart';
import 'package:shambalingapp/customWidget/Boxwid.dart';
import 'package:shambalingapp/customWidget/drawerlist.dart';
import 'package:shambalingapp/screens/PlantsDetectionPage.dart';
import 'package:shambalingapp/screens/dectectplants.dart';
import 'package:shambalingapp/screens/detectAnimal.dart';

class Plantsmenu extends StatelessWidget {
  const Plantsmenu({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text('Shambaling'),
      ),
      drawer: DrawerList(
        height: height,
        width: width,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              InkWell(
                onTap: () {
                  // Get.to(() => DectectPlants());
                  Get.to(
                    () => PlantsDetectionPage(plantsLabel: 'Tomato'),
                  );
                },
                child: BoxWid(
                  height: height,
                  width: width,
                  title: 'Tomato Plant',
                  imagePath: Image(
                    image: AssetImage('assets/tomato.jpg'),
                  ),
                  color: Colors.green,
                ),
              ),
              InkWell(
                onTap: () {
                  Get.to(() => PlantsDetectionPage(plantsLabel: 'Mango'));
                },
                child: BoxWid(
                  height: height,
                  width: width,
                  title: ' Mango plant ',
                  imagePath: Image(
                    image: AssetImage('assets/mango.jpg'),
                  ),
                  color: Colors.blue,
                ),
              ),
            ],
          ),
          AdsBox(height: height),
        ],
      ),
    );
  }
}
