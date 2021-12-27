

import 'dart:ui';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recpie/componaa/fild.dart';
import 'package:recpie/modal/shopApp/Home_modal.dart';
import 'package:recpie/modal/shopApp/categories_modal.dart';
import 'package:recpie/module/shopApp/bloc/cubit/Shoplayout_Cubit.dart';
import 'package:recpie/module/shopApp/bloc/states/Shoplayout_States.dart';
import 'package:recpie/module/shopApp/cubit/cubit.dart';
import 'package:recpie/module/shopApp/cubit/states.dart';
import 'package:recpie/style/color.dart';

class ShopProducts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<layoutCubit,LayoutStates>(
        listener:(context,state){
          if(state is favoritesEnterStatessss){
            if (!state.modass.states){
              toast(
                  text: state.modass.massage
                  , State:ToastColor.Error);
            }
          }
        },
    builder: (context,state){
         return ConditionalBuilder(
            condition:layoutCubit().get(context).homeModal!=null && layoutCubit().get(context).CatogariesModal!=null,
            builder: (context)=>prodectsBuilder(layoutCubit().get(context).homeModal,layoutCubit().get(context).CatogariesModal,context ),
            fallback:(context)=> Center(child: CircularProgressIndicator()),

          );

    },);
  }
}


Widget prodectsBuilder(Modal homeMooodal,categoriesModal categoriesmodal,context)=>SingleChildScrollView(
  physics: BouncingScrollPhysics(),
    child:   Column(
      crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      CarouselSlider(
          items: homeMooodal.data.banners.map((e) =>
              Image(image: NetworkImage('${e.image}'),
            width: double.infinity,
            fit: BoxFit.cover,
          )).toList(),
          options: CarouselOptions(
            height: 250.0,
            initialPage:0,
            reverse: false,
            viewportFraction: 1.0,
            autoPlay: true,
            enableInfiniteScroll: true,
            autoPlayInterval: Duration(seconds: 3),
            autoPlayAnimationDuration : Duration(seconds: 1),
            scrollDirection: Axis.horizontal,
            autoPlayCurve: Curves.fastOutSlowIn
          ),
      ),
      SizedBox(
        height: 5,
      ),

      Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Categories",style: TextStyle(
              fontWeight: FontWeight.w800,
              fontSize: 24
            ),),
            SizedBox(
              height: 10,
            ),
            Container(
              height: 100,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                  physics: BouncingScrollPhysics(),
                  itemBuilder: (context,index)=>Categories(categoriesmodal.data.data[index]),
                  separatorBuilder: (context,index)=>SizedBox(
                    width: 10,
                  ),
                  itemCount:categoriesmodal.data.data.length),
            ),
            SizedBox(
              height: 10,
            ),
            Text("New Products",style: TextStyle(
                fontWeight: FontWeight.w800,
                fontSize: 24
            ),),
          ],
        ),
      ),
      SizedBox(
        height: 5,
      ),
      Container(
        color:Colors.grey[300],
        child: GridView.count(
          shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            crossAxisCount: 2,
          crossAxisSpacing: 1,
          mainAxisSpacing: 1,
          childAspectRatio: 1/1.72,
          children:List.generate(homeMooodal.data.products.length,
              (index)=>Proudect(homeMooodal.data.products[index],context)
          ),
        ),
      )
      ],

  ),

);

Widget Categories(Modaldata modal)=>Stack(
  alignment: Alignment.bottomCenter,
  children: [

    Image(image: NetworkImage(modal.image),
      height: 100,
      width: 100,
      fit: BoxFit.cover
      ,),
    Container(
      width: 100,
      color: Colors.black.withOpacity(.6),
      child: Text(modal.name,
        textAlign: TextAlign.center,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(color: Colors.white),

      ),
    )
  ],
);

Widget Proudect(DataModalproudect MOD,context)=>Container(
  color:Colors.white,
  child:Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Stack(
        alignment: AlignmentDirectional.bottomStart,
        children: [
          Image(
            image: NetworkImage(
              MOD.image,
            ),
            width: double.infinity,
            height: 200,
            //fit: BoxFit.cover,
             ),
          if (MOD.discount!=0)
          Container(
            color: Colors.red,
              padding: EdgeInsets.symmetric(
                  horizontal: 5.0),
              child: Text(
                "DICOUNT",
                style:
                TextStyle(fontSize: 8.0,color: Colors.white),))
        ],
      ),
      Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(MOD.name,
              maxLines: 2,overflow: TextOverflow.ellipsis,
              style: TextStyle(fontSize: 14,height: 1.3),

            ),
            Row(
              children: [
                Text('${MOD.price.round()}',style: TextStyle(fontSize: 12,color: DefultColor),),
                SizedBox(
                  width: 5,
                ),
                if (MOD.discount!=0)
                Text('${MOD.old_price.round()}',style: TextStyle(fontSize: 12,color: DefultColor,decoration:TextDecoration.lineThrough ),),
                Spacer(),
                IconButton(
                 // padding: EdgeInsets.zero,
                    onPressed: (){
                      layoutCubit().get(context).changeiconfav(MOD.id);
                    },
                    icon: CircleAvatar(
                      backgroundColor: layoutCubit().get(context).favorites[MOD.id]?DefultColor:Colors.grey,
                      radius: 15,
                        child: Icon(
                          Icons.favorite_border
                          ,size: 14.0,
                        color: Colors.white,)))
              ],
            ),
          ],
        ),
      )
    ],
  ),
);