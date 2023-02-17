import 'dart:ffi';

import 'package:bmical/constaint.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int height = 170;
  int weight = 55;
  late double BMI = bmi(height: height, weight: weight);

  late String gender;
  String getresult = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Colors.white,
          padding: const EdgeInsets.all(18),
          child: Column(children: [
            Row(
              children: [
                GestureDetector(
                  onTap: (() {
                    print("male");
                    setState(
                      () {
                        gender = "M";
                      },
                    );
                  }),
                  child: Container(
                    height: 200,
                    width: 170,
                    decoration: BoxDecoration(
                      color: gender == "M"
                          ? Colors.orange.withAlpha(150)
                          : Colors.orange.withAlpha(50),
                      borderRadius: BorderRadius.circular(25),
                    ),
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: const [
                        Icon(
                          Icons.male,
                          size: 150,
                        ),
                        Text("Male"),
                      ],
                    ),
                  ),
                ),
                const Spacer(),
                GestureDetector(
                  onTap: (() {
                    setState(() {
                      gender = "F";
                    });
                  }),
                  child: Container(
                    height: 200,
                    width: 170,
                    decoration: BoxDecoration(
                        color: gender == "F"
                            ? Colors.orange.withAlpha(150)
                            : Colors.orange.withAlpha(50),
                        borderRadius: BorderRadius.circular(25)),
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: const [
                        Icon(
                          Icons.female,
                          size: 150,
                        ),
                        Text("Female"),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 50,
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      const Text("Height (cm)"),
                      Text("$height", style: kInputLabelColor),
                      Row(
                        children: [
                          FloatingActionButton(
                            onPressed: () {
                              setState(() {
                                if (height > 50) height--;
                                BMI = bmi(height: height, weight: weight);
                              });
                            },
                            child: const Icon(
                              Icons.remove,
                              size: 40,
                            ),
                          ),
                          const SizedBox(
                            width: 25,
                          ),
                          FloatingActionButton(
                            onPressed: () {
                              setState(() {
                                if (height < 210) height++;
                                BMI = bmi(height: height, weight: weight);
                              });
                            },
                            child: const Icon(
                              Icons.add,
                              size: 40,
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
                const Spacer(),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      const Text("Weight (Kg)"),
                      Text("$weight", style: kInputLabelColor),
                      Row(
                        children: [
                          FloatingActionButton(
                            onPressed: () {
                              setState(() {
                                if (weight > 35) weight--;
                                BMI = bmi(height: height, weight: weight);
                              });
                            },
                            child: const Icon(
                              Icons.remove,
                              size: 40,
                            ),
                          ),
                          const SizedBox(
                            width: 25,
                          ),
                          FloatingActionButton(
                            onPressed: () {
                              setState(() {
                                if (weight < 300) weight++;
                                BMI = bmi(height: height, weight: weight);
                              });
                            },
                            child: const Icon(
                              Icons.add,
                              size: 40,
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 50,
            ),
            Container(
              width: 320,
              height: 150,
              padding: const EdgeInsets.all(22.0),
              decoration: BoxDecoration(
                  color: Colors.grey.withAlpha(50),
                  borderRadius: BorderRadius.circular(20)),
              child: Column(
                children: [
                  const Text("BMI"),
                  Text(BMI.toStringAsFixed(2),
                      style: kInputLabelColor.copyWith(
                          color: kOutputTextcolor, fontSize: 55)),
                  Text(
                    getresult = result(BMI),
                    style: TextStyle(
                        color: getresult == "Overweight"
                            ? Colors.red.withAlpha(1000)
                            : getresult == "Normal"
                                ? Colors.green.withAlpha(500)
                                : Colors.orange.withAlpha(500),
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  ),
                ],
              ),
            )
          ]),
        ),
      ),
    );
  }

  double bmi({required int height, required int weight}) {
    return weight / (height * height) * 10000;
  }

  static String result(bmivalue) {
    if (bmivalue >= 25) {
      return "Overweight";
    } else if (bmivalue > 18) {
      return "Normal";
    } else {
      return "Underweight";
    }
  }
}
