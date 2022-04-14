

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

 class BMIResualtScreen extends StatelessWidget
 {
    final int  result;
    final bool isMale;
    final int age;

     BMIResualtScreen({
    required this.age,
    required this.isMale,
    required this.result,
  });

   @override
   Widget build(BuildContext context) {
     return Scaffold(
       appBar: AppBar(
         title: Text ('BMI Result Screen', ),
       ),

       body: Center(
         child: Column(
           mainAxisAlignment: MainAxisAlignment.center,
           children: [
             Text ('GENDER : ${isMale ? 'Male ': 'Femal'}',
               style: const TextStyle(
                   fontSize: 25.0,
                   fontWeight: FontWeight.bold
               ),
             ),
             Text ('RESULT : $result',
               style: const TextStyle(
                 fontSize: 25.0,
                 fontWeight: FontWeight.bold
               ),
              ),
             Text ('AGE : $age',
                style: const TextStyle(
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold
                ),
              ),
           ],
         ),
       ),
     );
   }
 }


