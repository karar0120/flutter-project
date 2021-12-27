import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recpie/componaa/fild.dart';
import 'package:recpie/home_layout/Soacial_App/socaoilApp.dart';
import 'package:recpie/module/Socail_App/login/social_App.dart';
import 'package:recpie/module/Socail_App/register/bloc/cubit.dart';

import 'bloc/state.dart';

class Socailregister extends StatelessWidget {
  var emailcontroller = TextEditingController();
  var passwordcontroller = TextEditingController();
  var namecontroller = TextEditingController();
  var phonecontroller = TextEditingController();
  var formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => RIGsocailcubit(),
        child: BlocConsumer<RIGsocailcubit, RIGsocailStatas>(
          listener: (context, state) {

            if (state is RIGsocailCreateuserState){
              navigatoandnotreturn(context, Socaillayout());

            }
          },
          builder: (context, state) {
            return Scaffold(
              appBar: AppBar(

              ),
              body: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Center(
                  child: SingleChildScrollView(
                    child: Form(
                      key: formkey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text('REGISTER', style: Theme
                              .of(context).textTheme.headline4.copyWith(color: Colors.black),),
                          Text('REGISTER now to communicate New friends ',
                            style: Theme
                                .of(context).textTheme.bodyText1.copyWith(color: Colors.grey)
                            ,),
                          SizedBox(
                            height: 30,
                          ),
                          importForm(
                              controller: namecontroller,
                              Text: "Name",
                              valudat: (String valudat) {
                                if (valudat.isEmpty) {
                                  return ("Please enter Your Name");
                                }
                                return null;
                              },
                              Iconsss: Icons.person,
                              Keybord: TextInputType.text),
                          SizedBox(
                            height: 15,
                          ),
                          importForm(
                              controller: emailcontroller,
                              Text: "Email",
                              valudat: (String valudat) {
                                if (valudat.isEmpty) {
                                  return ("Please enter Your Email");
                                }
                                return null;
                              },
                              Iconsss: Icons.email_outlined,
                              Keybord: TextInputType.emailAddress),
                          SizedBox(
                            height: 15,
                          ),
                          importForm(
                              controller: phonecontroller,
                              Text: "Phone",
                              valudat: (String valudat) {
                                if (valudat.isEmpty) {
                                  return ("Please enter Your Phone");
                                }
                                return null;
                              },
                              Iconsss: Icons.phone,
                              Keybord: TextInputType.phone),
                          SizedBox(
                            height: 15,
                          ),
                          importForm(
                              onSubmit: (value) {
                              },
                              abscure: RIGsocailcubit.get(context).ispassword,
                              controller: passwordcontroller,
                              Text: "Password",
                              valudat: (String valudat) {
                                if (valudat.isEmpty) {
                                  return ("The password must ba not short");
                                }
                                return null;
                              },
                              setstate: () {
                                RIGsocailcubit.get(context).passwordIcon();
                              },
                              suffix: RIGsocailcubit.get(context).suffix,
                              Iconsss: Icons.lock_open_outlined,
                              Keybord: TextInputType.visiblePassword
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          ConditionalBuilder(
                            condition: state is !RIGsocailloadingState,
                            builder: (context) =>
                                Button(
                                    function: () {
                                      if (formkey.currentState.validate()) {
                                        RIGsocailcubit.get(context).userRIG(
                                          Email: emailcontroller.text,
                                          Password: passwordcontroller.text,
                                          Name: namecontroller.text,
                                          Phone: phonecontroller.text,
                                        );
                                      }
                                      //navigato(context,social_App());

                                    },
                                    text: "register",
                                    inuppuer: true,

                                ),
                            fallback: (context) =>
                                Center(child: CircularProgressIndicator()),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          //Row(
                          //children: [
                          //Text("Don't have account?"),
                          //DefultButton2(Fun:(){
                          //navigatoandnotreturn(context, register());
                          //},text: "REGISTER")
                          //],
                          //)
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        )
    );
  }
}