

import 'package:flutter/material.dart';
import 'package:udemyapps/shared/component/components.dart';

class LoginScreen1 extends StatefulWidget {

  @override
  _LoginScreen1State createState() => _LoginScreen1State();
}

class _LoginScreen1State extends State<LoginScreen1> {

  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(),
      body:
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Center(
            child: SingleChildScrollView(
                child: Form(
                  key: formKey,
                  child: Column (
                    children: [
                      const Text ('Login',
                        style:  TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 40.0,
                        ),
                      ),

                     const SizedBox(
                        height: 40.0,
                      ),
                      defaultFormField (
                          context: context,
                          controller: emailController,
                          type: TextInputType.emailAddress ,
                        lable: 'Email Address',
                        prefix: (Icons.email_outlined),
                        hintText: 'Enter Email Address',
                        validate: (value) {
                            //if (value == null || value.trim().length == 0)

                          if (value == null || value.isEmpty)

                          {
                                return ('Email Address can not be Empty');
                              }
                            return null;
                        },
                      ),

                      const SizedBox(
                        height: 15.0,
                      ),

                      defaultFormField(
                          context: context,
                          controller: passwordController,
                          type: TextInputType.numberWithOptions(),
                          lable: 'Password',
                          hintText: 'Enter Password',
                          prefix: (Icons.lock),
                          isPassword: false,
                        suffix: (Icons.remove_red_eye),
                      ),

                     const SizedBox(
                        height: 15.0,
                      ),

                      defaultButton(
                        text: 'login',
                        function: (){

                          //print('Yor are press the Button');
                        },
                      ),

                      TextButton(
                          onPressed: (){

                            if(formKey.currentState != null && formKey.currentState!.validate())
                            {
                              print(emailController.text);
                            }

                           // print ('You are press this Button');
                          },
                          child: Text ('Login'),
                      ),
                     const SizedBox(
                        height: 10.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text (
                            'Dont\' have an account?',
                          ),
                          TextButton(
                            onPressed: (){},
                            child: const Text (
                              'Register Now',
                            ),),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
          ),
        ),






    );
  }
}
