

import 'package:flutter/material.dart';
import 'package:recpie/componaa/fild.dart';
import 'package:recpie/module/Socail_App/homepage/bloc/cubit.dart';

class LoginTelegramScrean extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient:LinearGradient(
            begin:Alignment.topRight,
              end:Alignment.bottomLeft,
            colors: [Colors.lightBlueAccent,Colors.purpleAccent],
          ),
        ),
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("Telegram App",style: Theme.of(context).textTheme.subtitle1  .copyWith(
         fontSize: 50.0,
              color: Colors.white
        ),
            ),
            SizedBox(
height: 10,
            ),
            InkWell(
              onTap: (){
               // navigato(context,SocailAppCubit());
              },
              child: Center(
                child: Column(
                  children: [
                    Container(
                        width: 270,
                        height: 60,
                      decoration: BoxDecoration(
                        image:DecorationImage(
                          image: NetworkImage("https://onymos.com/wp-content/uploads/2020/10/google-signin-button-1024x260.png"),
                          fit: BoxFit.cover
                        )
                      ),

                    ),
                    Padding(
                        padding: EdgeInsetsDirectional.all(1.0),
                    child:circle(),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
