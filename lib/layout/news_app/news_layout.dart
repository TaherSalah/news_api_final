import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_com/moduels/search/search_screen.dart';
import 'package:news_com/shared/cubit/cubit.dart';
import '../../about_me/about_me_screen.dart';
import '../../shared/components/component.dart';
import '../../shared/cubit/states.dart';
class NewsLayout extends StatelessWidget {
  const NewsLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = NewsCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              title: const Text(
                'News App',
                style: TextStyle(
                    fontFamily: 'DancingScript', fontWeight: FontWeight.bold),
              ),
              actions: [
                IconButton(
                    onPressed: () {
                      navigateTo(context, SearchScreen());
                    },
                    icon: const Icon(Icons.search)),
                IconButton(
                    onPressed: () {
                      ThemeCubit.get(context).changeMode();
                    },
                    icon: const Icon(Icons.brightness_4_outlined)),
                IconButton(
                    onPressed: () {
                      navigateTo(context, const AboutMeScreen());
                    },
                    icon: const Icon(Icons.person)),
              ],
            ),
            bottomNavigationBar: BottomNavigationBar(
              unselectedLabelStyle:
                  const TextStyle(fontSize: 10.5, fontWeight: FontWeight.w500),
              selectedIconTheme: const IconThemeData(color: Colors.deepOrange),
              selectedItemColor: Colors.orange,
              type: BottomNavigationBarType.fixed,
              items: cubit.bottomItems,
              currentIndex: cubit.currentIndex,
              onTap: (index) {
                cubit.changeBottomNavBar(index);
              },
            ),
            body: cubit.screens[cubit.currentIndex],
          );
        });
  }
}
