


import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:udemyapps/modules/seach/search_screen.dart';
import 'package:udemyapps/shared/component/components.dart';
import 'package:udemyapps/shared/cubit/cubit.dart';


import 'cubit/cubit.dart';
import 'cubit/states.dart';

class NewsLayout extends StatelessWidget {

  IconData iconMode = Icons.nightlight_round;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates >(
      listener: (context, state) {},
      builder: (context, state) {

        var cubit =NewsCubit.get(context);

        return  Scaffold(
          appBar: AppBar(
            title: const Text(
              'News App',
            ),

            actions: [
              IconButton(
                  onPressed: (){
                    NavigatTo(
                      context,
                      Searchscreen(),
                    );
                  },
                  icon: const Icon(
                    Icons.search,
                  ),
              ),
                IconButton(
                    onPressed: (){
                      AppCubit.get(context).changeAppMode();
                    },
                    icon: Icon(
                        iconMode,
                    ),
                ),
            ],
          ),

          body: cubit.Screens[cubit.currentIndex],


          bottomNavigationBar : BottomNavigationBar(

            currentIndex: cubit.currentIndex,

            onTap: (index) {
              cubit.changeBottomIndex(index);
            },

            items: [
              BottomNavigationBarItem(
                icon:
                Icon(Icons.business_outlined,
                ),
                label: 'Business',
              ),
              BottomNavigationBarItem(
                icon:
                Icon(Icons.sports_sharp,
                ),
                label: 'Sports',
              ),
              BottomNavigationBarItem(
                icon:
                Icon(Icons.science_outlined,
                ),
                label: 'Science',
              ),
            ],
          ),
        );
      },

    );
  }
}
