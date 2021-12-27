import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:recpie/Bloc/Cubit.dart';
import 'package:recpie/module/newsApp/web_View/Web_view_Screan.dart';
import 'package:recpie/module/shopApp/bloc/cubit/Shoplayout_Cubit.dart';
import 'package:recpie/style/Icon.dart';
import 'package:recpie/style/color.dart';
Widget Button({
  double Aidth =double.infinity,
  Color Aackground=Colors.blue,
  @required Function function,
  bool inuppuer=true,
  double x=0.0,
  BoxDecoration e,
  BorderRadius s,
  @required String text ,
})=>Container(
    height: 40,
    width: Aidth,

    child:Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(x),
        color: Aackground,
      ),
      child:MaterialButton(
        onPressed: function,
        child: Text(inuppuer?text.toUpperCase():text,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15,color: Colors.white),),),
    )
);


Widget Appbar({@required context,String title,
List<Widget>action,
})=>AppBar(
  leading:IconButton(
    icon: Icon(
      IconBroken.Arrow___Left_2
    ),
    onPressed: (){
      Navigator.pop(context);
    },
  ) ,
  title: Text(title),
  actions: action,
);



//Icons.remove_red_eye_sharp
Widget importForm({
  @required TextEditingController controller,
  @required  String Text,
  @required  Function valudat,
  Function onSubmit,
  Function inChange,
  @required  IconData Iconsss,
  @required  TextInputType Keybord,
  bool abscure=false,
  IconData suffix,
  Function setstate,
  Function onTap,
})=>TextFormField(
  controller:controller,
  decoration: InputDecoration(
    labelText: Text,
    border:OutlineInputBorder(),
    prefixIcon: Icon(
      Iconsss,
    ),
    suffixIcon: suffix!=null? IconButton(
      icon: Icon(suffix),
      onPressed: setstate,
    ):null,
  ),
  keyboardType: Keybord,
  onFieldSubmitted: onSubmit,
  onChanged: inChange,
  validator:valudat,
  obscureText:abscure ,
  onTap: onTap,
);

Widget  impBuild(Map module)=>Padding(
  padding: const EdgeInsets.all(20.0),
  child:   Row(

    children: [

      CircleAvatar(

        radius: 40,

        child: Text("${module["title"]}"),

      ),

      SizedBox(

        width: 20,

      ),

      Column(

        mainAxisSize: MainAxisSize.min,

        children: [

          Text("${module["data"]}",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),

          Text("${module["time"]}",style: TextStyle(fontSize: 20,color: Colors.grey),)

        ],

      )

    ],

  ),
);
Widget BulidTask(Map Modal,context)=>Dismissible(
  key: Key(Modal['id'].toString()),
  child:   Padding(

    padding: const EdgeInsets.all(20.0),

    child: Row(

      children: [

        CircleAvatar(

          radius: 40,

          child:Text("${Modal["date"]}"),

        ),

        SizedBox(

          width: 20.0,

        ),

        Expanded(

            child: Column(

            mainAxisSize: MainAxisSize.min,

            crossAxisAlignment: CrossAxisAlignment.start,

            children: [

              Text("${Modal["title"]}",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),

              SizedBox(

                width: 20.0,

              )

              ,Text("${Modal["time"]}",style: TextStyle(color: Colors.grey),)

            ],

          ),

        ),

        IconButton(

            icon:Icon(Icons.check_box),

            color: Colors.green

            , onPressed:(){

           Appcubit.get(context).UpdatedataBase(states:'done' , id:Modal['id']);

        }),

        IconButton(

            icon:Icon(Icons.archive),

            color: Colors.black45

            , onPressed:(){

          Appcubit.get(context).UpdatedataBase(states:'archive' , id:Modal['id']);

        }),

      ],

    ),

  ),
  onDismissed: (direction){
Appcubit.get(context).DeletdataBase(id:Modal['id'] );
  },
);

Widget taskBulider({@required List <Map>tasks})=>ConditionalBuilder(
  condition: tasks.length>0,
  builder: (context,)=>ListView.separated(
      itemBuilder: (context,index)=>BulidTask(tasks[index],context),
      separatorBuilder: (context,index)=>Padding(
        padding: const EdgeInsets.all(20.0),
        child: Container(
          height: 1,
          width: double.infinity,
          color: Colors.grey[300],
        ),
      ),
      itemCount: tasks.length
  ),
  fallback: (context)=>Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(Icons.menu,size: 100,color: Colors.grey,),
        Text('No Task Yet !..Please Enter Your Tasks',style:TextStyle(fontWeight: FontWeight.bold,fontSize: 16.0,color: Colors.grey))
      ],
    ),
  ),
);

