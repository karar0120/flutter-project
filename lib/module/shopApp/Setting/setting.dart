
import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recpie/componaa/fild.dart';
import 'package:recpie/module/shopApp/bloc/cubit/Shoplayout_Cubit.dart';
import 'package:recpie/module/shopApp/bloc/states/Shoplayout_States.dart';
import 'package:recpie/network/locol/sherdhelp.dart';

class ShopSetting extends StatelessWidget {
  @override
  var Fssorm=GlobalKey<FormState>();
  var namecontroll=TextEditingController();
  var emailcontroll=TextEditingController();
  var phonecontroll=TextEditingController();
  Widget build(BuildContext context) {
    return BlocConsumer<layoutCubit,LayoutStates>(
      listener: (context,state){},
      builder: (context,state){
        var bi=layoutCubit().get(context).profilemodal;
        namecontroll.text=bi.data.name;
        emailcontroll.text=bi.data.email;
        phonecontroll.text=bi.data.phone;

        return ConditionalBuilder(
          condition: layoutCubit().get(context).profilemodal!=null,
          builder: (context)=>Padding(
            padding: const EdgeInsets.all(20),
            child:Form (
              key:Fssorm,
              child: Column(
                children: [
                  if (state is updloadingState)
                    LinearProgressIndicator(),
                  SizedBox(
                    height: 5,
                  ),
                  importForm(
                      controller: namecontroll,
                      Text: "Name",
                      valudat: (value){
                        if (value.isEmpty){
                          return ("This Form Empty");
                        }
                        return null;
                      },
                      Iconsss: Icons.person,
                      Keybord: TextInputType.text),
                  SizedBox(
                    height: 20,
                  ),
                  importForm(
                      controller: emailcontroll,
                      Text: "Email",
                      valudat: (value){
                        if (value.isEmpty){
                          return ("This Form Empty");
                        }
                        return null;
                      },
                      Iconsss: Icons.email_outlined,
                      Keybord: TextInputType.emailAddress),
                  SizedBox(
                    height: 20,
                  ),
                  importForm(
                      controller: phonecontroll,
                      Text: "Phone",
                      valudat: (value){
                        if (value.isEmpty){
                          return ("This Form Empty");
                        }
                        return null;
                      },
                      Iconsss: Icons.phone,
                      Keybord: TextInputType.phone),
                  SizedBox(
                    height: 20,
                  ),
                  Button(
                      function: (){
                        if (Fssorm.currentState.validate()){
                          layoutCubit().get(context).putupd(
                              name: namecontroll.text,
                              phone: phonecontroll.text,
                              email: emailcontroll.text);
                        }


                      },
                      text:"update"),
                  SizedBox(
                    height: 20,
                  ),
                  Button(
                      function: (){

                        Logout(context);
                      },
                      text:"logout")

                ],
              ),
            ),
          ),
          fallback:(context)=>Center(child: CircularProgressIndicator()),
        );
      },
    );
  }
}
