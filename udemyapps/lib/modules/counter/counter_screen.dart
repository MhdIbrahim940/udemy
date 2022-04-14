


import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:udemyapps/modules/counter/cubit/cubit.dart';
import 'package:udemyapps/modules/counter/cubit/states.dart';

class CounterScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext  context )  => CounterCubit(),
      child : BlocConsumer <CounterCubit, CounterStates>
      (
        listener: (context ,state)
        {
          if ( state is CounterMinusState) {} //print ('${CounterCubit.get(context).counter}  Minus State');
          if ( state is CounterPlusState)  {} // print ( '${CounterCubit.get(context).counter}  Plus State');

        },
        builder: (context , state)
        {
          return Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              title: Text('Counter',
                style: TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              centerTitle: true,
              elevation: 0.0,

            ),

            body: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: ()
                    {
                      CounterCubit.get(context).minus();
                    },
                    child: Text ('MINUS',
                      style: TextStyle(
                        fontSize: 21,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 15.0,
                  ),
                  Text (
                    '${CounterCubit.get(context).counter}',
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    width: 15.0,
                  ),
                  TextButton(
                    onPressed: ()
                    {
                      CounterCubit.get(context).plus();
                    },
                    child: Text ('Plus',
                      style: TextStyle(
                        fontSize: 21,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },

      ),
    );
  }
}


