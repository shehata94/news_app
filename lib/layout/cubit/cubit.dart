
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/layout/cubit/states.dart';
import 'package:news_app/modules/business/business_Screen.dart';
import 'package:news_app/modules/science/science_screen.dart';
import 'package:news_app/modules/sports/sports_screen.dart';
import 'package:news_app/shared/network/local/cache_helper.dart';
import 'package:news_app/shared/network/remote/dio_helper.dart';

class NewsCubit extends Cubit<NewsCubitStates> {

  NewsCubit():super(NewsCubitInitState());

  static NewsCubit get(BuildContext context) => BlocProvider.of(context);

  bool isDark = CacheHelper.getBool(key: 'isDark')??false;

  void changeThemeMode()
  {
    isDark =! isDark;
    CacheHelper.setBool(key: 'isDark', value: isDark).then((value) =>  emit(AppThemeMode()));
    print(CacheHelper.getBool(key: 'isDark'));


  }

  List<BottomNavigationBarItem> bottomItems = [
    BottomNavigationBarItem(icon: Icon(Icons.business),label: 'Business'),
    BottomNavigationBarItem(icon: Icon(Icons.sports),label: 'Sports'),
    BottomNavigationBarItem(icon: Icon(Icons.science),label: 'Science'),
    //BottomNavigationBarItem(icon: Icon(Icons.settings),label: 'Settings'),
  ];

  int currentIndex =0;

  List<Widget> screens =[
    BusinessScreen(),
    SportsScreen(),
    ScienceScreen(),
   // SettingsScreen(),
  ];

  void changeBottomNavBar(int index){
    currentIndex = index;
    emit(BottomNavBarState());

  }
  Map<String, dynamic> queryBusiness = {
    'country': 'us',
    'category': 'business',
    'apiKey': '4da879aee1c74273896172c3698f4bc0',
  };

  List<dynamic> business =[];

  void getBusinessData()
  {
    emit(BusinessGetDataLoadingState());
    DioHelper.getData(path: 'v2/top-headlines', query: queryBusiness)
        .then((value) {
          emit(BusinessGetDataSuccessState());
          business = value.data['articles'];
          print(business[0]['title'].toString());
    } )
        .catchError((error) {
      print(error.toString());
      emit(BusinessGetDataErrorState(error.toString()));
    });
  }

  Map<String, dynamic> querySports = {
    'country': 'us',
    'category': 'sports',
    'apiKey': '4da879aee1c74273896172c3698f4bc0',
  };

  List<dynamic> sports =[];

  void getSportsData()
  {
    emit(SportsGetDataLoadingState());
    DioHelper.getData(path: 'v2/top-headlines', query: querySports)
        .then((value) {
      emit(SportsGetDataSuccessState());
      sports = value.data['articles'];
      print(sports[0]['title'].toString());
    } )
        .catchError((error) {
      print(error.toString());
      emit(SportsGetDataErrorState(error.toString()));
    });
  }
  Map<String, dynamic> queryScience = {
    'country': 'us',
    'category': 'science',
    'apiKey': '4da879aee1c74273896172c3698f4bc0',
  };

  List<dynamic> science =[];

  void getScienceData()
  {
    emit(ScienceGetDataLoadingState());
    DioHelper.getData(path: 'v2/top-headlines', query: queryScience)
        .then((value) {
      emit(ScienceGetDataSuccessState());
      science = value.data['articles'];
      print(science[0]['title'].toString());
    } )
        .catchError((error) {
      print(error.toString());
      emit(ScienceGetDataErrorState(error.toString()));
    });
  }

  List<dynamic> search =[];

  void getSearch({@required String value})
  {
    emit(SearchGetDataLoadingState());
    DioHelper.getData(path: 'v2/everything', query: {
      'q':'$value',
      'apiKey': '4da879aee1c74273896172c3698f4bc0',
    })
        .then((value) {
      emit(SearchGetDataSuccessState());
      search = value.data['articles'];
      print(search[0]['title'].toString());
    } )
        .catchError((error) {
      print(error.toString());
      emit(SearchGetDataErrorState(error.toString()));
    });
  }

}
