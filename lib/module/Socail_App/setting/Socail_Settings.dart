import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recpie/componaa/fild.dart';
import 'package:recpie/module/Socail_App/Edit_Profile/EditProfile.dart';
import 'package:recpie/module/Socail_App/homepage/bloc/cubit.dart';
import 'package:recpie/module/Socail_App/homepage/bloc/state.dart';
import 'package:recpie/style/Icon.dart';

class settings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SocailAppCubit,SocailAppState>(
      listener: (context,state){},
      builder: (context,state){
        var modal=SocailAppCubit.get(context).userModal;
        return Padding(
            padding: EdgeInsets.all(8.0),
            child:Column(
              children: [
                Container(
                  height: 190,
                  child: Stack(
                    alignment: AlignmentDirectional.bottomCenter,
                    children: [
                      Align(
                        alignment: AlignmentDirectional.topCenter,
                        child: Container(
                          width: double.infinity,
                          height: 150.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(4.0),
                              topRight: Radius.circular(4.0),
                            ),
                            image: DecorationImage(
                                image: NetworkImage(modal.cover,
                                ),
                                fit: BoxFit.cover
                            ),
                          ),
                        ),
                      ),
                      CircleAvatar(
                        radius: 64.0,
                        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                        child: CircleAvatar(
                          radius: 60,
                          backgroundImage:NetworkImage(modal.image),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 5.0,
                ),
                Text(modal.name,style: Theme.of(context).textTheme.bodyText1,),
                Text(modal.bio,style: Theme.of(context).textTheme.caption,),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 10.0
                  ),
                  child: Row(
                    children: [

                      Expanded(
                        child: InkWell(
                          child: Column(
                            children: [
                              Text("100",style: Theme.of(context).textTheme.bodyText1,),
                              Text("Post",style: Theme.of(context).textTheme.caption,),

                            ],
                          ),
                          onTap: (){},
                        ),
                      ),
                      Expanded(
                        child: InkWell(
                          child: Column(
                            children: [
                              Text("264",style: Theme.of(context).textTheme.bodyText1,),
                              Text("Photos",style: Theme.of(context).textTheme.caption,),

                            ],
                          ),
                          onTap: (){},
                        ),
                      ),
                      Expanded(
                        child: InkWell(
                          child: Column(
                            children: [
                              Text("10K",style: Theme.of(context).textTheme.bodyText1,),
                              Text("Followers",style: Theme.of(context).textTheme.caption,),

                            ],
                          ),
                          onTap: (){},
                        ),
                      ),
                      Expanded(
                        child: InkWell(
                          child: Column(
                            children: [
                              Text("64",style: Theme.of(context).textTheme.bodyText1,),
                              Text("Followings",style: Theme.of(context).textTheme.caption,),

                            ],
                          ),
                          onTap: (){},
                        ),
                      ),

                    ],
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child:OutlinedButton(
                        onPressed: (){},
                        child: Text("Add Photos"),
                      )
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    OutlinedButton(onPressed:(){
                      navigato(context, EditPeofile());
                    },
                    child:Icon(
                      IconBroken.Edit,
                    )
                    )
                  ],
                ),
                Row(
                  children: [
                    OutlinedButton(
                        onPressed: (){
                          FirebaseMessaging.instance.subscribeToTopic("ancounceing");
                        },
                        child:Text("subscribe")),
                    SizedBox(
                      width: 15,
                    ),
                    OutlinedButton(
                        onPressed: (){
                          FirebaseMessaging.instance.unsubscribeFromTopic("ancounceing");
                        },
                        child:Text("unsubscribe")),
                  ],
                )
              ],
            )
        );
      },
    );
  }
}
