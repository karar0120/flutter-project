import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recpie/Bloc/Cubit.dart';
import 'package:recpie/Bloc/States.dart';
import 'package:recpie/componaa/fild.dart';

class DoneTasks extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocConsumer<Appcubit,AppStates>(
          listener: (context,state){},
          builder: (context,state){
            var tasks=Appcubit.get(context).DoneTaskss;
            return taskBulider(tasks: tasks);
          },
        )
    );
  }
}
