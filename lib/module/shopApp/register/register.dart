
import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recpie/componaa/fild.dart';
import 'package:recpie/module/shopApp/cubit/cubit.dart';
import 'package:recpie/module/shopApp/cubit/states.dart';
import 'package:recpie/module/shopApp/shop_Layout/shoplayout.dart';
import 'package:recpie/network/locol/sherdhelp.dart';
import 'package:recpie/sherd/consans.dart';

import 'Bloc/cubit.dart';
import 'Bloc/state.dart';

class register extends StatelessWidget {
  var emailcontroller = TextEditingController();
  var passwordcontroller = TextEditingController();
  var namecontroller = TextEditingController();
  var phonecontroller = TextEditingController();
  var formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => RIGShopcubit(),
        child: BlocConsumer<RIGShopcubit, RIGShopStatas>(
          listener: (context, state) {

            if (state is RIGShopEnterState){
              if (state.loginmodal.status){
                print (state.loginmodal.data.token);
                print(state.loginmodal.message);
                //sharedhelper.saveData(Key: 'fuck', value: state.loginmodal.data.token).then((value){
                  //tokensssssss=state.loginmodal.data.token;
                  //navigatoandnotreturn(context, ShopLayout());
                //});
                sharedhelper.saveData(
                    Key: 'fuck', value: state.loginmodal.data.token).then((value){
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
          builder: (context, state) {
            return Scaffold(
              appBar: AppBar(),
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
                          Text('REGISTER now to browse or hot offers ',
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
                              abscure: RIGShopcubit.get(context).ispassword,
                              controller: passwordcontroller,
                              Text: "Password",
                              valudat: (String valudat) {
                                if (valudat.isEmpty) {
                                  return ("The password must ba not short");
                                }
                                return null;
                              },
                              setstate: () {
                                RIGShopcubit.get(context).passwordIcon();
                              },
                              suffix: RIGShopcubit.get(context).suffix,
                              Iconsss: Icons.lock_open_outlined,
                              Keybord: TextInputType.visiblePassword
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          ConditionalBuilder(
                            condition: state is !RIGShoploadingState,
                            builder: (context) =>
                                Button(
                                    function: () {
                                      if (formkey.currentState.validate()) {
                                        RIGShopcubit.get(context).userRIG(
                                            Email: emailcontroller.text,
                                            Password: passwordcontroller.text,
                                          Name: namecontroller.text,
                                          Phone: phonecontroller.text,
                                        );
                                      }
                                    },
                                    text: "register",
                                    inuppuer: true),
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