
//import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:recpie/componaa/fild.dart';
import 'package:recpie/module/Socail_App/homepage/bloc/cubit.dart';
import 'package:recpie/module/Socail_App/homepage/bloc/state.dart';
import 'package:recpie/style/Icon.dart';

import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

class EditPeofile extends StatelessWidget {
  var nameController=TextEditingController();
  var bioController=TextEditingController();
  var phoneController=TextEditingController();
  

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SocailAppCubit,SocailAppState>(
      listener: (context,state){},
      builder: (context,state){
        var modal=SocailAppCubit.get(context).userModal;
        var profileImage =SocailAppCubit.get(context).profileImage;
        var coverImage=SocailAppCubit.get(context).CoverImage;
        nameController.text= modal.name;
        bioController.text=modal.bio;
        phoneController.text=modal.phone;
        return Scaffold(
          appBar:Appbar(context: context,title: "Edit Profile",
              action: [
                DefultButton2(Fun: (){
                  SocailAppCubit.get(context).updateAll(
                      name: nameController.text,
                      phone: phoneController.text,
                      bio: bioController.text);
                }, text: "UPDATE"),
                SizedBox(
                  width: 15,
                ),
              ]
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  if (state is SocialUpdateuserloadingState)
                    LinearProgressIndicator(),
                  Container(
                    height: 190,
                    child: Stack(
                      alignment: AlignmentDirectional.bottomCenter,
                      children: [
                        Align(
                          alignment: AlignmentDirectional.topCenter,
                          child: Stack(
                            alignment:AlignmentDirectional.topEnd ,
                            children: [
                              Container(
                                width: double.infinity,
                                height: 150.0,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(4.0),
                                    topRight: Radius.circular(4.0),
                                  ),
                                  image: DecorationImage(
                                      image:coverImage==null? NetworkImage(modal.cover,
                                      ):FileImage(coverImage),
                                      fit: BoxFit.cover
                                  )
                                ),
                              ),
                              CircleAvatar(
                                radius: 20,
                                child: IconButton(
                                    onPressed:(){
                                      SocailAppCubit.get(context).getCoverImage();
                                    },
                                    icon: Icon(IconBroken.Camera,size: 16,),),
                              ),
                            ],
                          ),
                        ),
                        Stack(
                          alignment:AlignmentDirectional.bottomEnd,
                          children: [
                            CircleAvatar(
                              radius: 64.0,
                              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                              child: CircleAvatar(
                                radius: 60,
                                backgroundImage:profileImage==null?NetworkImage(modal.image):FileImage(profileImage),
                              ),
                            ),
                            CircleAvatar(
                              radius: 20,
                                child: IconButton(onPressed: (){
                                  SocailAppCubit.get(context).getProfileImage();
                                }, icon:Icon(IconBroken.Camera)))
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  if (SocailAppCubit.get(context).profileImage!=null||SocailAppCubit.get(context).CoverImage !=null)
                  Row(
                    children: [
                      if (SocailAppCubit.get(context).profileImage!=null)
                      Expanded(
                        child: Column(
                          children: [
                            Button(
                                function:(){
                                  SocailAppCubit.get(context).updateprofile(
                                      name: nameController.text, bio: bioController.text, phone: phoneController.text);
                                }, text: "upload profile"),
                            SizedBox(
                              height: 5.0,
                            ),
                            if (state is SocialUpdateuserloadingState)
                            LinearProgressIndicator(),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 5.0,
                      ),
                      if (SocailAppCubit.get(context).CoverImage!=null)
                      Expanded(
                        child: Column(
                          children: [
                            Button(
                                function:(){
        SocailAppCubit.get(context).updateCover(
        name: nameController.text, bio: bioController.text, phone: phoneController.text);
        }, text: "upload cover"),
                            SizedBox(
                              height: 5.0,
                            ),
                            if (state is SocialUpdateuserloadingState)
                            LinearProgressIndicator(),
                          ],
                        ),

                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  importForm(
                      controller: nameController,
                      Text: "Name",
                      valudat: (String value){
                      if (value.isEmpty){
                        return ("Pleas Enter Your Name....");
                      }
                      return null;
                  }, Iconsss:IconBroken.User,
                      Keybord: TextInputType.name),
                  SizedBox(
                    height: 10.0,
                  ),
                  importForm(
                      controller: bioController,
                      Text: "Bio",
                      valudat: (String value){
                        if (value.isEmpty){
                          return ("Pleas Enter Your Bio....");
                        }
                        return null;
                      }, Iconsss:IconBroken.Info_Circle,
                      Keybord: TextInputType.name),
              SizedBox(
                height: 10.0,),
              importForm(
                  controller: phoneController,
                  Text: "Phone",
                  valudat: (String value){
                    if (value.isEmpty){
                      return ("Pleas Enter Your Phone");
                    }
                    return null;
                  }, Iconsss:IconBroken.Call,
                  Keybord: TextInputType.number),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
