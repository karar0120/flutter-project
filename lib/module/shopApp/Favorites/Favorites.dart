



import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recpie/componaa/fild.dart';
import 'package:recpie/home_layout/newsApp/cubit.dart';
import 'package:recpie/modal/shopApp/getFavorites.dart';
import 'package:recpie/module/shopApp/bloc/cubit/Shoplayout_Cubit.dart';
import 'package:recpie/module/shopApp/bloc/states/Shoplayout_States.dart';
import 'package:recpie/style/color.dart';

class ShopFavorites extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<layoutCubit,LayoutStates>(
      listener: (context,state){},
      builder: (context,state){
        return ConditionalBuilder(
          condition:state is!FavloadingState ,
          builder: (context)=>ListView.separated(
            itemBuilder: (context,index)=>ListItem(layoutCubit().get(context).moth.data.data[index].product,context),
            separatorBuilder: (context,index)=>decor(),
            itemCount: layoutCubit().get(context).moth.data.data.length,),
          fallback: (context)=>Center(child: CircularProgressIndicator()),
        );
      },
    );
  }
}

