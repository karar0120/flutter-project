
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recpie/modal/shopApp/Home_modal.dart';
import 'package:recpie/modal/shopApp/categories_modal.dart';
import 'package:recpie/modal/shopApp/favorites_modal.dart';
import 'package:recpie/modal/shopApp/getFavorites.dart';
import 'package:recpie/modal/shopApp/login_modal.dart';
import 'package:recpie/module/shopApp/Categories/Categories.dart';
import 'package:recpie/module/shopApp/Favorites/Favorites.dart';
import 'package:recpie/module/shopApp/Products/Products.dart';
import 'package:recpie/module/shopApp/Search/Search.dart';
import 'package:recpie/module/shopApp/Setting/setting.dart';
import 'package:recpie/module/shopApp/bloc/states/Shoplayout_States.dart';
import 'package:recpie/network/remote/dio_helper.dart';
import 'package:recpie/sherd/consans.dart';
import 'package:recpie/sherd/end_point.dart';
class layoutCubit extends Cubit<LayoutStates>{
  layoutCubit() : super(initialState());

  layoutCubit get(context)=> BlocProvider.of(context);
  int currentindex=0;

  Map<int,bool>favorites={};
  List<Widget>Screans=[
    ShopProducts(),
    ShopCategories(),
    ShopFavorites(),
    ShopSetting(),

  ];
  void ChangeValue(int index){
    currentindex=index;
    emit(ChangeNaveButton());
  }

  Modal homeModal;
  void getxxx(){
    emit(HomeloadingState());
diohelper.getdata(url:HOME,
token:tokensssssss,
).then((value){
  homeModal=Modal.Formjson(value.data);
  print(homeModal.data.banners[0].image);
  print(homeModal.state);
  homeModal.data.products.forEach((element) {
    favorites.addAll({
      element.id:element.in_favorites
    });
  });
  

  emit(HomeEnterState());
}).catchError((error){
  print (error.toString());
  emit(HomeErorrState());
});

  }

  categoriesModal  CatogariesModal;

  void getCat(){
    diohelper.getdata(url:CATEGORIES,
      token:tokensssssss,
    ).then((value){
      CatogariesModal=categoriesModal.Fromjson(value.data);
      //print(homeModal.data.banners[0].image);
      //print(homeModal.state);

      emit(categoriesEnterState());
    }).catchError((error){
      print (error.toString());
      emit(categoriesErorrState());
    });

  }

  favoritesmodal modal;
  void changeiconfav(int id){
    favorites[id]=!favorites[id];
    emit(favoritesEnterState());

    diohelper.postdata(
        url: FAVORITES,
        token: tokensssssss,
        data:{
          'product_id':id
        }).then((value){
          modal=favoritesmodal.Formjson(value.data);
          print(value.data);
          if (!modal.states){
            favorites[id]=!favorites[id];
            emit(favoritesEnterStatessss(modal));
          }
          else{
            getFav();
          }
      emit(favoritesEnterStatessss(modal));
    }).catchError((error){
      favorites[id]=!favorites[id];
      emit(favoritesEnterState());
    });

  }

  Favoritesmodal moth;

  void getFav(){
    emit(FavloadingState());
    diohelper.getdata(url:FAVORITES,
      token:tokensssssss,
    ).then((value){
      moth=Favoritesmodal.fromJson(value.data);
      print(value.data.toString());
      //print(homeModal.data.banners[0].image);
      //print(homeModal.state);

      emit(FavssEnterState());
    }).catchError((error){
      print (error.toString());
      emit(FavssErorrState());
    });

  }

  Shoplogin  profilemodal;

  void getpro(){
    diohelper.getdata(
      url:PROFILE,
      token:tokensssssss,
    ).then((value){
      profilemodal=Shoplogin.formJosn(value.data);

      print(profilemodal.data.name);
      //print(homeModal.data.banners[0].image);
      //print(homeModal.state);

      emit(ProEnterState());
    }).catchError((error){
      print (error.toString());
      emit(ProErorrState());
    });

  }


  void putupd({
  @required name,
    @required phone,
    @required email
}){
    diohelper.putdata(
      url:UPDATE_PROFILE,
      token:tokensssssss,
      data: {
        'name':name,
        'phone':phone,
        'email':email,
      }
    ).then((value){
      profilemodal=Shoplogin.formJosn(value.data);

      print(profilemodal.data.name);
      //print(homeModal.data.banners[0].image);
      //print(homeModal.state);

      emit(ProEnterState());
    }).catchError((error){
      print (error.toString());
      emit(ProErorrState());
    });

  }


}