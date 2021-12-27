

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recpie/componaa/fild.dart';
import 'package:recpie/home_layout/newsApp/cubit.dart';
import 'package:recpie/home_layout/newsApp/states.dart';

class search extends StatelessWidget {
  var texteditingcontorl=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<cubitApp,stateApp>(
      listener:(context,state){},
      builder: (context,state){
        var list=cubitApp.get(context).search;
        return Scaffold(
            appBar: AppBar(),
            body:Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: importForm(
                      controller: texteditingcontorl,
                      Text: 'Search',
                      valudat: (String value){
                        if (value.isEmpty){
                          return ("The Search Must be Not Empty");
                        }
                        return null;
                      },
                      Iconsss: Icons.search,
                      Keybord:TextInputType.text,
                    inChange: (value){
                         cubitApp.get(context).getssearch(value);
                    }
                  ),
                ),
                Expanded(child: articleBuilder(list,context)),

              ],
            )
        );
      },
    );
  }
}
