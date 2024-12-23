import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yoga/Screen/break.dart';
import 'package:yoga/Screen/startup.dart';



class WorkOutData extends StatelessWidget {
  const WorkOutData({super.key});
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context)=>SecTimeModels(context),
      child: Scaffold(
        body: Stack(
          children: [
            Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 300,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage("https://cdn.pixabay.com/animation/2023/02/24/22/23/22-23-30-31_512.gif")
                        )
                    ),
                  ),
                  Spacer(),

                  Text("Anulom Vilom",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 35),),

                  SizedBox(height: 30,),

                  Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("00 : ",style: TextStyle(fontSize: 35,fontWeight: FontWeight.bold),),
                          Consumer<SecTimeModels>(builder: (context , myModel , child){
                            return Text(myModel.countdown.toString(),style: TextStyle(fontSize: 35,fontWeight: FontWeight.bold),);
                          },),
                        ],
                      )
                  ),

                  SizedBox(height: 40,),

                  Consumer<SecTimeModels>(builder: (context , myModels , child){
                    return ElevatedButton(
                      onPressed: (){
                         myModels.show();
                        },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          padding: EdgeInsets.symmetric(horizontal: 25,vertical: 15),
                          textStyle: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold)
                      ),
                      child: Text("PAUSE",style: TextStyle(color: Colors.white),),
                    );
                  }),

                  Spacer(),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>Startup()));}, child: Text("PREVIOUS"),),
                      TextButton(onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>BreakTime()));}, child: Text("SKIP"))
                    ],
                  ),
                  Divider(thickness: 2,),
                  Align(
                      alignment: Alignment.bottomLeft,
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 10,horizontal: 15),
                        child: Text("Next: Anulom Vilom",style: TextStyle(fontWeight: FontWeight.bold),),
                      )
                  )
                ],
              ),
            ),
            Consumer<SecTimeModels>(builder: (context , myModel , child){
              return Visibility(
                visible: myModel.visible,
                child: Container(
                  width: double.infinity,
                  height: double.infinity,
                  color: Colors.blue.withOpacity(0.9),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Pause",style: TextStyle(fontSize: 35,fontWeight: FontWeight.bold,color: Colors.white),),
                      OutlinedButton(
                        onPressed: (){},
                        child: Container(
                          width: 120,
                          child: Text("RESTART",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
                        ),
                      ),
                      OutlinedButton(
                        onPressed: (){},
                        child: Container(
                          width: 120,
                          child: Text("QUIT",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),textAlign: TextAlign.center),
                        ),
                      ),
                      OutlinedButton(
                        onPressed: (){
                          myModel.hide();
                        },
                        child: Container(
                          width: 120,
                          child: Text("RESUME" ,style: TextStyle(fontWeight: FontWeight.bold),textAlign: TextAlign.center),
                        ),
                        style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.white)),
                      )
                    ],
                  ),
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}

class SecTimeModels with ChangeNotifier{
  SecTimeModels(context){
   MyTime(context);
  }
  int countdown = 30;

  bool visible = false;

  MyTime(context)async{
    Timer.periodic(Duration(seconds: 1), (timer) {
      countdown--;
      notifyListeners();
      if(countdown==0){
        timer.cancel();
        Navigator.push(context, MaterialPageRoute(builder: (context)=>BreakTime()));
      }
    });
  }

  void show(){
   visible = true;
   notifyListeners();
  }
  void hide(){
    visible = false;
    notifyListeners();
  }

}

