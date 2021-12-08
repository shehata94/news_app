import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/layout/cubit/cubit.dart';
import 'package:news_app/layout/cubit/states.dart';
import 'package:news_app/shared/network/components/components.dart';

class SearchScreen extends StatelessWidget {

  var searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit,NewsCubitStates>(
      listener: (context, state){},
      builder: (context,state){
        var list = NewsCubit.get(context).search;
        return  Scaffold(
          appBar: AppBar(),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: defaultTextForm(
                    controller: searchController,
                    inputType: TextInputType.text,
                    prefix: Icons.search,
                    label: 'Search',
                    onChange: (value){
                      NewsCubit.get(context).getSearch(value: value);
                    }
                ),
              ),
              Expanded(child: newsBuilder(list, context)),
            ],
          ),
        );
      },

    );
  }
}