Widget BuildArticleItem(article,context)=>InkWell(
  onTap: (){
    navigato(context, webscreanview(article['url']));
  },
  child:   Padding(
  
  
  
  padding: const EdgeInsets.all(20.0),
  
  
  
  child: Row(
  
  
  
  children: [
  
  
  
  Container(
  
  
  
  height: 120,
  
  
  
  width: 120,
  
  
  
  decoration: BoxDecoration(
  
  
  
  borderRadius: BorderRadius.circular(10.0),
  
  
  
  image:DecorationImage(
  
  
  
  image: NetworkImage('${article['urlToImage']}'),
  
  
  
  fit: BoxFit.cover,
  
  
  
  )
  
  
  
  ),
  
  
  
  ),
  
  
  
  SizedBox(
  
  
  
  width: 20.0,
  
  
  
  ),
  
  
  
  Expanded(
  
  
  
  child: Container(
  
  
  
  height: 120,
  
  
  
  child: Column(
  
  
  
  mainAxisSize: MainAxisSize.min,
  
  
  
  crossAxisAlignment: CrossAxisAlignment.start,
  
  
  
  children: [
  
  
  
  Expanded(child: Text('${article['title']}',
  
  
  
  maxLines: 3,
  
  
  
  overflow: TextOverflow.ellipsis,
  
  
  
  style:Theme.of(context).textTheme.bodyText1,
  
  
  
    )),
  
  
  
  Text('${article['publishedAt']}',style: TextStyle(color: Colors.grey),),
  
  
  
  ],
  
  
  
  ),
  
  
  
  ),
  
  
  
  )
  
  
  
  
  
  
  
  ],
  
  
  
  ),
  
  
  
  ),
);
Widget decor()=> Padding(
  padding: const EdgeInsets.all(8.0),
  child:   Container(
    height: 1,

    width: double.infinity,

    color: Colors.grey[300],

  ),
);




void navigato(context,widget)=>Navigator.push(
context,
MaterialPageRoute(
builder: (context)=> widget),
);

Widget articleBuilder(list,context) => ConditionalBuilder(
  condition: list.length > 0,
  builder: (context) =>
      ListView.separated(
        physics: BouncingScrollPhysics(),
        itemBuilder: (context, index) => BuildArticleItem(list[index],context),
        separatorBuilder: (context, index) => decor(),
        itemCount: 10,),
  fallback: (context) => Center(child: CircularProgressIndicator()),
);
void navigatoandnotreturn(context,widget)=>Navigator.pushAndRemoveUntil(context,
  MaterialPageRoute(builder: (context)=> widget),
    (Route<dynamic>route)=>false,
);

Widget DefultButton2({
  @required Function Fun,
  @required String text
})=>TextButton(onPressed: Fun, child:Text(text.toUpperCase()));



void  toast({
  @required String text,
  @required ToastColor State
})=>Fluttertoast.showToast(
    msg: text,
    toastLength: Toast.LENGTH_LONG,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: 5,
    backgroundColor: SwitchColor(State),
    textColor: Colors.white,
    fontSize: 16.0
);
enum ToastColor {Error,Enter,Warning}

Color SwitchColor(ToastColor State){
  Color color;
  switch(State){
    case (ToastColor.Enter):
      color=Colors.green;
      break;
  case (ToastColor.Warning):
  color=Colors.amber;
  break;
    case (ToastColor.Error):
      color=Colors.red;
      break;
  }
  return color;
}


Widget ListItem(mothss,context,{bool old_prise=true})=>Padding(
  padding: const EdgeInsets.all(20.0),
  child: Container
    (
    height: 120,
    child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            alignment: AlignmentDirectional.bottomStart,
            children: [
              Image(
                image: NetworkImage(mothss.image),
                width: 120,
                height: 120,

              ),
              if (mothss.discount!=0&&old_prise)
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
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(mothss.name,
                  maxLines: 2,overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: 14,height: 1.3),

                ),
                Spacer(
                ),
                Row(
                  children: [
                    Text(mothss.price.toString(),style: TextStyle(fontSize: 12,color: DefultColor),),
                    SizedBox(
                      width: 5,
                    ),
                    if (mothss.discount!=0&& old_prise)
                      Text(mothss.oldPrice.toString(),style: TextStyle(fontSize: 12,color: DefultColor,decoration:TextDecoration.lineThrough ),),
                    Spacer(),
                    IconButton(
// padding: EdgeInsets.zero,
                        onPressed: (){
                          layoutCubit().get(context).changeiconfav(mothss.id);
                        },
                        icon: CircleAvatar(
                            backgroundColor: layoutCubit().get(context).favorites[mothss.id]?DefultColor:Colors.grey,
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
        ]
    ),
  ),
);

circle(){
  return Container(
    child:Center(child: CircularProgressIndicator(valueColor: AlwaysStoppedAnimation(Colors.blue),)),
    alignment: Alignment.center,
    padding: EdgeInsets.only(
      top: 12.0
    ),
  );
}


liner(){
  return Container(
    child:Center(child: LinearProgressIndicator(valueColor: AlwaysStoppedAnimation(Colors.blue),)),
    alignment: Alignment.center,
    padding: EdgeInsets.only(
        top: 12.0
    ),
  );
}