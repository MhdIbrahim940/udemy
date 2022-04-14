
import 'package:flutter/material.dart';
import 'package:udemyapps/shared/component/components.dart';

class LoginScreen extends StatefulWidget
 {


  @override
  _LoginScreenState createState() => _LoginScreenState();
 }

class _LoginScreenState extends State<LoginScreen>
 {
   var emailController = TextEditingController();
   var passwordController = TextEditingController();
   var formkey = GlobalKey <FormState> ();

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
              //key =>  بيدل علي ليها
              key: formkey,
              child: Column (
                crossAxisAlignment: CrossAxisAlignment.start,
                children:  [
                  const Text ('Login',
                   style:  TextStyle(
                     fontWeight: FontWeight.bold,
                     fontSize: 40.0,
                   ),
                  ),
                    const SizedBox(
                      height: 40.0,
                    ),
                  defaultFormField(
                    context: context,
                    controller: emailController,
                    type: TextInputType.emailAddress,

                    validate: (value)
                    {
                      if (value !=null && value.trim().length == 0)
                      {
                        return 'Email address must not be empty';
                      }
                      return null;
                    },

                    lable: 'Email Address',
                    //hintText: 'Enter email address',

                    prefix: Icons.email,
                  ),

                  const SizedBox(
                    height: 15.0,
                  ),

                  defaultFormField(
                    context: context,
                    controller: passwordController,
                      type: TextInputType.visiblePassword,

                      validate: (value)
                      {
                      if (value !=null && value.trim().length == 0)
                          {
                            return 'Password is too short';
                          }
                        return null;
                      },

                      lable: 'Password',
                     //hintText: 'Enter Password',

                      prefix: Icons.lock,
                      suffix: Icons.remove_red_eye,
                      isPassword: true,
                  ),

                  const SizedBox(
                    height: 15.0,
                  ),

                  defaultButton(
                      text: 'login',
                      function: ()
                      {
                        if (formkey.currentState!.validate())
                          {
                            print (emailController.text);
                            print (passwordController.text);
                          }
                      },
                      ),

                  /*defualButton(
                      text: 'login',
                     function: ()
                     {
                         if (formkey.currentState!.validate())
                           {
                             print (emailController.text);
                             print (passwordController.text);
                           }
                     },
                  ), */
                  const SizedBox(
                    height: 10.0,
                  ),

                  defaultButton(
                    function: ()
                    {
                      print (emailController.text);
                      print (passwordController.text);
                    },
                    isUpperCase: false,
                    background: Colors.green,
                    text: 'ReGeStRe',
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
