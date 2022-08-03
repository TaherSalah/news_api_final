import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_com/shared/cubit/cubit.dart';

import '../shared/components/component.dart';
import '../shared/cubit/states.dart';

class AboutMeScreen extends StatelessWidget {
  const AboutMeScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(),
            body: Center(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const CircleAvatar(
                      radius: 80.0,
                      backgroundImage: NetworkImage(
                          'https://lh3.googleusercontent.com/a-/AFdZucpBPpALDMXwt6X9Vvm5YYzwgM-FguCeINE0Br5XoKI=s360-p-rw-no'),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    const Text(
                      'Taher Salah',
                      style: TextStyle(
                          fontFamily: 'DancingScript',
                          color: Colors.deepOrange,
                          fontWeight: FontWeight.bold,
                          fontSize: 30.0),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    Text('Mobil Developer | flutter ',
                        style: Theme.of(context).textTheme.bodyText1),
                    const SizedBox(
                      height: 20.0,
                    ),
                    myDividerAboutLarge(),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('About This Application',
                          style: Theme.of(context).textTheme.bodyText2),
                    ),
                    myDividerAboutSmall(),
                    Container(
                      padding: const EdgeInsets.all(20.0),
                      child: Text(
                        'Follow the latest news, see news in your favorite category, '
                        'do a more specific search or even save news to read when you have time!'
                        ' The app was built using Mobx for state management and Flutter Modular for dependency'
                        ' injection. Data from the NewsAPI.',
                        style: Theme.of(context).textTheme.bodyText1,
                        textAlign: TextAlign.justify,
                      ),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    myDividerAboutLarge(),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('Features',
                          style: Theme.of(context).textTheme.bodyText2),
                    ),
                    myDividerAboutSmall(),
                    Column(
                      children: [
                        defualtCheckBox(
                            text: 'List daily news',
                            icon: Icons.toc,
                            context: context),
                        defualtCheckBox(
                            text: 'News Home page',
                            icon: Icons.home,
                            context: context),
                        defualtCheckBox(
                            text: 'Refresh list daily news ',
                            icon: Icons.refresh,
                            context: context),
                        defualtCheckBox(
                            text: 'Search news.',
                            icon: Icons.search,
                            context: context),
                        defualtCheckBox(
                            text: 'Dark mode support.',
                            icon: Icons.brightness_4,
                            context: context),
                        defualtCheckBox(
                            text: 'Go to detail news website.',
                            icon: Icons.web_outlined,
                            context: context),
                        defualtCheckBox(
                            text: 'Live News.',
                            icon: Icons.newspaper,
                            context: context),
                        defualtCheckBox(
                            text: 'Find With Keyword',
                            icon: Icons.find_in_page,
                            context: context),
                        defualtCheckBox(
                            text: 'Display full news detail',
                            icon: Icons.details,
                            context: context),
                      ],
                    ),
                    myDividerAboutLarge(),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('License',
                          style: Theme.of(context).textTheme.bodyText2),
                    ),
                    myDividerAboutSmall(),
                    Container(
                      padding: const EdgeInsets.all(20.0),
                      child: Text(
                        'Copyright  August 2022 All Rights Reserved by Taher Salah , Version 1.0 (the "License")'
                        'you may not use this file except in compliance with the License',
                        style: Theme.of(context).textTheme.bodyText1,
                        textAlign: TextAlign.justify,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
