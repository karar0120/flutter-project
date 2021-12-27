import 'package:bloc/bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:recpie/Bloc/Cubit.dart';
import 'package:recpie/Bloc/States.dart';
import 'package:recpie/componaa/Bloc.observer.dart';
import 'package:recpie/componaa/fild.dart';
import 'package:recpie/module/TelegrameApp/login_Screan.dart';
import 'package:recpie/module/shopApp/cubit/cubit.dart';
import 'package:recpie/module/shopApp/loginScreen/ShopLogin.dart';
import 'package:recpie/module/shopApp/onBordingScreen/onbordigScreen.dart';
import 'package:recpie/network/locol/sherdhelp.dart';
import 'package:recpie/network/remote/dio_helper.dart';
import 'package:recpie/sherd/consans.dart';
import 'package:recpie/style/thems.dart';
import 'file:///C:/Users/BluRay/Downloads/recpie/lib/home_layout/todoApp/homelayout.dart';
import 'home_layout/Soacial_App/socaoilApp.dart';
import 'home_layout/newsApp/cubit.dart';
import 'home_layout/newsApp/newslayout.dart';
import 'module/Socail_App/homepage/bloc/cubit.dart';
import 'module/Socail_App/login/social_App.dart';
import 'module/shopApp/bloc/cubit/Shoplayout_Cubit.dart';
import 'module/shopApp/shop_Layout/shoplayout.dart';


Future<void>firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  print ("onMessageBackGround");
  print (message.data.toString());
  toast(
      text: "on Message",
      State: ToastColor.Enter);
}

void main()async {
  //WidgetsFlutterBinding.ensureInitialized();

  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();
  var token=await FirebaseMessaging.instance.getToken();
  print(token);
  FirebaseMessaging.onMessage.listen((event) {
    print ("onMessage");
    toast(
        text: "on Message",
        State: ToastColor.Enter);
    print (event.data.toString());
  });

  FirebaseMessaging.onMessageOpenedApp.listen((event) {
    print ("onMessageopenapp");
    print (event.data.toString());
    toast(
        text: "on Message",
        State: ToastColor.Enter);

  });

  FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);

  Bloc.observer = MyBlocObserver();


  //Firebase.initializeApp();
  //main createState() => main();


  //await FirebaseApp

  diohelper.init();
   await sharedhelper.init();
   bool isDark=sharedhelper.getData(Key:'isDark');
    Widget widget;
    uid=sharedhelper.getData(Key:'uid');

  //bool on_boraedin=sharedhelper.getData(Key:'you');

  //tokensssssss=sharedhelper.getData(Key:'fuck');
  //print (tokensssssss);
  if (uid!=null){
    widget=Socaillayout();
  }
  else {
    widget= social_App();
  }

 // print(on_boraedin);
  runApp(MyApp(

      isDark:isDark,
  on_boraedin: widget,
  ));
}

class MyApp extends StatelessWidget {


 /*

  */


  // This widget is the root of your application.\
  final bool isDark;
  final Widget on_boraedin;
  MyApp({
    this.isDark,
    this.on_boraedin});


  @override
  Widget build(BuildContext context) {






    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (BuildContext context )=>layoutCubit()..getxxx()..getCat()..getFav()..getpro()),

        BlocProvider(
          create: (_) => SocailAppCubit()..homepage()..Getpost()..GetUSerss(),
          //initialData: null,
        ),


        BlocProvider(create: (BuildContext context)=>Appcubit()..themModa(
        formshared: isDark),),
        BlocProvider(create: (BuildContext context)=>cubitApp()..getbusnaiess()..getsport()..getsc(),),
        //BlocProvider(create: (BuildContext context)=>SocailAppCubit()..homepage()..Getpost()..GetUSerss()),
      ],
        child: BlocConsumer<Appcubit,AppStates>(
          listener: (context,state){},
          builder: (context,state){
            return MaterialApp(
              //title: 'Flutter Demo',
              debugShowCheckedModeBanner: false,
              theme: Themlight,
              darkTheme:Themdark,
              themeMode: Appcubit.get(context).isDark?ThemeMode.dark:ThemeMode.light,
              home:LoginTelegramScrean(),
            );
          },
        ),
      );
  }
}

