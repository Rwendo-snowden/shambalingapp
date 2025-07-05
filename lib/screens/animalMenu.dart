import 'package:flutter/material.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:shambalingapp/customWidget/AdsBox.dart';
import 'package:shambalingapp/customWidget/Boxwid.dart';
import 'package:shambalingapp/customWidget/drawerlist.dart';
import 'package:shambalingapp/data/detectplantsModel.dart';
import 'package:shambalingapp/screens/dectectplants.dart';
import 'package:shambalingapp/screens/detectAnimal.dart';
import 'package:shambalingapp/screens/plantMenu.dart';

class Animalmenu extends StatelessWidget {
  const Animalmenu({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text('Shambaling App'),
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
                  Get.to(
                    () => DectectPoultry(),
                  );
                },
                child: BoxWid(
                  height: height,
                  width: width,
                  title: 'Poultry',
                  imagePath: Image(
                    image: AssetImage('assets/th.jpeg'),
                  ),
                  color: Colors.green,
                ),
              ),
              InkWell(
                onTap: () {
                  Get.to(
                    () => DectectPlants(),
                  );
                },
                child: BoxWid(
                  height: height,
                  width: width,
                  title: 'Cow ',
                  imagePath: Image(
                    image: AssetImage('assets/cow.jpg'),
                  ),
                  color: Colors.blue,
                ),
              ),
            ],
          ),
          AdsBox(height: height)
        ],
      ),
    );
  }
}
