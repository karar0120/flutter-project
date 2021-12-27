
// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recpie/componaa/fild.dart';
import 'package:recpie/module/shopApp/Search/Search.dart';
import 'package:recpie/module/shopApp/bloc/cubit/Shoplayout_Cubit.dart';
import 'package:recpie/module/shopApp/bloc/states/Shoplayout_States.dart';
import 'package:recpie/module/shopApp/cubit/cubit.dart';
import 'package:recpie/module/shopApp/cubit/states.dart';
import 'package:recpie/module/shopApp/loginScreen/ShopLogin.dart';
import 'package:recpie/network/locol/sherdhelp.dart';

class ShopLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<layoutCubit,LayoutStates>(
      listener: (context,state){},
      builder: (context,state){

        var cubitss =layoutCubit().get(context);

        return Scaffold(
          appBar: AppBar(
            title: Text("Salla"),
            actions: [
                      IconButton(
                          onPressed: (){
                            navigato(context, ShopSearch());
                          },
                          icon: Icon(Icons.search),)
            ],
          ),
          body: cubitss.Screans[cubitss.currentindex],
          bottomNavigationBar:BottomNavigationBar(
            currentIndex: cubitss.currentindex,
            onTap: (index){
               cubitss.ChangeValue(index);
            },
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.home),
            label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(Icons.apps),
                label: 'Categories'),
            BottomNavigationBarItem(
                icon: Icon(Icons.favorite_border),
                label: 'Favorite'),
            BottomNavigationBarItem(
                icon: Icon(Icons.settings),
                label: 'Settings'),
          ],
          ),
        );
      },
    );
  }
}
