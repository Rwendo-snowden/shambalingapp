import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_tflite/flutter_tflite.dart';
import 'package:get/get.dart';
import 'package:shambalingapp/data/detectPoultryDiseases.dart';
import 'package:shambalingapp/data/detectplantsModel.dart';

class DectectPoultry extends StatefulWidget {
  const DectectPoultry({super.key});

  @override
  State<DectectPoultry> createState() => _DectectPoultryState();
}

class _DectectPoultryState extends State<DectectPoultry> {
  @override
  double confidence = 0.0;
  String label = '';

  // create instance of the model
  PoultryModel poultry = Get.put(PoultryModel());

  Future<void> _tfLiteIntit() async {
    String? res = await Tflite.loadModel(
      model: "assets/poultry_diseaes.tflite",
      labels: "assets/poultry_labels.txt",
      numThreads: 1,
      isAsset: true,
      useGpuDelegate: false,
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    Tflite.close();
  }

  @override
  void initState() {
    super.initState();
    _tfLiteIntit();
  }

  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    // intialize the path
    var path = poultry.path;
    return Scaffold(
      appBar: AppBar(
        title: Text('Tazama magonjwa '),
        backgroundColor: const Color.fromARGB(255, 52, 49, 49),
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: height * 0.03,
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: const Color.fromARGB(255, 52, 49, 49),
              ),
              child: SizedBox(
                  height: height * 0.52,
                  width: width * 0.9,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        height: height * 0.3,
                        width: width * 0.6,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                          image: DecorationImage(
                            image: AssetImage('assets/placeholder.jpg'),
                          ),
                        ),
                        child: path == null
                            ? Text('')
                            : GetBuilder<PlantsModel>(
                                init: PlantsModel(),
                                builder: (_) => Image.file(
                                  path!,
                                  fit: BoxFit.fill,
                                ),
                              ),
                      ),
                      SizedBox(
                        height: height * 0.04,
                      ),
                      Text(
                        '${label}',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                      Text(
                        'Accurracy : ${confidence} %',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                      SizedBox(
                        height: height * 0.04,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              foregroundColor: Colors.black,
                            ),
                            onPressed: () async {
                              await poultry.PickImageFromGallery();
                              setState(() {
                                path = path;
                                confidence = poultry.confidence!;
                                label = poultry.label!;
                              });
                            },
                            child: Text('Gallery'),
                          ),
                          SizedBox(
                            width: width * 0.05,
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              foregroundColor: Colors.black,
                            ),
                            onPressed: () async {
                              await poultry.TakeFromCamera();

                              setState(() {
                                path = path;
                                confidence = poultry.confidence!;
                                label = poultry.label!;
                              });
                            },
                            child: Text('Camera'),
                          ),
                        ],
                      )
                    ],
                  )),
            )
          ],
        ),
      ),
    );
  }
}
