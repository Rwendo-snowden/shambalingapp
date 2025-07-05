import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shambalingapp/screens/animalMenu.dart';

class drawerTab extends StatelessWidget {
  drawerTab({
    super.key,
    required this.tabIcon,
    required this.tabLabel,
    required this.tabPage,
    required this.width,
  });
  final tabPage;
  final String tabLabel;
  final tabIcon;
  final width;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8),
      child: InkWell(
        onTap: () {
          Get.to(
            () => tabPage,
          );
        },
        child: Row(
          children: [
            SizedBox(
              width: width * 0.025,
            ),
            Icon(
              tabIcon,
              size: 30,
              color: Colors.grey[600],
            ),
            SizedBox(
              width: width * 0.1,
            ),
            Text(
              tabLabel,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
