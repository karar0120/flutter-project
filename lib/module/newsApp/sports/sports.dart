import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recpie/componaa/fild.dart';
import 'package:recpie/home_layout/newsApp/cubit.dart';
import 'package:recpie/home_layout/newsApp/states.dart';
class sports extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<cubitApp,stateApp>(
        listener: (context,state){},
        builder: (context,state) {
          var list=cubitApp.get(context).sportss;
          return ConditionalBuilder(
            condition: list.length>0,
            builder: (context) => ListView.separated(
                physics: BouncingScrollPhysics(),
                itemBuilder:(context,index)=>BuildArticleItem(list[index],context),
                separatorBuilder: (context,index)=>decor(),
                itemCount: 20),
            fallback: (context) => Center(child: CircularProgressIndicator()),
          );
        }
    );
  }
}
