

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sqflite/sqflite.dart';
import 'package:udemyapps/modules/archive_tasks/archive_tasks_screen.dart';
import 'package:udemyapps/modules/done_tasks/done_tasks_screen.dart';
import 'package:udemyapps/modules/new_tasks/new_tasks_screen.dart';
import 'package:udemyapps/shared/cubit/states.dart';
import 'package:udemyapps/shared/networks/local/cach_helper/cach_helper.dart';


class AppCubit extends Cubit <AppStates>
{
  AppCubit() : super(AppInitialState());

  static AppCubit get(context) => BlocProvider.of(context);



  int currentIndex = 0;
  late Database database;
  bool isBottomSheetShown = false;
  IconData fabIcon = Icons.edit;
  List<Map> newTasks = [];
  List<Map> doneTasks = [];
  List<Map> archiveTasks = [];





  List <Widget> Screens =
  [
    NewTasksScreen(),
    DoneTasksScreen(),
    ArchiveTasksScreen(),
  ];

  List <String> Titles =
  [
    'NewTasks',
    'DoneTasks',
    'ArchiveTasks',
  ];


  void ChangeIndex (int index)
  {
    currentIndex = index;
    emit(AppChangeBottomNavBarState());
  }



  void createDatabase()
  {
     openDatabase(
      'todo.db',
      version: 1,

      onCreate: (database, version)
      {
        print('DataBase Created');
        database.execute(
            'create table tasks(id INTEGER PRIMARY KEY, title TEXT,date TEXT, time TEXT, status TEXT)'
        ).then((value){
          print('Table Created');
        }).catchError((error){
          print('Error when created table ${error.toString()}');
        });
      },

      onOpen: (database)
      {
        getDataFromDatabase(database);

        print('Database opened');
      },

    ).then((value)
     {
       database = value;
       emit(AppCreateDatabaseState());
     });

  }

 void  insertToDatabase(
      {
        required String title,
        required String time,
        required String date,

      }) async {
   await database.transaction((txn) {
      return  txn.rawInsert(
          'insert into tasks (  title    ,  time     ,    date    ,   status ) '
              ' values       ("${title}" , "${time}" , "${date}"  ,   "new" ) '
      ).then((value)
      {
        print (' $value Inserted successfully');
        emit(AppInsertDatabaseState());

        getDataFromDatabase(database);

      }).catchError((error) {
        print ('Error when inserting new record ${error.toString()}');
      } );
      // return  null;
    });
  }


  void getDataFromDatabase(database)
  {

    newTasks = [];
    doneTasks = [];
    archiveTasks = [];


    emit (AppGetDatabaseLoadingState());
     database.rawQuery('select * from tasks').then((value) {

       value.forEach((element)
       {
         if (element['status'] == 'new')
           newTasks.add(element);
         else if (element['status'] == 'done')
           doneTasks.add(element);
         else archiveTasks.add(element);
       });

       emit(AppGetDatabaseState());
     });

  }

  void updateData(
  {
    required String status,
    required int id,
  }
      )
  {
  database.rawUpdate( 'update tasks set status = ? where id = ?',
    ['$status' , id ]).then((value)
  {

    getDataFromDatabase(database);
    emit(AppUpdateDatabaseState());
  });

  }


  void deleteData(
      {
        required int id,
      }) async
  {
    database.rawDelete('delete from tasks where id = ?',
        [id]).then((value)
    {
      emit(AppDeleteDatabaseState());
      getDataFromDatabase(database);
    });
  }


      /* .then((value)
    {

      getDataFromDatabase(database);
      emit(AppDeleteDatabaseState());
    }); */



  void changeBottomSheetState (
  {
    required bool isShow,
    required IconData icon,
  })
  {
    isBottomSheetShown = isShow;
    fabIcon = icon;

    emit(AppChangeBottomSheetState());
  }


  bool isdark = false ;
  IconData iconMode = Icons.nightlight_round; //Icon(Icons.nightlight_round);

  void changeAppMode( { bool? fromShared} ) {
    if (fromShared != null) {
      isdark = fromShared;
      emit(AppChangeModeState());
    }
    else {
      isdark = !isdark;
      CacheHelper.putBoolean(key: 'isdark', value: isdark).then((value) {
        emit(AppChangeModeState());
      });
    }
  }


}