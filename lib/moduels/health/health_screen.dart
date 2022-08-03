import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_conditional_rendering/conditional.dart';

import '../../shared/components/component.dart';
import '../../shared/cubit/cubit.dart';
import '../../shared/cubit/states.dart';

class HealthyNews extends StatelessWidget {
  const HealthyNews({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit,NewsStates>(
        listener: (context,state)=>{},
        builder: (context,state){
          var list =NewsCubit.get(context).health;
          return articlesBuilderItems(list, context);
        }

    );
  }
}
