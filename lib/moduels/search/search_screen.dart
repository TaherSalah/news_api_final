import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../shared/components/component.dart';
import '../../shared/cubit/cubit.dart';
import '../../shared/cubit/states.dart';

// ignore: must_be_immutable
class SearchScreen extends StatelessWidget {
  SearchScreen({Key? key}) : super(key: key);
  var searchScreen = TextEditingController();
  @override
  Widget build(BuildContext context,) {
    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var list = NewsCubit.get(context).search;
        return Scaffold(
          appBar: AppBar(),
          body: Column(
            children: [
              defualtFormField(
                  onChanged: (value) {
                    NewsCubit.get(context).getSearchData(value);
                  },
                  controller: searchScreen,
                  type: TextInputType.text,
                  lable: 'Search',
                  prefix: Icons.search),
              Expanded(child: articlesBuilderItems(list, context,isSearch : true)),
            ],
          ),
        );
      },
    );
  }
}
