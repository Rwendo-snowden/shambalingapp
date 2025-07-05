import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_tflite/flutter_tflite.dart';
import 'package:get/get.dart';
import 'package:shambalingapp/data/detectplantsModel.dart';

class PlantsDetectionPage extends StatefulWidget {
  PlantsDetectionPage({
    super.key,
    required this.plantsLabel,
  });

  String plantsLabel;

  @override
  State<PlantsDetectionPage> createState() => _PlantsDetectionPageState();
}

class _PlantsDetectionPageState extends State<PlantsDetectionPage> {
// the intial confidence and label
  double confidence = 0.0;

  String label = '';

  PlantsModel plants = Get.put(PlantsModel());

  // intialize the tomato  model
  Future<void> _TomatoTfLiteIntit() async {
    String? res = await Tflite.loadModel(
      model: "assets/model_unquant.tflite",
      labels: "assets/labels.txt",
      numThreads: 1,
      isAsset: true,
      useGpuDelegate: false,
    );
  }

// intialize the mango model
  Future<void> _MangoTfLiteIntit() async {
    String? res = await Tflite.loadModel(
      model: "assets/Mango_model_unquant.tflite",
      labels: "assets/Mango_labels.txt",
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
    // TODO: implement initState
    super.initState();
    if (widget.plantsLabel == 'Tomato') {
      _TomatoTfLiteIntit();
    } else if (widget.plantsLabel == 'Mango') {
      _MangoTfLiteIntit();
    }
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    // intialize the path
    var path = plants.path;
    return Scaffold(
      appBar: AppBar(
        title: Text('Tazama magonjwa ya ${widget.plantsLabel}'),
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
                              await plants.PickImageFromGallery();
                              setState(() {
                                path = path;
                                confidence = plants.confidence!;
                                label = plants.label!;
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
                              await plants.TakeFromCamera();

                              setState(() {
                                path = path;
                                confidence = plants.confidence!;
                                label = plants.label!;
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
