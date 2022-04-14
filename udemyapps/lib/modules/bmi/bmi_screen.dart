


import 'dart:math';

import 'package:flutter/material.dart';

import '../bmi_result/bmi_result_screen.dart';

class BmiScreen extends StatefulWidget {

  @override
  _BmiScreen createState() => _BmiScreen();
}

class _BmiScreen extends State<BmiScreen> {

      bool isMale = true;
      double height = 120.0;
      int weight = 40;
      int age = 20;




      @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text ('BMI CALCULATER'),
        centerTitle: true,
      ),
      body : Column (
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsetsDirectional.all(20.0,),
              child: Row (
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          isMale = true;
                        });
                      },

                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular (15.0,),
                          color: isMale ? Colors.blue : Colors.grey[400],
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                           Icon(
                               Icons.male_outlined,
                               size: 70,
                             ),
                            Text  ('Male',
                            style: TextStyle(
                              fontSize: 25.0,
                              fontWeight: FontWeight.bold
                            ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 15.0,
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          isMale = false;
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular (15.0,),
                          color: isMale ? Colors.grey[400] : Colors.blue,
                        ),
                        child: Column (
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                           Icon(
                             Icons.female,
                             size: 70.0,),
                            Text  (
                              'Female',
                              style: TextStyle(
                                  fontSize: 25.0,
                                  fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
                    ),
            ),
                ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0,),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular (15.0,),
                  color: Colors.grey[400],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                     'HEIGHT',
                      style: TextStyle(
                          fontSize: 25.0,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children:  [
                        Text ('${height.round()}',
                        style: const TextStyle(
                          fontSize: 28.0,
                          fontWeight: FontWeight.bold,
                        ),
                        ),
                        Text ('CM',
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                      ],
                    ),
                    Slider(
                        value: height,
                        max: 220,
                        min: 50,
                        onChanged: (value){
                          setState(() {
                            height = value;
                          });
                        },),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsetsDirectional.all(20.0,),
              child: Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular (15.0,),
                      color: Colors.grey[400],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'WEIGHT',
                          style: TextStyle(
                              fontSize: 25.0,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                         Text ('${weight.round()}',
                          style: const TextStyle(
                            fontSize: 28.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            FloatingActionButton(
                              heroTag: 'weight-',
                              mini: true,
                              onPressed: (){
                                setState(() {
                                  weight--;
                                });
                              },
                              child: const Icon(
                                Icons.remove,
                              ),
                            ),
                            FloatingActionButton(
                              heroTag: 'weight+',
                              mini: true,
                              onPressed: (){
                                setState(() {
                                  weight++;
                                });
                              },
                              child: const Icon(
                                Icons.add,
                              ),
                            ),

                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  width: 15.0,
                ),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular (15.0,),
                      color: Colors.grey[400],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'AGE',
                          style: TextStyle(
                              fontSize: 25.0,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                         Text ('${age.round()}',
                          style: const TextStyle(
                            fontSize: 28.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            FloatingActionButton(
                              heroTag: 'age-',
                              mini: true,
                              onPressed: (){
                                setState(() {
                                  age--;
                                });
                              },
                              child: const Icon(
                                Icons.remove,
                              ),
                            ),
                            FloatingActionButton(
                              heroTag: 'age+',
                              mini: true,
                              onPressed: (){
                                setState(() {
                                  age++;
                                });
                              },
                              child: const Icon(
                                Icons.add,
                              ),
                            ),

                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
              ),
            ),
          ),
           Container(
            color: Colors.blue,
            width: double.infinity,
            height: 50,
            child: MaterialButton(
              onPressed: (){
                double  result = weight / pow(height/100,2);  //power => الاسس
                print (result.round());
                
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => BMIResualtScreen(
                          result: result.round(),
                          age: age,
                          isMale: isMale,
                        ),
                    ),
                );
              
              },
              child : const Text(
                'CALCULATE',
                style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),

              ),

            ),
          ),
              ],
            ),



    );
  }
}
