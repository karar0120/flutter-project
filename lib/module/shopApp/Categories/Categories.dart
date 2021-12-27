
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recpie/componaa/fild.dart';
import 'package:recpie/modal/shopApp/Home_modal.dart';
import 'package:recpie/modal/shopApp/categories_modal.dart';
import 'package:recpie/module/shopApp/bloc/cubit/Shoplayout_Cubit.dart';
import 'package:recpie/module/shopApp/bloc/states/Shoplayout_States.dart';

class ShopCategories extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<layoutCubit, LayoutStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return ListView.separated(
            itemBuilder: (context, index) =>
                ShopCategoriess(layoutCubit()
                    .get(context)
                    .CatogariesModal
                    .data
                    .data[index]),
            separatorBuilder: (context, index) => decor(),
            itemCount: layoutCubit()
                .get(context)
                .CatogariesModal
                .data
                .data
                .length
        );
      },
    );
  }
}

  Widget ShopCategoriess(Modaldata mo) =>
      Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          children: [
            Image(image: NetworkImage(mo.image),
              width: 80,
              height: 80,
              fit: BoxFit.cover,
            ),
            SizedBox(
              width: 20,
            ),
            Text(mo.name,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
            Spacer(),
            Icon(Icons.arrow_back_ios),
          ],
        ),
      );
