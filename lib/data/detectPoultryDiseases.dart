import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_tflite/flutter_tflite.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:developer' as devtools;

class PoultryModel extends GetxController {
  File? path;
  double? confidence;
  String? label;
  var p;
  PickImageFromGallery() async {
    final ImagePicker picker = ImagePicker();

    final XFile? image = await picker.pickImage(source: ImageSource.gallery);

    if (image == null) return;
    final imageMap = File(image!.path);

    path = imageMap;
    p = imageMap;
    try {
      var recognitions = await Tflite.runModelOnImage(
          path: image.path, // required
          imageMean: 0.0, // defaults to 117.0
          imageStd: 255.0, // defaults to 1.0
          numResults: 2, // defaults to 5
          threshold: 0.2, // defaults to 0.1
          asynch: true // defaults to true
          );

      if (recognitions == null) {
        devtools.log("no recognitions");
      }

      confidence = (recognitions![0]['confidence'] * 100);
      label = recognitions![0]['label'].toString();

      devtools.log(recognitions.toString());
    } catch (e) {
      print('the error is: ${e}');
    }

    // print(recognitions);
    print(confidence);

    update();
  }

  TakeFromCamera() async {
    final ImagePicker picker = await ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.camera);

    if (image == Null) {}

    final imageMap = File(image!.path);

    path = imageMap;

    var recognitions = await Tflite.runModelOnImage(
        path: path.toString(), // required
        imageMean: 0.0, // defaults to 117.0
        imageStd: 255.0, // defaults to 1.0
        numResults: 2, // defaults to 5
        threshold: 0.2, // defaults to 0.1
        asynch: true // defaults to true
        );

    if (recognitions == null) {
      devtools.log("no recognitions");
    }

    confidence = (recognitions![0]['confidence'] * 100);
    label = recognitions![0]['labels'].toString();

    devtools.log(recognitions.toString());
    // print(recognitions);
    print(confidence);

    update();
  }
}
