import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/layout/cubit/cubit.dart';
import 'package:news_app/layout/cubit/states.dart';
import 'package:news_app/shared/network/components/components.dart';

class BusinessScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsCubitStates>(
        listener: (context, state) => {},
        builder: (context, state) {
          var list = NewsCubit.get(context).business;
          return newsBuilder(list,context);
        });
  }
}
