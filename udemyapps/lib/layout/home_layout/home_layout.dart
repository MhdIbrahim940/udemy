import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:sqflite/sqflite.dart';
import 'package:udemyapps/shared/component/components.dart';
import 'package:udemyapps/shared/cubit/cubit.dart';
import 'package:udemyapps/shared/cubit/states.dart';




class HomeLayout extends StatelessWidget

{


  //AppCubit cubit = AppCubit.get(context);

  var scaffoldkey = GlobalKey<ScaffoldState>();
  var formkey = GlobalKey<FormState>();


  var titleController = TextEditingController();
  var timeController = TextEditingController();
  var dateController = TextEditingController();



  @override
  Widget build(BuildContext context) {

      //cubit AppCubit  AppCubit.get(context)

    return BlocProvider(
      create: (BuildContext context) => AppCubit()..createDatabase(),

      child: BlocConsumer <AppCubit , AppStates>
        (

        listener: (BuildContext context, state) {
          if (state is AppInsertDatabaseState)
          {  Navigator.pop(context); }
        },
        builder: (BuildContext context,  state) {

          AppCubit cubit = AppCubit.get(context);
          var tasks = AppCubit.get(context).newTasks;


          return Scaffold(

            key: scaffoldkey,
            backgroundColor: Colors.white,

            appBar: AppBar(
              title: Text (
                cubit.Titles[cubit.currentIndex],

              ),
              //backgroundColor: Color(0xFFF5CEB8),
              //backgroundColor: colos.kBlueLightVolor,
              //backgroundColor: Colors.lightBlueAccent,
              backgroundColor: Colors.lightBlue,
            ),

            body: AppCubit.get(context).newTasks.length ==0
                ? buildEmptyScreen()
                : cubit.Screens [cubit.currentIndex],

            //state is! AppGetDatabaseLodaingState(),
            //                   ? Center(child: CircularProgressIndicator())



            floatingActionButton: FloatingActionButton(
              onPressed:()
              {

                if(cubit.isBottomSheetShown)
                {
                  if (formkey.currentState!.validate())
                  {
                    
                    cubit.insertToDatabase(
                        title: titleController.text,
                        time: timeController.text,
                        date: dateController.text, );
                    
                    /*
                    insertToDatabase(
                      title: titleController.text,
                      time:  timeController.text,
                      date:  dateController.text,
                    ).then((value)
                    {


                      getDataFromDatabase(cubit.database).then((value)
                      {

                        tasks = value;
                        print (tasks);
                        //  ال back هو البيقفل لي اي شي بيقفل ال ( Drawer - BottomShite )
                        // Navigator.pop(context)
                        Navigator.pop(context);
                        isBottomSheetShown = false;
                        fabIcon = Icons.edit;

                      });
                    }); */

                  }
                }
                else
                {
                  scaffoldkey.currentState!.showBottomSheet(
                        (context) =>
                        Container(
                          color: Colors.white,
                          padding: EdgeInsets.all(20.0,),
                          child: Form(
                            key: formkey,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children:
                              [
                                TextFormField(
                                  controller: titleController ,
                                  keyboardType: TextInputType.text,
                                  validator: (String? value)
                                  {
                                    if (value !=null && value.isEmpty)
                                    {
                                      print ('title must not be empty');
                                    }
                                    {
                                      return null;
                                    }
                                  },
                                  decoration: const InputDecoration(
                                    hintText: 'Task Title',
                                    prefixIcon:  Icon ( Icons.title,),
                                    border: OutlineInputBorder(),
                                  ),
                                ),
                                const SizedBox(
                                  height: 15.0,
                                ),
                                TextFormField(
                                  onTap: ()
                                  {
                                    showTimePicker(
                                      context: context,
                                      initialTime: TimeOfDay.now(),
                                    ).then((value)
                                    {
                                      timeController.text = value!.format(context);
                                    }
                                    );
                                  },
                                  controller: timeController ,
                                  keyboardType: TextInputType.datetime,
                                  validator: (String? value) {
                                    if (value !=null && value.isEmpty)
                                    {
                                      print ('time must not be empty');
                                    }
                                    return null;
                                  },
                                  decoration: const InputDecoration(
                                    hintText: 'Task Date',
                                    prefixIcon:  Icon ( Icons.watch_later,),
                                    border: OutlineInputBorder(),
                                  ),
                                ),
                                const SizedBox(
                                  height: 15.0,
                                ),
                                TextFormField(
                                  onTap: ()
                                  {
                                    showDatePicker(
                                      context: context,
                                      initialDate: DateTime.now(),
                                      firstDate: DateTime.now(),
                                      lastDate: DateTime.parse('2021-12-31'),
                                    ).then((value)
                                    {
                                      dateController.text = DateFormat.yMMMd().format(value!);
                                    }
                                    );
                                  },
                                  controller: dateController ,
                                  keyboardType: TextInputType.datetime,
                                  validator: (String? value) {
                                    if (value !=null && value.isEmpty)
                                    {
                                      print ('date must not be empty');
                                    }
                                    return null;
                                  },

                                  decoration: const InputDecoration(
                                    hintText: 'Task Date',
                                    prefixIcon:  Icon ( Icons.calendar_today,),
                                    border: OutlineInputBorder(),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                    elevation: 20.0,
                  ).closed.then((value)
                  {
                   cubit.changeBottomSheetState(isShow: false, icon: Icons.edit,);

                  }
                  );
                  cubit.changeBottomSheetState(isShow: true, icon: Icons.add,);

                }
              },
              backgroundColor: Colors.lightBlue,
              child: Icon (
                cubit.fabIcon,
              ),
            ),

            bottomNavigationBar: BottomNavigationBar(
              // currentIndex: ,
              type: BottomNavigationBarType.fixed,
              backgroundColor: Colors.lightBlue,
              selectedItemColor: Colors.white,
              unselectedItemColor: Colors.grey[600],
              elevation: 0.0,
              currentIndex: cubit.currentIndex,
              onTap: (index)
              {
                cubit.ChangeIndex(index);
              },
              items: [
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.menu,
                  ),
                  label: 'Tasks',
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.check_circle_outline_outlined,
                  ),
                  label: 'Done',
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.archive_outlined,
                  ),
                  label: 'Archive',
                ),
              ],
            ),
          );
        },

      ),
    );
  }


  /*
  void createDatabase() async
  {
    database = await openDatabase(
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

        print('DataBase Opening');
      },

    );

  }

  Future  insertToDatabase(
      {
        required String title,
        required String time,
        required String date,

      }) async
  {
    return await database.transaction((txn) {
      return  txn.rawInsert(
          'insert into tasks (  title    ,  time     ,    date    ,   status ) '
              ' values       ("${title}" , "${time}" , "${date}"  ,   "new" ) '
      ).then((value)
      {
        print (' $value Inserted successfully');
      }).catchError((error) {
        print ('Error when inserting new record ${error.toString()}');
      } );
      // return  null;
    });
  }


  Future <List<Map>> getDataFromDatabase(database) async
  {
    return await database.rawQuery('select * from tasks');

  }

   */

}




