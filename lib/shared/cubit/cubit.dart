import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_com/shared/cubit/states.dart';
import '../../moduels/business/business_screen.dart';
import '../../moduels/health/health_screen.dart';
import '../../moduels/science/science_screen.dart';
import '../../moduels/settinges/settinges_screen.dart';
import '../../moduels/sports/sports_screen.dart';
import '../../moduels/technology/technology_screen.dart';
import '../network/local/cach_halper.dart';
import '../network/remote/dio_helper.dart';

class NewsCubit extends Cubit<NewsStates> {
  NewsCubit() : super(InitialNewsState());
  static NewsCubit get(context) => BlocProvider.of(context);
  int currentIndex = 0;
  List<BottomNavigationBarItem> bottomItems = [
    const BottomNavigationBarItem(
        label: 'All',
        icon: Icon(
          Icons.account_balance,
        )),
    const BottomNavigationBarItem(
        label: 'Science',
        icon: Icon(
          Icons.science,
        )),
    const BottomNavigationBarItem(
        label: 'Sports',
        icon: Icon(
          Icons.sports,
        )),
    const BottomNavigationBarItem(
        label: 'Health',
        icon: Icon(
          Icons.health_and_safety,
        )),
    const BottomNavigationBarItem(
        label: 'Technology',
        icon: Icon(
          Icons.military_tech,
        )),
  ];

  List<Widget> screens = [
    const BusinessNews(),
    const ScienceNews(),
    const SportsNews(),
    const HealthyNews(),
    const TechnologyNews(),
    const SettingsScreen(),
  ];
  void changeBottomNavBar(int index) {
    if (index == 1) {
      getScienceData();
    }
    if (index == 2) {
      getSportsData();
    }
    if (index == 3) {
      getHealthData();
    }
    if (index == 4) {
      getTechnologyData();
    }
    currentIndex = index;
    emit(BottomNavBarNewsState());
  }

  List<dynamic> general = [];
  List<dynamic> science = [];
  List<dynamic> sports = [];
  List<dynamic> health = [];
  List<dynamic> tech = [];
  List<dynamic> search = [];

//////////// getBusinessData /////////////
  void getBusinessData() {
    emit(GetBusinessDataLoadingState());
    // ignore: prefer_is_empty
    if (general.length == 0) {
      DioHelper.getData(url: 'v2/top-headlines', query: {
        'country': 'eg',
        'category': 'general',
        'apiKey': '0ec2a561fd4949cdb8cc32cd9b66a4a1',
      }).then((value) {
        general = value.data['articles'];
        // ignore: avoid_print
        print(general[0]['title']);
        emit(GetBusinessDataSuccessState());
      }).catchError((onError) {
        // ignore: avoid_print
        print(onError.toString());
        emit(GetBusinessDataErrorState(onError.toString()));
      });
    } else {
      emit(GetBusinessDataSuccessState());
    }
  }

//////////// getScienceData /////////////
  void getScienceData() {
    emit(GetScienceDataLoadingState());
    // ignore: prefer_is_empty
    if (science.length == 0) {
      DioHelper.getData(url: 'v2/top-headlines', query: {
        'country': 'eg',
        'category': 'science',
        'apiKey': '0ec2a561fd4949cdb8cc32cd9b66a4a1',
      }).then((value) {
        science = value.data['articles'];
        // ignore: avoid_print
        print(science[0]['title']);
        emit(GetScienceDataSuccessState());
      }).catchError((onError) {
        // ignore: avoid_print
        print(onError.toString());
        emit(GetScienceDataErrorState(onError.toString()));
      });
    } else {
      emit(GetScienceDataSuccessState());
    }
  }

//////////// getScienceData /////////////
  void getSportsData() {
    emit(GetSportsDataLoadingState());
// ignore: prefer_is_empty
    if (sports.length == 0) {
      DioHelper.getData(url: 'v2/top-headlines', query: {
        'country': 'eg',
        'category': 'sports',
        'apiKey': '0ec2a561fd4949cdb8cc32cd9b66a4a1',
      }).then((value) {
        sports = value.data['articles'];
        // ignore: avoid_print
        print(sports[0]['title']);
        emit(GetSportsDataSuccessState());
      }).catchError((onError) {
        // ignore: avoid_print
        print(onError.toString());
        emit(GetSportsDataErrorState(onError.toString()));
      });
    } else {
      emit(GetSportsDataSuccessState());
    }
  }

//////////// getHealthyData /////////////
  void getHealthData() {
    emit(GetHealthDataLoadingState());
    // ignore: prefer_is_empty
    if (health.length == 0) {
      DioHelper.getData(url: 'v2/top-headlines', query: {
        'country': 'eg',
        'category': 'health',
        'apiKey': '0ec2a561fd4949cdb8cc32cd9b66a4a1',
      }).then((value) {
        health = value.data['articles'];
        // ignore: avoid_print
        print(health[0]['title']);
        emit(GetHealthDataSuccessState());
      }).catchError((onError) {
        // ignore: avoid_print
        print(onError.toString());
        emit(GetHealthDataErrorState(onError.toString()));
      });
    } else {
      emit(GetHealthDataSuccessState());
    }
  }

//////////// getTechnologyData /////////////
  void getTechnologyData() {
    emit(GetTechnologyDataLoadingState());
    // ignore: prefer_is_empty
    if (tech.length == 0) {
      DioHelper.getData(url: 'v2/top-headlines', query: {
        'country': 'eg',
        'category': 'technology',
        'apiKey': '0ec2a561fd4949cdb8cc32cd9b66a4a1',
      }).then((value) {
        tech = value.data['articles'];
        // ignore: avoid_print
        print(tech[0]['title']);
        emit(GetTechnologyDataSuccessState());
      }).catchError((onError) {
        // ignore: avoid_print
        print(onError.toString());
        emit(GetTechnologyDataErrorState(onError.toString()));
      });
    } else {
      emit(GetTechnologyDataSuccessState());
    }
  }

  void getSearchData(String value) {
    emit(GetSearchDataLoadingState());
    search=[];
    DioHelper.getData(url: 'v2/everything', query: {
      // ignore: unnecessary_string_interpolations
      'q': '$value',
      'apiKey': '0ec2a561fd4949cdb8cc32cd9b66a4a1'
    }).then((value) {
      search = value.data['articles'];
      // ignore: avoid_print
      print(search[0]['title']);
      emit(GetSearchDataSuccessState());
    }).catchError((onError) {
      // ignore: avoid_print
      print(onError.toString());
      emit(GetSearchDataErrorState(onError.toString()));
    });
  }
}

class ThemeCubit extends Cubit<NewsStates> {
  ThemeCubit() : super(InitialNewsState());

  static ThemeCubit get(context) => BlocProvider.of(context);

  bool isDark = false;

  ThemeMode darkTheme = ThemeMode.dark;
  void changeMode({bool? fromShard}) {
    if (fromShard != null) {
      isDark = fromShard;
      emit(ChangeModeState());
    } else {
      isDark = !isDark;
      CacheHelper.putBoolean(key: 'isDark', value: isDark).then((value) {
        emit(ChangeModeState());
      });
    }
  }
}
