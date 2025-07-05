import 'package:flutter/material.dart';

class AdsBox extends StatelessWidget {
  const AdsBox({
    super.key,
    required this.height,
  });

  final double height;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8),
      child: SizedBox(
        height: height * 0.1,
        child: Container(
          child: Center(
            child: Text(
              "Ad's",
              style: TextStyle(fontSize: 25, color: Colors.white),
            ),
          ),
          decoration: BoxDecoration(
              color: Colors.grey, borderRadius: BorderRadius.circular(12)),
        ),
      ),
    );
  }
}
