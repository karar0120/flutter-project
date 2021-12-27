
import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recpie/modal/socail%20App/Chatmodal.dart';
import 'package:recpie/modal/socail%20App/create%20RIG.dart';
import 'package:recpie/module/Socail_App/homepage/bloc/cubit.dart';
import 'package:recpie/module/Socail_App/homepage/bloc/state.dart';
import 'package:recpie/style/Icon.dart';
import 'package:recpie/style/color.dart';

class Chat_Detailes extends StatelessWidget {
  createmoda moda;

  Chat_Detailes({
  @required this.moda,
});

  var textController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (BuildContext context) {
        SocailAppCubit.get(context).GetChats(reciverId:moda.uid);
        return BlocConsumer<SocailAppCubit,SocailAppState>(
          listener: (context,state){},
          builder: (context,state){
            return  Scaffold(
              appBar: AppBar(
                titleSpacing: 0.0,
                title: Row(
                  children: [
                    CircleAvatar(
                      radius: 20.0,
                      backgroundImage:NetworkImage(moda.image),
                    ),
                    SizedBox(
                      width: 15.0,
                    ),
                    Text(moda.name)
                  ],
                ),
              ),
              body: ConditionalBuilder(
                condition:SocailAppCubit.get(context).Chatss.length>0,
                builder: (context)=>Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      Expanded(
                        child: ListView.separated(
                          physics: BouncingScrollPhysics(),
                            itemBuilder: (context,index){
                              var messages =SocailAppCubit.get(context).Chatss[index];
                              if (SocailAppCubit.get(context).userModal.uid==messages.senderId)
                                return myBuilderto(messages);
                              return  myBuilder(messages);
                            },
                            separatorBuilder: (context,index)=>SizedBox(
                                height:15),
                            itemCount: SocailAppCubit.get(context).Chatss.length),
                      ),
                      //Spacer(),
                      Container(
                        decoration: BoxDecoration(
                            border: Border.all(
                                color:Colors.grey[300],
                                width: 1.0
                            ),
                            borderRadius: BorderRadius.circular(15.0)
                        ),
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        child: Row(
                          children: [
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 15.0
                                ),
                                child: TextFormField(
                                  controller: textController,
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "Enter Your Massage .....",

                                  ),
                                ),
                              ),
                            ),
                            Container(
                              height:50,
                              color: DefultColor,
                              child: MaterialButton(
                                  onPressed: (){
                                    SocailAppCubit.get(context).SendMassage(
                                        text:textController.text,
                                        reciverId: moda.uid ,
                                        dataTime: DateTime.now().toString());
                                    textController=null;
                                  },
                                  minWidth: 10.0,
                                  child:Icon(
                                    IconBroken.Send,
                                    size: 16,
                                    color:Colors.white,
                                  )),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                fallback: (context)=>Center(child: CircularProgressIndicator()),
              ),
            );
          },
        );
      },
    );
  }


  Widget myBuilder(Chatmodal modal)=>Align(
    alignment: AlignmentDirectional.centerStart,
    child: Container(
        decoration: BoxDecoration(
            color: Colors.grey[300],
            borderRadius: BorderRadiusDirectional.only(
                bottomEnd:Radius.circular(10.0),
                topEnd: Radius.circular(10.0),
                topStart: Radius.circular(10.0)
            )
        ),
        padding: EdgeInsets.symmetric(
          vertical: 5.0,
          horizontal: 10.0,
        ),
        child: Text(modal.text)),
  );

  Widget myBuilderto(Chatmodal modal)=>Align(
    alignment: AlignmentDirectional.centerEnd,
    child: Container(
        decoration: BoxDecoration(
            color: DefultColor.withOpacity(0.2),
            borderRadius: BorderRadiusDirectional.only(
                bottomStart:Radius.circular(10.0),
                topEnd: Radius.circular(10.0),
                topStart: Radius.circular(10.0)
            )
        ),
        padding: EdgeInsets.symmetric(
          vertical: 5.0,
          horizontal: 10.0,
        ),
        child: Text(modal.text)),
  );
}
