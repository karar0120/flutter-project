import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recpie/Bloc/States.dart';
import 'package:recpie/module/todoApp/Arcive/Archive%20Tasks.dart';
import 'package:recpie/module/todoApp/DOne/Done%20Tasks.dart';
import 'package:recpie/module/todoApp/NewTask/New%20Tasks.dart';
import 'package:recpie/network/locol/sherdhelp.dart';
import 'package:recpie/network/locol/sherdhelp.dart';
import 'package:recpie/network/locol/sherdhelp.dart';
import 'package:recpie/network/locol/sherdhelp.dart';
import 'package:recpie/network/locol/sherdhelp.dart';
import 'package:recpie/sherd/filess.dart';
import 'package:sqflite/sqflite.dart';

class Appcubit extends Cubit<AppStates> {
  Appcubit() : super(initialState());


  static Appcubit get(context) => BlocProvider.of(context);
  Database database;
  int currentindex = 0;
  IconData fibIcons=Icons.edit;
  var isbuttonshetShow=false;
  List<Map> NewTaskss=[];
  List<Map> DoneTaskss=[];
  List<Map> AechiveTasks=[];
  List<Widget>Screans = [
    NewTasks(),
    DoneTasks(),
    ArchiveTasks(),
  ];
  List<String>Titles = [
    "Tasks",
    "DoneTasks",
    "Archeved",
  ];

  void onchange(int index) {
    currentindex = index;
    emit(changebuttonNav());
  }
  void creatdatabase(){
    openDatabase(
        'todoApp db',
        version: 1,
        onCreate: (database,version){
          print("DATA BASE CREATED");
          database.execute('CREATE TABLE task (id INTEGER PRIMARY KEY,title TEXT,date TEXT,time TEXT,state TEXT)').then((value){
            print ("table created");
          }).catchError((Error){
            print ("the error when the database created${Error.toString()}");
          });
        },
        onOpen: (database) async{
         // print("database open");
          getdata(database);
         print("database is open");
        }

    ).then((value) {
      database=value;
      emit (AppCreateDatabase());
    });
  }






  Future insertdatabase({
    @required String title,
    @required String data,
    @required String time,
  }) async{
     database.transaction((txn) {
      txn.rawInsert('INSERT INTO task (title,date,time,state) VALUES ("$title","$data","$time","New")').then((value){
        print ("${value}insert is done");
        emit(AppInsertDatabase());
        getdata(database);
      }).catchError((Error){
        print("error when inesrt occer ${Error.toString()}");
      });
      return null;
    });
  }
void getdata(database){
  NewTaskss=[];
  DoneTaskss=[];
  AechiveTasks=[];
    emit(Apploadingdatabase());
     database.rawQuery('SELECT * FROM task').then((value){

       value.forEach((element) {
         if (element['state']=='New'){
           NewTaskss.add(element);
         }
         else if (element['state']=='done'){
           DoneTaskss.add(element);
         }
         else {
           AechiveTasks.add(element);
         }
        print (element['state']);
      });
      emit(AppGetDatabase());
    });
  }

  void UpdatedataBase({@required String states,@required int id}) async{
    await database.rawUpdate(
        'UPDATE task SET state = ?  WHERE id = ?',
        ['$states',  id]).then((value){
          getdata(database);
      emit(Appupdatedata());
    });
  }

  void DeletdataBase({@required int id}) async{
     await database.rawDelete('DELETE FROM task WHERE id = ?', [id]).then((value){
       getdata(database);
       emit(Appdeletdata());
     });
  }


  void IconfibButton ({
  @required bool isButton ,
    @required IconData icon
}){
  isbuttonshetShow=isButton;
  fibIcons=icon;
  emit(AppFibicon());
  }
  bool isDark=false;
  void themModa({bool formshared}){
   // isDark=!isDark;

    if (formshared!=null) {
      isDark = formshared;
      emit(Appthemmode());
    }
    else {
      isDark = !isDark;
      sharedhelper.putData(Key: 'isDark', put: isDark).then((value) {
        emit(Appthemmode());
      });
    }

  }


}
