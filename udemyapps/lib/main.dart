import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:udemyapps/shared/bloc_observer.dart';
import 'package:udemyapps/shared/cubit/cubit.dart';
import 'package:udemyapps/shared/cubit/states.dart';
import 'package:udemyapps/shared/networks/local/cach_helper/cach_helper.dart';
import 'package:udemyapps/shared/networks/remote/dio_helper/dio_helper.dart';
import 'layout/news_app/cubit/cubit.dart';
import 'layout/news_app/news_layout.dart';
import 'login_scrren.dart';
import 'modules/bmi_result/bmi_result_screen.dart';
import 'modules/bmi/bmi_screen.dart';
import 'modules/counter/counter_screen.dart';
import 'modules/login/login_screen.dart';



void main()async {

  WidgetsFlutterBinding.ensureInitialized();

  DioHelper.init();
  await CacheHelper.init();
  bool? darkScreen = CacheHelper.getBoolean(key: 'isdark');



  BlocOverrides.runZoned(()
    {
      runApp(MyApp(darkScreen));
    },

    blocObserver: MyBlocObserver(),
  );


}

class MyApp extends StatelessWidget {

  final bool? darkscreen;
  MyApp (this.darkscreen);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) =>  NewsCubit()..getBusiness()..getSports()..getScience(), ),
        BlocProvider( create: (BuildContext context) =>  AppCubit()..changeAppMode(
        fromShared : darkscreen,),
        ),
        
      ],
      child: BlocConsumer <AppCubit, AppStates> (
        listener: (context,state) {},
        builder: (context,state) {

          return MaterialApp (
            title: 'Flutter Demo',
            debugShowCheckedModeBanner: false,

            theme: ThemeData(
              primarySwatch: Colors.deepOrange,
              scaffoldBackgroundColor: Colors.white,
              appBarTheme: AppBarTheme(

                backwardsCompatibility: false,


                systemOverlayStyle: SystemUiOverlayStyle(
                  statusBarColor: Colors.white,
                  statusBarIconBrightness: Brightness.dark,
                ),

                iconTheme: IconThemeData(
                  color: Colors.black,
                ),

                backgroundColor: Colors.white,
                elevation: 0.0,

                titleSpacing: 20.0,
                titleTextStyle: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 25.0,
                ),
              ),

              floatingActionButtonTheme:  FloatingActionButtonThemeData(
                backgroundColor: Colors.deepOrange,
              ),


              bottomNavigationBarTheme: BottomNavigationBarThemeData(
                type: BottomNavigationBarType.fixed,
                selectedItemColor: Colors.deepOrange,
                unselectedItemColor: Colors.grey,
                backgroundColor: Colors.white,
                elevation: 30.0,
              ),

              textTheme: TextTheme(
                bodyText1: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),

            ),


            darkTheme: ThemeData(
              scaffoldBackgroundColor: HexColor('333739'),
              primarySwatch: Colors.deepOrange,
              appBarTheme: AppBarTheme(
                backwardsCompatibility: false,
                systemOverlayStyle: SystemUiOverlayStyle(
                  statusBarColor:  HexColor('333739'),
                  statusBarIconBrightness: Brightness.light,
                ),

                iconTheme: IconThemeData(
                  color: Colors.white,
                ),

                backgroundColor: HexColor('333739'),
                elevation: 0.0,

                titleSpacing: 20.0,
                titleTextStyle: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 25.0,
                ),
              ),

              floatingActionButtonTheme:  FloatingActionButtonThemeData(
                backgroundColor: Colors.deepOrange,
              ),
              bottomNavigationBarTheme: BottomNavigationBarThemeData(
                type: BottomNavigationBarType.fixed,
                selectedItemColor: Colors.deepOrange,
                unselectedItemColor: Colors.grey,
                backgroundColor: HexColor('333739'),
                elevation: 30.0,

              ),
              textTheme: TextTheme(
                bodyText1:  TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),

            ),


            themeMode: AppCubit.get(context).isdark ? ThemeMode.dark : ThemeMode.light,


            home: NewsLayout(),

            //  ///BmiScreen
          );

        },
      ),
    );


  }
}
