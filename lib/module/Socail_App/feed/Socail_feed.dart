
import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recpie/componaa/fild.dart';
import 'package:recpie/modal/socail%20App/CreatePost.dart';
import 'package:recpie/module/Socail_App/comment/Comments.dart';
import 'package:recpie/module/Socail_App/homepage/bloc/cubit.dart';
import 'package:recpie/module/Socail_App/homepage/bloc/state.dart';
import 'package:recpie/style/Icon.dart';
import 'package:recpie/style/color.dart';

class feed extends StatelessWidget {

  var textController=TextEditingController();
  var textController2=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SocailAppCubit,SocailAppState>(
      listener: (context,state){},
      builder: (context,state){
        return ConditionalBuilder(
          condition: SocailAppCubit.get(context).Posts.length>0&&SocailAppCubit.get(context).userModal!=null,
          builder: (context)=>SingleChildScrollView(
            physics:BouncingScrollPhysics(),
            child: Column(
              children: [
                Card(
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  elevation: 10,
                  margin: EdgeInsets.all(8.0),
                  child: Stack(
                    alignment: AlignmentDirectional.topEnd,
                    children: [
                      Image(
                        image: NetworkImage("https://image.freepik.com/free-photo/satisfied-student-posing-against-pink-wall_273609-20219.jpg"),
                        height: 200,
                        fit: BoxFit.cover,
                        width: double.infinity,
                      ),
                      Text("communicate with friends ",
                        style: Theme.of(context).textTheme.subtitle1.copyWith(color: Colors.white),
                      )
                    ],
                  ),
                ),
                ListView.separated(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context,index)=>buildItempost(SocailAppCubit.get(context).Posts[index],context,index),
                    separatorBuilder:(context,index)=>SizedBox(
                      height: 10.0,
                    ),
                    itemCount:SocailAppCubit.get(context).Posts.length),
                SizedBox(
                  height: 8.0,
                )
              ],
            ),
          ),
          fallback: (context)=>Center(child: CircularProgressIndicator()),
        );
    },
    );
  }

  Widget buildItempost(Postmodal modal ,context,index)=>Card(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      elevation: 5.0,
      margin: EdgeInsets.symmetric(
          horizontal: 8.0
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 25,
                  backgroundImage:NetworkImage("${modal.image}"),
                ),
                SizedBox(
                  width: 20.0,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text("${modal.name}",style: TextStyle(height: 1.4),),
                          SizedBox(
                            width: 5,
                          ),
                          Icon(
                            Icons.check_circle,
                            color: DefultColor,
                            size: 16,
                          )
                        ],
                      ),
                      Text("${modal.Time}",style: Theme.of(context).textTheme.caption.copyWith(height: 1.4),),
                    ],
                  ),
                ),
                SizedBox(
                  width:20 ,
                ),
                IconButton(
                    onPressed: (){},
                    icon: Icon(Icons.more_horiz_outlined,
                      size: 16,
                    )),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                  vertical: 15.0
              ),
              child: Container(
                width: double.infinity,
                color: Colors.grey[300],
                height: 1.0,
              ),
            ),
            Text("${modal.text}",
              style: Theme.of(context).textTheme.subtitle1,),


            /*Padding(
padding: const EdgeInsets.only(
bottom: 10.0,
top:5.0

),
child: Container(

width: double.infinity,

child: Wrap(

children: [

  /*

Padding(

padding: const EdgeInsetsDirectional.only(

end:10.0

),

child: Container(

height: 25,

child: MaterialButton(

padding: EdgeInsets.zero,

minWidth: 1.0,

onPressed:(){}, child:Text(

"# software",style:Theme.of(context).textTheme.caption.copyWith(color: DefultColor,),

)),

),

),

Padding(

padding: const EdgeInsetsDirectional.only(

end:10.0

),

child: Container(

height: 25,

child: MaterialButton(

padding: EdgeInsets.zero,

minWidth: 1.0,

onPressed:(){}, child:Text(

"# Flutter",style:Theme.of(context).textTheme.caption.copyWith(color: DefultColor,),

)),

),

),

  */

],

),

),
),
*/
            if (modal.post_Image!='')
              Padding(
                padding: const EdgeInsets.only(
                  top:15.0,
                ),
                child:   Container(
                  width: double.infinity,
                  height: 150.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4.0),
                    image: DecorationImage(
                        image: NetworkImage("${modal.post_Image}",
                        ),
                        fit: BoxFit.cover
                    ),
                  ),
                ),
              ),
            Padding(
              padding: const EdgeInsets.symmetric(
                  vertical: 5.0
              ),
              child: Row(
                children: [
                  Expanded(
                    child: InkWell(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 5.0
                        ),
                        child: Row(
                          children: [
                            Icon(IconBroken.Heart
                              ,size: 14,
                              color: Colors.red
                              ,),
                            SizedBox(
                              width: 5,
                            ),
                            Text("1",style: Theme.of(context).textTheme.caption,)
                          ],

                        ),
                      ),
                      onTap: (){},
                    ),
                  ),
                  Expanded(
                    child: InkWell(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 5.0
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Icon(IconBroken.Chat
                              ,size: 14,
                              color: Colors.amber,),
                            SizedBox(
                              width: 5,
                            ),
                            Text(" 0 comment",style: Theme.of(context).textTheme.caption,),
                          ],

                        ),
                      ),
                      onTap: (){

                      },
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.only(
                  bottom: 10.0
              ),
              child: Container(
                width: double.infinity,
                color: Colors.grey[300],
                height: 1.0,
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: InkWell(
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: 18,
                          backgroundImage:NetworkImage("${SocailAppCubit.get(context).userModal.image}"),
                        ),
                        SizedBox(
                          width: 20.0,
                        ),

                        Text("Write comment ...",style: Theme.of(context).textTheme.caption,)
                      ],
                    ),
                    onTap: (){
                      //SocailAppCubit.get(context).Comments(SocailAppCubit.get(context).postuid[index],'ahmed');
                    },
                  ),
                ),
                InkWell(
                  child: Row(
                    children: [
                      Icon(IconBroken.Heart
                        ,size: 14,
                        color: Colors.red
                        ,),
                      SizedBox(
                        width: 5,
                      ),
                      Text("Like",style: Theme.of(context).textTheme.caption,)
                    ],

                  ),
                  onTap: (){
                    //SocailAppCubit.get(context).Like(SocailAppCubit.get(context).postuid[index]);
                  },
                ),
              ],
            )

          ],
        ),
      )
  );

}

//var con=TextEditingController() ;


