
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recpie/componaa/fild.dart';
import 'package:recpie/module/shopApp/Search/Bloc/cubit.dart';

import 'Bloc/state.dart';

class ShopSearch extends StatelessWidget {
  var Forrr=GlobalKey<FormState>();
  var searchcontroller=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context)=>searchcubit(),

        child:BlocConsumer<searchcubit,searchstate>(
          listener: (context,state){},
          builder: (context,state){
            return Scaffold(
              appBar: AppBar(),
              body: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Form(
                  key:Forrr,
                  child: Column(
                    children: [
                      importForm(
                          controller: searchcontroller,
                          Text: "Search",
                          valudat: (String value){
                            if (value.isEmpty){
                              return ("Please Enter Proudects You Need To Search");
                            }
                          },
                          Iconsss: Icons.search,
                          Keybord: TextInputType.text,
                        onSubmit: (String text){
                            searchcubit.get(context).getsearch(text: text);
                        }
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      if (state is lodingSearchstate)
                        LinearProgressIndicator(),
                      if (state is EnterSearchstate)
                      Expanded(
                        child: ListView.separated(
                          itemBuilder: (context,index)=>ListItem(searchcubit.get(context).modal.data.data[index],context,old_prise: false),
                          separatorBuilder: (context,index)=>decor(),
                          itemCount: searchcubit.get(context).modal.data.data.length),
                      ),
                    ],
                  ),
                ),
              ),
            );

          },
        )
    );
  }
}
