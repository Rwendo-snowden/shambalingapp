import 'package:flutter/material.dart';

class BoxWid extends StatelessWidget {
  BoxWid({
    super.key,
    required this.height,
    required this.width,
    required this.title,
    required this.imagePath,
    required this.color,
  });

  final double height;
  final double width;
  final String title;
  final Image imagePath;
  final color;

  @override
  Widget build(BuildContext context) {
    var hc = height * 0.12;
    return SizedBox(
      child: Padding(
        padding: EdgeInsets.all(8),
        child: Container(
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(12),
          ),
          height: height * 0.13,
          width: width * 0.45,
          child: Center(
            child: Column(
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: height * 0.05,
                  child: imagePath,
                ),
                SizedBox(
                  height: hc * 0.083,
                ),
                Container(
                  color: Color.fromRGBO(255, 255, 255, 0.5),
                  height: hc * 0.22,
                  child: Center(
                    child: Icon(Icons.arrow_back_ios),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
