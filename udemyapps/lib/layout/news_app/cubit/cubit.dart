


import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:udemyapps/layout/news_app/cubit/states.dart';
import 'package:udemyapps/modules/business/business_screen.dart';
import 'package:udemyapps/modules/scinence/scinence_screen.dart';
import 'package:udemyapps/modules/sports/sport_screen.dart';
import 'package:udemyapps/shared/networks/remote/dio_helper/dio_helper.dart';



class NewsCubit extends Cubit<NewsStates> {

  NewsCubit() : super (NewsInitialState());


  static NewsCubit get(context) => BlocProvider.of(context);


  int currentIndex = 0;




  List<Widget> Screens = [
    BusinessScreen(),
    SportsScreen(),
    ScienceScreen(),
  ];


  void changeBottomIndex ( int index )
  {
    currentIndex = index;
    emit(NewsChangeBottomNavState());
  }

  bool isdark = true;

  IconData iconMode = Icons.brightness_4_outlined; //Icon(Icons.nightlight_round);


  void changeBottomNavBarIndex(int index) {
    currentIndex = index;
    if (index ==1)
      getSports();

      if (index ==2)
        getScience();
    emit(NewsChangeBottomNavState());
  }

  List <dynamic> business = [];

  void getBusiness() {


    if(search.length ==0)
    {
      emit(NewsGetBusinessLoadingState());

      DioHelper.getData(
        url: 'v2/top-headlines',
        query:
        {
          'country': 'eg',
          'category': 'business',
          'apiKey': '244a7282775642c1b65e9294bd892be1',
        },
      ).then((value) {
        business = value.data['articles'];
        //print(business[0]['title']);
        emit(NewsGetBusinessSuccessState());
      }).catchError((error) {
        print('Oops! you have Error ${error.toString()}');

        emit(NewsGetBusinessErrorState(error.toString()));
      });
    }
    else
      {
        emit(NewsGetBusinessSuccessState());
      }
  }




  List <dynamic> sports = [];

  void getSports() {

    if(sports.length ==0)

      {

        emit(NewsGetSportsLoadingState());

        DioHelper.getData(
          url: 'v2/top-headlines',
          query:
          {
            'country': 'eg',
            'category': 'sports',
            'apiKey': '244a7282775642c1b65e9294bd892be1',
          },
        ).then((value) {
          sports = value.data['articles'];
          //print(business[0]['title']);
          emit(NewsGetSportsSuccessState());
        }).catchError((error) {

          print('Oops! you have Error ${error.toString()}');

          emit(NewsGetSportsErrorState(error.toString()));
        });

      }

    else
      {
        emit(NewsGetSportsSuccessState());
      }


  }


  List <dynamic> science = [];

  void getScience() {

    if(science.length == 0)
      {
        emit(NewsScienceLoadingState());

        DioHelper.getData(
          url: 'v2/top-headlines',
          query:
          {
            'country': 'eg',
            'category': 'science',
            'apiKey': '244a7282775642c1b65e9294bd892be1',
          },
        ).then((value) {
          science = value.data['articles'];
          //print(business[0]['title']);
          emit(NewsGetScienceSuccessState());
        }).catchError((error) {

          print('Oops! you have Error ${error.toString()}');

          emit(NewsGetScienceErrorState(error.toString()));
        });

      }
    else {
      emit(NewsGetScienceSuccessState());
    }


  }

  List <dynamic> search = [];

  void getSearch(String? value) {

    if(search.length ==0)

    {

      emit(NewsSearchLoadingState());

      DioHelper.getData(
        url: 'v2/everything',
        query:
        {
          'q': '$value',
          'apiKey': '244a7282775642c1b65e9294bd892be1',
        },
      ).then((value) {
        search = value.data['articles'];
        //print(business[0]['title']);
        emit(NewsGetSearchSuccessState());
      }).catchError((error) {

        print('Oops! you have Error ${error.toString()}');

        emit(NewsGetSearchErrorState(error.toString()));
      });

    }

    else
      {
        emit(NewsGetSearchSuccessState());
     }

  }






}