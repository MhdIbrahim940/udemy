

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
//import 'package:udemy_apps/layout/news_app/cubit/cubit.dart';
//import 'package:udemy_apps/layout/news_app/cubit/states.dart';
//import 'package:udemy_apps/shared/component/components.dart';
import 'package:udemyapps/layout/news_app/cubit/cubit.dart';
import 'package:udemyapps/layout/news_app/cubit/states.dart';
import 'package:udemyapps/shared/component/components.dart';

class Searchscreen extends StatelessWidget {

  var searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit , NewsStates> (
      listener: (context, state) {},
      builder: (context, state) {

        var List = NewsCubit.get(context).search;
        return Scaffold(
          appBar: AppBar(),
          body: Column(
            children: [

            Padding(
              padding: const EdgeInsets.all(20.0),
              child: defaultFormField(
                context: context,
                controller: searchController,
              type: TextInputType.text,
              //  مع كل change اروح اعمل بحث
              onChange: (value)
              {
                NewsCubit.get(context).getSearch(value);
              } ,
              lable: 'Search',
              prefix: Icons.search_sharp,
          ),
            ),

            const SizedBox(
            width: 15,
          ),

            Expanded  (
              child:
              articleBuilder(List, context, isSearch: true),
          ),

          ],
          ),
        );

      },

    );
  }
}
