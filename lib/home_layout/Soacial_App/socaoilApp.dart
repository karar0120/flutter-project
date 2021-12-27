
import 'dart:ffi';

import 'package:conditional_builder/conditional_builder.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recpie/componaa/fild.dart';
import 'package:recpie/module/Socail_App/homepage/bloc/cubit.dart';
import 'package:recpie/module/Socail_App/homepage/bloc/state.dart';

import 'package:recpie/module/Socail_App/newPost/sss.dart';
import 'package:recpie/style/Icon.dart';

class Socaillayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return BlocConsumer<SocailAppCubit,SocailAppState>(
      listener:(context,state){
        if (state is NewPostSocailAppState){
          navigato(context,NewPost());
        }
      },
      builder: (context,state){
        var cubit=SocailAppCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title: Text(cubit.TextAppBar[cubit.Currentindex]),
            actions: [
              IconButton(onPressed: (){}, icon:Icon(IconBroken.Notification)),
              IconButton(onPressed: (){}, icon:Icon(IconBroken.Search))
            ],
          ),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: SocailAppCubit.get(context).Currentindex ,
            onTap: (int index){
              SocailAppCubit.get(context).ChangeNavSocailApp(index);
            },
            items: [
              BottomNavigationBarItem(
                  icon:Icon(IconBroken.Home),
                label: "Home",
              ),
              BottomNavigationBarItem(
                icon:Icon(IconBroken.Chat),
                label: "Chat",
              ),
              BottomNavigationBarItem(
                icon:Icon(IconBroken.Paper_Upload),
                label: "Post",
              ),
              BottomNavigationBarItem(
                icon:Icon(IconBroken.User),
                label: "Users",
              ),
              BottomNavigationBarItem(
                icon:Icon(IconBroken.Setting),
                label: "Setting",
              ),
            ],
          ),
          body:cubit.Screans[cubit.Currentindex],
        );
      },
    );
  }
}
