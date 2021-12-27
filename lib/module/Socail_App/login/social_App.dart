import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recpie/componaa/fild.dart';
import 'package:recpie/home_layout/Soacial_App/socaoilApp.dart';
import 'package:recpie/module/Socail_App/login/Bloc/cubit.dart';
import 'package:recpie/module/Socail_App/register/register.dart';
import 'package:recpie/module/shopApp/register/register.dart';
import 'package:recpie/network/locol/sherdhelp.dart';

import 'Bloc/state.dart';

class social_App extends StatelessWidget {
  var emailcontroller=TextEditingController();
  var passwordcontroller=TextEditingController();
  var formkey=GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context)=>Socailcubit(),
      child: BlocConsumer<Socailcubit,SocailStatas>(
        listener: (context,state){
          if (state is SocailErorrState) {
         toast(
             text: state.Error.toString(),
             State: ToastColor.Error);
          }
          if (state is SocailEnterState){
            sharedhelper.saveData(
                Key: 'uid',
                value:state.uid
            ).then((value){
              navigatoandnotreturn(context, Socaillayout());
            });
          }
        },
        builder: (context,state){
          return Scaffold(
              appBar: AppBar(),
              body:Padding(
                padding: const EdgeInsets.all(20.0),
                child: Center(
                  child: SingleChildScrollView(
                    child: Form(
                      key: formkey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget> [
                          Text('LOGIN',style: Theme.of(context).textTheme.headline4.copyWith(color: Colors.black),),
                          Text('Login now to communicate New friends',
                            style: Theme.of(context).textTheme.bodyText1.copyWith(
                                color: Colors.grey
                            )
                            ,),
                          SizedBox(
                            height: 30,
                          ),
                          importForm(
                              controller: emailcontroller,
                              Text: "Email",
                              valudat: (String valudat){
                                if (valudat.isEmpty){
                                  return ("Please enter Your Email");
                                }
                                return null;
                              },
                              Iconsss: Icons.email,
                              Keybord: TextInputType.emailAddress),
                          SizedBox(
                            height: 15,
                          ),
                          importForm (
                              onSubmit: (value){
                                if (formkey.currentState.validate()){
                                  //Shopcubit.get(context).userLogin(
                                  //  Email:emailcontroller.text,
                                  //Password: passwordcontroller.text);
                                }
                              },
                              abscure: Socailcubit.get(context).ispassword,
                              controller: passwordcontroller,
                              Text: "Password",
                              valudat: (String valudat){
                                if (valudat.isEmpty){
                                  return ("The password must ba not short");
                                }
                                return null;
                              },
                              setstate: (){

                                Socailcubit.get(context).passwordIcon();
                              },
                              suffix:Socailcubit.get(context).suffix,
                              Iconsss: Icons.lock_open_outlined,
                              Keybord: TextInputType.visiblePassword
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          ConditionalBuilder(
                            condition: state is!SocailloadingState,
                            builder: (context)=>Button(

                                function: (){
                                  if (formkey.currentState.validate()){
                                    Socailcubit.get(context).userLogin(
                                     Email:emailcontroller.text,
                                    Password: passwordcontroller.text);
                                  }
                                },
                                text: "login",
                                inuppuer: true),
                            fallback:(context)=>Center(child: CircularProgressIndicator()),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Row(
                            children: [
                              Text("Don't have account?"),
                              DefultButton2(Fun:(){
                                navigatoandnotreturn(context, Socailregister());
                              },text: "REGISTER")
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              )
          );
        },
      ),
    );
  }
}
