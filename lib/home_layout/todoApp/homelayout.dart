import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:recpie/Bloc/Cubit.dart';
import 'package:recpie/Bloc/States.dart';
import 'package:recpie/componaa/fild.dart';
import 'package:recpie/sherd/filess.dart';
import 'package:sqflite/sqflite.dart';
class homeloyout extends StatelessWidget {

  var KeyScaffold=GlobalKey<ScaffoldState>();
  var KeyForm=GlobalKey<FormState>();

  var string =TextEditingController();
  var dataTime =TextEditingController();
  var taskdata =TextEditingController();


  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context)=>Appcubit()..creatdatabase(),
      child: BlocConsumer<Appcubit,AppStates>(
        listener: (context, state){
          if (state is AppInsertDatabase){
            Navigator.pop(context);
          }
        },
        builder: (context, state){
          Appcubit Cubit=Appcubit.get(context);
          return Scaffold(
            key:KeyScaffold,
            appBar:AppBar(title:Text(Appcubit.get(context).Titles[Appcubit.get(context).currentindex]),centerTitle: true,),
            floatingActionButton:FloatingActionButton(
              child:Icon(Cubit.fibIcons),
              onPressed: (){
                if (Cubit.isbuttonshetShow ){
                  if (KeyForm.currentState.validate()){
                    Cubit.insertdatabase(title:string.text , data:dataTime.text, time:taskdata.text);
                   //insertdatabase(title:, data:,time :).then((value) {
                      //
                      //isbuttonshetShow=false;
                      // setState(() {
                      // fibIcons=Icons.edit;
                      //});
                  }
                } else {
                  KeyScaffold.currentState.showBottomSheet((context) => Container(
                    color: Colors.white,
                    padding:EdgeInsets.all(20.0),
                    child: Form(
                      key: KeyForm,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          importForm(
                            controller:string,
                            Text:"Task Title" ,
                            Keybord :TextInputType.text,
                            valudat:(String value){
                              if (value.isEmpty){
                                return ("the Text Form Must be Not Empty");
                              }
                              return null;
                            },
                            Iconsss:Icons.title,),
                          SizedBox(
                            height: 15,
                          ),
                          importForm(
                            controller:dataTime,
                            Text:"Task Time" ,
                            Keybord :TextInputType.datetime,
                            valudat:(String value){
                              if (value.isEmpty){
                                return ("the time Form Must be Not Empty");
                              }
                              return null;
                            },
                            Iconsss:Icons.watch_later_outlined,
                            onTap: (){
                              showTimePicker(
                                  context: context,
                                  initialTime: TimeOfDay.now()).then(
                                      (value) {
                                    dataTime.text=value.format(context).toString();
                                    print (value.format(context));
                                  });
                            },
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          importForm(
                            controller:taskdata,
                            Text:"Task Data" ,
                            Keybord :TextInputType.datetime,
                            valudat:(String value){
                              if (value.isEmpty){
                                return ("the data Form Must be Not Empty");
                              }
                              return null;
                            },
                            Iconsss:Icons.calendar_today,
                            onTap: (){
                              showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime.now(),
                                lastDate:DateTime.parse("2021-12-31"),
                              ).then((value) {
                                taskdata.text=DateFormat.yMMMd().format(value);
                                print (value);
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                      elevation: 20.0
                  ).closed.then((value){
                    Cubit.IconfibButton(isButton:false,icon: Icons.edit);
                    //setState(() {
                    //fibIcons=Icons.edit;
                    //});
                  });
                  Cubit.IconfibButton(isButton: true, icon:Icons.add);
                  //setState(() {
                  //fibIcons=Icons.add;
                  //});

                }

              },
            ) ,
            //floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
            bottomNavigationBar:BottomNavigationBar(
              type:BottomNavigationBarType.fixed ,
              currentIndex:Cubit.currentindex,
              onTap: (index){
                Cubit.onchange(index);

              },
              items: [
                BottomNavigationBarItem(
                    icon:Icon(Icons.menu),
                    label: "New Tasks"
                ),
                BottomNavigationBarItem(
                  icon:Icon(Icons.check_circle_outline),
                  label: "Done Tasks",
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.archive),
                  label: "Archive Tasks",
                )
              ],
            ) ,
            body: ConditionalBuilder(
              condition:state is !Apploadingdatabase,
              builder:(context)=>Cubit.Screans[Cubit.currentindex],
              fallback:(context)=> Center(child:CircularProgressIndicator()) ,

            ),
          );
      },
      ),
    );
  }


}

