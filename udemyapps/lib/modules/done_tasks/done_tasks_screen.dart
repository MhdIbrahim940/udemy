




import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:udemyapps/shared/component/components.dart';
import 'package:udemyapps/shared/cubit/cubit.dart';
import 'package:udemyapps/shared/cubit/states.dart';


class DoneTasksScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocConsumer <AppCubit , AppStates> (
      listener: (context, state) {  },
      builder: (context, Object? state) {
        var tasks = AppCubit.get(context).doneTasks;

        return  tasks.length >0 ? ListView.separated(
          itemBuilder: (context,index) => buildTaskItem(tasks[index], context),
          separatorBuilder: (context , index) => Padding(
            padding: const EdgeInsetsDirectional.only(
              start: 20.0,
            ),
            child: Container (
              width: double.infinity,
              height: 1,
              color: Colors.grey[300],
            ),
          ),
          itemCount: tasks.length,)  : buildEmptyScreen() ;
      },

    );

  }
}
