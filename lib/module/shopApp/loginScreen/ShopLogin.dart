
import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:recpie/componaa/fild.dart';
import 'package:recpie/module/shopApp/cubit/cubit.dart';
import 'package:recpie/module/shopApp/cubit/states.dart';
import 'package:recpie/module/shopApp/onBordingScreen/onbordigScreen.dart';
import 'package:recpie/module/shopApp/register/register.dart';
import 'package:recpie/module/shopApp/shop_Layout/shoplayout.dart';
import 'package:recpie/network/locol/sherdhelp.dart';
import 'package:recpie/sherd/consans.dart';

class ShopLogin extends StatelessWidget {
  var emailcontroller=TextEditingController();
  var passwordcontroller=TextEditingController();
  var formkey=GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context)=>Shopcubit(),
      child: BlocConsumer<Shopcubit,ShopStatas>(
        listener: (context,state){
          if (state is ShopEnterState){
            if (state.loginmodal.status){
              print (state.loginmodal.data.token);
              print(state.loginmodal.message);
    sharedhelper.saveData(Key: 'fuck', value: state.loginmodal.data.token).then((value){
      tokensssssss=state.loginmodal.data.token;
    navigatoandnotreturn(context, ShopLayout());
    });

            }else {
              print(state.loginmodal.message);
              toast(text: state.loginmodal.message
                  , State: ToastColor.Error);
            }
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
                          Text('Login now to browse or hot offers ',
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
                               Shopcubit.get(context).userLogin(
                                   Email:emailcontroller.text,
                                   Password: passwordcontroller.text);
                             }
                           },
                              abscure: Shopcubit.get(context).ispassword,
                              controller: passwordcontroller,
                              Text: "Password",
                              valudat: (String valudat){
                                if (valudat.isEmpty){
                                  return ("The password must ba not short");
                                }
                                return null;
                              },
                              setstate: (){

                              Shopcubit.get(context).passwordIcon();
                              },
                              suffix:Shopcubit.get(context).suffix,
                              Iconsss: Icons.lock_open_outlined,
                              Keybord: TextInputType.visiblePassword
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          ConditionalBuilder(
                            condition: state is!ShoploadingState,
                            builder: (context)=>Button(

                                function: (){
                                  if (formkey.currentState.validate()){
                                    Shopcubit.get(context).userLogin(
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
                                navigatoandnotreturn(context, register());
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
