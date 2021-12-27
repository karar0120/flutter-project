import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:recpie/componaa/fild.dart';
class Login_Design extends StatefulWidget {
  @override
  _Login_DesignState createState() => _Login_DesignState();
}

class _Login_DesignState extends State<Login_Design> {
  var email=TextEditingController();

  var Password=TextEditingController();

  var Keystate=GlobalKey<FormState>();
bool jo=true;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:Scaffold(
        appBar:AppBar(),
        body: Padding(
          padding:EdgeInsets.all(20.0),
          child:Center(
            child: SingleChildScrollView(
              child: Form(
                key: Keystate,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  // mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text("Login",
                      style: TextStyle(
                        fontSize: 40.0,
                        fontWeight: FontWeight.bold,
                      ),),
                    SizedBox(
                      height: 40,
                    ),
                   importForm(
                           Text: "Email",
                     Iconsss: Icons.email,
                       controller:email,
                     Keybord: TextInputType.emailAddress,
                     valudat: (String value){
                         if (value.isEmpty){
                           return ("the Email must be found");
                         }
                              return null;}),
                    SizedBox(
                      height: 20,
                    ),
                   importForm(
                     controller: Password,
                     Text:"Password",
                     Iconsss: Icons.lock,
                     abscure: jo,
                       suffix:jo?Icons.visibility_off:Icons.visibility,
                        setstate: (){
                       setState(() {
                         if (jo==true){
                           jo=false;
                         }
                         else {
                           jo=true;
                         }
                       });
                        },

                     Keybord: TextInputType.visiblePassword,
                     valudat: (String value){
                       if (value.isEmpty){
                         return("the password must be found");
                       }
                       return null;
                     }

                   ),
                    SizedBox(
                      height: 15,
                    ),
                    Button(
                    text: "login",
                      inuppuer: true,
                      x:10,
                      function: (){
                        {
                          if (Keystate.currentState.validate()){
                              print (email.text);
                              print(Password.text);
                          }
                        }
                      }

                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text("Don't Have Email?"),
                          TextButton(onPressed:(){}, child:Text("Register Now"))

                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
