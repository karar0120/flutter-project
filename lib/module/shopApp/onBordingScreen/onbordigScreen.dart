
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:recpie/componaa/fild.dart';
import 'package:recpie/module/shopApp/loginScreen/ShopLogin.dart';
import 'package:recpie/network/locol/sherdhelp.dart';
import 'package:recpie/style/color.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';


class BroadingModel{
  String image;
  String title;
  String body;
  BroadingModel({@required this.image,@required this.title,@required this.body});
}


class onBordingScreen extends StatefulWidget {
  @override
  State<onBordingScreen> createState() => _onBordingScreenState();
}

class _onBordingScreenState extends State<onBordingScreen> {
  var BorderControler=PageController();

  bool number=false;

  List<BroadingModel>Borading=[
    BroadingModel(
        image: 'https://image.freepik.com/free-vector/father-son-buying-food-supermarket-cashier-trolley-store-flat-vector-illustration-shopping-grocery-store-concept_74855-10054.jpg',
        title: " onBroading_1",
        body:"onBroading_1 Title"),
    BroadingModel(
        image: 'https://image.freepik.com/free-vector/father-son-buying-food-supermarket-cashier-trolley-store-flat-vector-illustration-shopping-grocery-store-concept_74855-10054.jpg',
        title: " onBroading_2",
        body:"onBroading_2 Title"),
    BroadingModel(
        image: 'https://image.freepik.com/free-vector/father-son-buying-food-supermarket-cashier-trolley-store-flat-vector-illustration-shopping-grocery-store-concept_74855-10054.jpg',
        title: " onBroading_3",
        body:"onBroading_3 Title"),
  ];
  void Submitoooo(){
    sharedhelper.saveData(Key: 'you', value: true).then((value) {
      if (value){
        navigatoandnotreturn(context, ShopLogin());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          DefultButton2(
Fun: Submitoooo,
              text: ("SKIP"))
        ],
      ),
      body:Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          children: [
            Expanded(
              // ignore: non_constant_identifier_names
              child: PageView.builder(
                physics: BouncingScrollPhysics(),
                  controller: BorderControler,
                  onPageChanged: (int index) {
                  if (index==Borading.length-1){
                    setState(() {
                      number=true;
                    });
                  }
                  else {
                    number=false;
                  }
                  },
                  itemBuilder:(context,index)=>onBoardingBuild(Borading[index]),
              itemCount: Borading.length ),
            ),
            SizedBox(
              height: 40,
            ),
            Row(
              children: [
                SmoothPageIndicator(
                    controller: BorderControler,
                    effect:ExpandingDotsEffect(
                      dotColor: Colors.grey,
                      activeDotColor: DefultColor,
                      dotHeight: 10,
                      dotWidth: 10,
                      expansionFactor: 4,
                      spacing: 5.0
                    ),
                    count: Borading.length),
                Spacer(),
                FloatingActionButton(onPressed:(
                    ){
                  if (number){
                    Submitoooo();
                  }
                  else {BorderControler.nextPage(
                      duration: Duration(
                          milliseconds: 750
                      ),
                      curve: Curves.fastLinearToSlowEaseIn);}
                },
                child: Icon(Icons.arrow_back_ios),)
              ],
            )
          ],
        ),
      ),
    );
  }
}



Widget onBoardingBuild (BroadingModel Modallll )=>Column(
crossAxisAlignment: CrossAxisAlignment.start,
children: [
Expanded(child: Image(image:NetworkImage('${Modallll.image}'),)),
SizedBox(
height: 30,
),
Text("${Modallll.title}",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 24),),
SizedBox(height: 15,),
Text('${Modallll.body}',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
  SizedBox(
    height: 30,
  ),
],
);
