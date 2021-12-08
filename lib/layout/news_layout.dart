import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/layout/cubit/cubit.dart';
import 'package:news_app/modules/search/search_screen.dart';
import 'package:news_app/shared/network/components/components.dart';

import 'cubit/states.dart';

class NewsLayout extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsCubitStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = NewsCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title: Text('News App',style: Theme.of(context).textTheme.headline2,),
            actions: [
              IconButton(icon:Icon(Icons.search),onPressed: (){navigateTo(context, SearchScreen());},),
              SizedBox(width: 6,),
              IconButton(icon:Icon(Icons.brightness_4_outlined),onPressed: (){
                 NewsCubit.get(context).changeThemeMode();

              },),
            ],
          ),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: cubit.currentIndex,
            type: BottomNavigationBarType.fixed,
            items: cubit.bottomItems,
            onTap: (index) {
              cubit.changeBottomNavBar(index);
            },
          ),
          body: cubit.screens[cubit.currentIndex],

        );
      },
    );
  }
}
