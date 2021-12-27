

import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:recpie/Bloc/States.dart';
import 'package:recpie/modal/socail%20App/Chatmodal.dart';
import 'package:recpie/modal/socail%20App/CreatePost.dart';
import 'package:recpie/modal/socail%20App/create%20RIG.dart';
import 'package:recpie/module/Socail_App/chat/Socail_chat.dart';
import 'package:recpie/module/Socail_App/feed/Socail_feed.dart';
import 'package:recpie/module/Socail_App/homepage/bloc/state.dart';
import 'package:recpie/module/Socail_App/newPost/sss.dart';
import 'package:recpie/module/Socail_App/setting/Socail_Settings.dart';
import 'package:recpie/module/Socail_App/users/Socail_users.dart';
import 'package:recpie/module/shopApp/register/register.dart';
import 'package:recpie/sherd/consans.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

class SocailAppCubit extends Cubit<SocailAppState>{
  SocailAppCubit() : super(SocailAppStateinitialState());

  static SocailAppCubit get(context)=>BlocProvider.of(context);

  createmoda  userModal;
  
  void homepage(){
    emit(lodingSocailAppState());
    FirebaseFirestore.instance.collection('users').doc(uid).get().then((value) {
      //print (value.data());
      userModal =createmoda.Fromjson(value.data());
      emit(EnterUserSocailAppState());
    }).catchError((erorr){
      print(erorr.toString());
      emit(ErrorUserSocailAppState(erorr));
    });

  }

  List <Widget>Screans=[
    feed(),
    chat(),
    NewPost(),
    users(),
    settings(),
  ];
  List <String>TextAppBar=[
    'Home',
    'Chats',
    'Postsss',
    'Users',
    'Settings',
  ];

  int Currentindex=0;
  void ChangeNavSocailApp(int index){

    if (index==1){
      GetUSerss();
    }

    if (index==2){
      emit(NewPostSocailAppState());
    }
    else {
      Currentindex=index;
      emit(ChangeButtonNavSocailAppState());
    }

  }


  File profileImage;
  var picker = ImagePicker();

  Future<void> getProfileImage() async {
    final pickedFile = await picker.getImage(
      source: ImageSource.gallery,

    );

    if (pickedFile != null) {
      profileImage = File(pickedFile.path);
      print(pickedFile.path);
      emit(SocialProfileImagePickedSuccessState());
    } else {
      print('No image selected.');
      emit(SocialProfileImagePickedErrorState());
    }
  }

  File CoverImage;
  //var picker = ImagePicker();

  Future<void> getCoverImage() async {
    final pickedFile = await picker.getImage(
      source: ImageSource.gallery,
    );

    if (pickedFile != null) {
     CoverImage = File(pickedFile.path);
      print(pickedFile.path);
      emit(SocialProfileCoverPickedSuccessState());
    } else {
      print('No image selected.');
      emit(SocialProfileCoverPickedErrorState());
    }
  }
  String Image_Uri="";




  void updateprofile({
    @required String name,
    @required String bio,
    @required String phone,
}){
    emit(SocialUpdateuserloadingState());
    firebase_storage.FirebaseStorage.
    instance.
    ref().
    child('users/${Uri.file(profileImage.path).pathSegments.last}').
    putFile(profileImage).then((value) {
      value.ref.getDownloadURL().then((value){
        //emit(SocialUpdateProfileImageSuccessState());
        //Image_Uri=value;
        updateAll(
            name: name,
            phone: phone,
            bio: bio,
        image: value);
          print (value);
      }).catchError((onError){
        emit(SocialUpdateProfileImageErrorState());
      });
    }).catchError((error){
      emit(SocialUpdateProfileImageErrorState());
    });
  }





  String Cover_Uri="";
  void updateCover({
  @required String name,
    @required String bio,
    @required String phone,
}){
    emit(SocialUpdateuserloadingState());
    firebase_storage.FirebaseStorage.
    instance.
    ref().
    child('users/${Uri.file(CoverImage.path).pathSegments.last}').
    putFile(CoverImage).then((value) {
      value.ref.getDownloadURL().then((value){
       // emit(SocialUpdateCoverSuccessState());
        //Cover_Uri=value;
        print (value);
        updateAll(
            name: name,
            phone: phone,
            bio: bio,
        cover: value);
      }).catchError((onError){
        emit(SocialUpdateCoverErrorState());
      });
    }).catchError((error){
      emit(SocialUpdateCoverErrorState());
    });
  }




  void updateAll({
   @required String name,
    @required String phone,
    @required String bio,
    String image,
    String cover,
}){
    emit(SocialUpdateuserloadingState());

      createmoda modal=createmoda(
        name:name,
        phone: phone,
        uid: userModal.uid,
        Emailverfied: false,
        bio:bio,
        email: userModal.email,
        image:image??userModal.image,
        cover:cover?? userModal.cover,
      );

      FirebaseFirestore.instance.collection('users').
      doc(userModal.uid).
      update(modal.tomap()).then((value){
        homepage();
      }).catchError((error){
        emit(SocialUpdateuserErrorState());
      });
    }



