
//import 'dart:js';

import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recpie/componaa/fild.dart';
import 'package:recpie/modal/socail%20App/create%20RIG.dart';
import 'package:recpie/module/Socail_App/ChatDetiles/Chat_Details.dart';
import 'package:recpie/module/Socail_App/homepage/bloc/cubit.dart';
import 'package:recpie/module/Socail_App/homepage/bloc/state.dart';
import 'package:recpie/style/color.dart';

class chat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SocailAppCubit,SocailAppState>(
      listener: (context,state){},
      builder: (context,state){
        return ConditionalBuilder(
          condition: SocailAppCubit.get(context).userss.length>0,
          builder: (context)=>ListView.separated(
              physics: BouncingScrollPhysics(),
              itemBuilder: (context,index)=>Chatitem(SocailAppCubit.get(context).userss[index],context),
              separatorBuilder: (context,index)=>decor(),
              itemCount: SocailAppCubit.get(context).userss.length),
          fallback: (context)=>Center(child: CircularProgressIndicator()),
        );
      },
    );

  }

  Widget Chatitem(createmoda modall,context)=>InkWell(
    onTap: (){
      navigato(context, Chat_Detailes(moda: modall));
    },
    child: Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            CircleAvatar(
              radius: 25,
              backgroundImage:NetworkImage("${modall.image}"),
            ),
            SizedBox(
              width: 20.0,
            ),
            Text("${modall.name}",style: TextStyle(height: 1.4),)
          ]
      ),
    ),
  );
}
