import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recpie/Bloc/Cubit.dart';
import 'package:recpie/componaa/fild.dart';
import 'package:recpie/home_layout/newsApp/cubit.dart';
import 'package:recpie/home_layout/newsApp/states.dart';
import 'package:recpie/module/newsApp/search/search.dart';
import 'package:recpie/network/remote/dio_helper.dart';

class NewsApp extends StatelessWidget {
  @override
  int Currentindex=0;
  Widget build(BuildContext context) {
    return BlocConsumer<cubitApp,stateApp>(
      listener: (context,state){},
      builder: (context,state){
        var cubit=cubitApp.get(context);
        return Scaffold(
          bottomNavigationBar:BottomNavigationBar(
          currentIndex: cubit.Currentindex,
            onTap: (index){
            cubit.changeButtonNava(index);
          },
            items:cubit.buttonNav,
          ) ,
          appBar: AppBar(
            title: Text("NewsApp"),
            actions: [
              IconButton(
                  icon:Icon(Icons.search), onPressed:(){
                navigato(context,search());
              }),
              IconButton(icon:Icon(Icons.brightness_4_outlined) , onPressed: (){
                Appcubit.get(context).themModa();
              })

            ],
          ),
          body:cubit.Screnns[cubit.Currentindex],
        );
      },
    );
  }
}