  File PostImage;
  //var picker = ImagePicker();

  Future<void> getPostImage() async {
    final pickedFile = await picker.getImage(
      source: ImageSource.gallery,
    );

    if (pickedFile != null) {
      PostImage = File(pickedFile.path);
      print(pickedFile.path);
      emit(SocialUpdatePostSuccessState());
    } else {
      print('No image selected.');
      emit(SocialUpdatePostErrorState());
    }
  }

  void PostcreateImage({
    @required String Time,
    @required String text,

  }){
    emit(SocialPostcreateloadingState());
    firebase_storage.FirebaseStorage.
    instance.
    ref().
    child('post/${Uri.file(PostImage.path).pathSegments.last}').
    putFile(PostImage).then((value) {
      value.ref.getDownloadURL().then((value){
        // emit(SocialUpdateCoverSuccessState());
        //Cover_Uri=value;
        Postcreate(
          text: text,
          post_Image: value,
          Time: Time,
        );
        print (value);

      }).catchError((onError){
        emit(SocialPostcreateErrorState());
      });
    }).catchError((error){
      emit(SocialPostcreateErrorState());
    });
  }

  void Postcreate({

    String text,
    String post_Image,
    String Time
  }){
    emit(SocialPostcreateloadingState());

    Postmodal modal=Postmodal(
      name:userModal.name,
      uid: userModal.uid,
      image:userModal.image,
     text: text,
      Time: Time,
      post_Image:post_Image??'' ,
    );

    FirebaseFirestore.instance.collection('post').
    add(modal.tomap()).then((value){
      emit(SocialPostcreateSuccessState());
    }).catchError((error){
      emit( SocialPostcreateErrorState ());
    });
  }
  void reomverimage(){
    PostImage=null;
    emit(SocialRemoveImageSuccessState());
  }

  List<Postmodal>Posts=[];
  //List<String> postuid=[];
  //List<int> ItemLike=[];
  //List<String>Comment=[];

  void Getpost(){
    //emit(SocialGetPostloadingState());

    FirebaseFirestore.
    instance.
    collection('post').
    get().
    then((value) {
      value.docs.forEach((element) {
        Posts.add(Postmodal.Fromjson(element.data()));
      });
      emit(SocialGetPostSuccessState());

    }).catchError((error){
      emit(SocialGetPostErrorState(error.toString()));
    });



  }

  void Like(String postUid){
    FirebaseFirestore.instance.
    collection('post')
        .doc(postUid).
         collection('Like').
          doc(userModal.uid).set({
      'Like':true,

    }).then((value){
      emit(SocialLikeSuccessState());
    }).catchError((error){
      emit(SocialLikeErrorState(error));
    });

  }

  void Comments(String postUid,var commment){
    FirebaseFirestore.instance.
    collection('post')
        .doc(postUid).
    collection('comments').
    doc(userModal.uid).set({
      'comment':commment,
    }).then((value){
      emit(SocialCommentSuccessState());
    }).catchError((error){
      emit(SocialCommentErrorState(error));
    });

  }

  List <createmoda> userss=[];

  void GetUSerss(){
    if (userss.length==0)
   // emit(lodingGetAlllSocailAppState()),
    FirebaseFirestore.instance.collection('users').get().
    then((value) {

      value.docs.forEach((element) {
        if (element.data()['uid']!=userModal.uid)
        userss.add(createmoda.Fromjson(element.data()));
      });

      emit(EnterGetAlllUserSocailAppState());
      }).catchError((error){
        print (error.toString());
       emit(ErrorGetAlllUserSocailAppState(error));
    });



  }


  void SendMassage({
    @required text,
    @required reciverId,
    @required dataTime,
}){
    Chatmodal modal=Chatmodal(
      text: text,
      reciverId: reciverId,
      senderId: userModal.uid,
      dataTime: dataTime,
    );
    FirebaseFirestore.instance.
    collection('users').
    doc(userModal.uid).
    collection('chats').
    doc(reciverId).
    collection('massages').
    add(modal.tomap()).then((value){
          emit(SocialSendMassageSuccessState());
    }).catchError((erorr){

      emit(SocialSendMassageErrorState());
    });


    FirebaseFirestore.instance.
    collection('users').
    doc(reciverId).
    collection('chats').
    doc(userModal.uid).
    collection('massages').
    add(modal.tomap()).then((value){
      emit(SocialSendMassageSuccessState());
    }).catchError((erorr){

      emit(SocialSendMassageSuccessState());
    });




  }


  List<Chatmodal>Chatss=[];
  void GetChats({String reciverId} ){
    FirebaseFirestore.instance.
    collection("users").
    doc(userModal.uid).
    collection("chats").
    doc(reciverId).
    collection('massages').
    orderBy('dataTime').
    snapshots().
    listen((event) {
      Chatss=[];
      event.docs.forEach((element) {

        Chatss.add(Chatmodal.Fromjson(element.data()));
      });
      emit(SocialReciveMassageSuccessState());
    });
  }

}
