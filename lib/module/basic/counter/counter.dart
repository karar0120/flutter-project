import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class counter extends StatelessWidget {
  int c=2;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context)=>countercubit(),
        child: BlocConsumer<countercubit,counterState>(
          listener: (context,state){},
          builder: (context,state){
            return Scaffold(
              appBar: AppBar(title: Text("Counter",style: TextStyle(fontWeight:FontWeight.bold),),),
              body: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:<Widget> [
                    MaterialButton(
                        child: Text("Plus",),
                        onPressed: (){
                          countercubit.get(context).plus();
                        }
                    ),
                    SizedBox(
                      width: 25,
                    ),
                    Text("${countercubit.get(context).counter}",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 50),),
                    SizedBox(
                      width: 25,
                    ),
                    MaterialButton(
                        child: Text("Mins",),
                        onPressed: (){
                          countercubit.get(context).Mins();
                        }
                    ),
                  ],
                ),
              ),
            );
          },

        ),
    );
  }
}





















/*import 'package:flutter/material.dart';
import 'package:flutter_app/cubit/cabit.dart';
import 'package:flutter_app/cubit/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class counter extends StatelessWidget {
  @override
  var c=1;
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context)=>CounterCubit(),
        child: BlocConsumer<CounterCubit,CounterState>(
          listener: (context,state){},
          builder: (context,state){
            return Scaffold(
              appBar: AppBar(title: Text("Counter"),
                centerTitle: true,
              ),
              body: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:<Widget> [
                    IconButton(
                        icon: Icon(Icons.add),
                        onPressed:(){
                          CounterCubit.get(context).mix();
                        }),
                    Text("${CounterCubit.get(context).counter}",style: TextStyle(fontSize: 50,fontWeight:FontWeight.bold),),
                    IconButton(icon: Icon(Icons.remove), onPressed: (){
                      CounterCubit.get(context).min();
                    })
                  ],
                ),
              ),
            );
          },
        ),
      );
  }
}
*/