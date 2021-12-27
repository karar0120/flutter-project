
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recpie/componaa/fild.dart';
import 'package:recpie/module/Socail_App/homepage/bloc/cubit.dart';
import 'package:recpie/module/Socail_App/homepage/bloc/state.dart';
import 'package:recpie/style/Icon.dart';
import 'package:recpie/style/color.dart';

class NewPost extends StatelessWidget {

  var textController=TextEditingController();
  var now=DateTime.now();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SocailAppCubit,SocailAppState>(
      listener: (context,state){
      },
      builder: (context,state){
        return  Scaffold(
          appBar:Appbar(
              context: context,
              title: "Create Post",
              action: [
                TextButton(
                    onPressed:(){
                      if (SocailAppCubit.get(context).PostImage==null) {
                        SocailAppCubit.get(context).Postcreate(
                          text: textController.text,
                          Time: now.toString(),
                        );
                      }
                        else{
                        SocailAppCubit.get(context).PostcreateImage(
                          text: textController.text,
                          Time: now.toString(),
                        );
                      }
                    }, child:Text("POST") )
              ]
          ),
          body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                if (state is SocialPostcreateloadingState)
                LinearProgressIndicator(),
                SizedBox(
                  height: 5.0,
                ),
                Row(
                  children: [
                    CircleAvatar(
                      radius: 25,
                      backgroundImage:NetworkImage("https://image.freepik.com/free-photo/beautiful-woman-with-cheerful-expression-keeps-hands-chin-wears-neat-white-shirt-big-round-glasses-looks-joyfully-being-good-mood-isolated-yellow-wall_273609-42044.jpg"),
                    ),
                    SizedBox(
                      width: 20.0,
                    ),
                    Expanded(child: Text("Ahmed Karar",style: TextStyle(height: 1.4),)),
                    SizedBox(
                      width: 5,
                    ),
                    //Text("Public",style: Theme.of(context).textTheme.caption,)
                  ],
                ),
                Expanded(
                  child: TextFormField(
                    controller: textController,
                    decoration: InputDecoration(
                        hintText: 'What is on your mind,...',
                      border: InputBorder.none
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                if (SocailAppCubit.get(context).PostImage!=null)
                Stack(
                  alignment:AlignmentDirectional.topEnd ,
                  children: [
                    Container(
                      width: double.infinity,
                      height: 150.0,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4.0),
                          image: DecorationImage(
                              image:FileImage(SocailAppCubit.get(context).PostImage),
                              fit: BoxFit.cover
                          )
                      ),
                    ),
                    IconButton(
                      onPressed:(){
                         SocailAppCubit.get(context).reomverimage();
                        },
                        icon: CircleAvatar(
                          radius: 20.0,
                            child: Icon(Icons.close)),),

                  ],
                ),
                SizedBox(
                  height: 20.0,
                ),
                Row(
                  children: [
                    Expanded(
                    child: TextButton(
                          onPressed: (){
                            SocailAppCubit.get(context).getPostImage();
                          }, child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(IconBroken.Image),
                          SizedBox(
                              width: 5,),
                          Text("add photo")
                        ],
                      )),
                    ),
                    Expanded(
                      child: TextButton(
                          onPressed: (){}, child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          //Icon(IconBroken.Image),
                          SizedBox(
                            width: 5,),
                          Text("# Tags")
                        ],
                      )),
                    ),
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
