

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:udemyapps/layout/news_app/cubit/cubit.dart';
import 'package:udemyapps/layout/news_app/cubit/states.dart';
import 'package:udemyapps/shared/component/components.dart';


class ScienceScreen  extends StatelessWidget {



  @override
  Widget build(BuildContext context) {

    return BlocConsumer <NewsCubit, NewsStates>(
      listener: (context,state) {},
      builder: (context,state) {

        var List = NewsCubit.get(context).science;

        return articleBuilder(List, context);
      },


    );
  }
}
