import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:shambalingapp/customWidget/drawerTab.dart';
import 'package:shambalingapp/screens/animalMenu.dart';
import 'package:shambalingapp/screens/plantMenu.dart';

class DrawerList extends StatelessWidget {
  DrawerList({
    super.key,
    required this.height,
    required this.width,
  });
  var height;
  var width;
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: height * 0.02,
            ),
            Row(children: [
              SizedBox(
                width: width * 0.03,
              ),
              Text(
                'Menu',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ]),
            drawerTab(
              tabIcon: Icons.bug_report,
              tabLabel: 'Wanyama',
              tabPage: Animalmenu(),
              width: width,
            ),
            drawerTab(
              tabIcon: Bootstrap.activity,
              tabLabel: 'Mimea',
              tabPage: Plantsmenu(),
              width: width,
            ),
            drawerTab(
              tabIcon: Icons.history,
              tabLabel: 'History',
              tabPage: () {},
              width: width,
            ),
            SizedBox(
              height: height * 0.7,
            ),
            const Text(
              ' @ NMT TECH COMPANY TZ  ',
              style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic),
            ),
          ],
        ),
      ),
    );
  }
}
