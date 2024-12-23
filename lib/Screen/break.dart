import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yoga/Screen/final.dart';



class BreakTime extends StatelessWidget {
  const BreakTime({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context)=>ThirdTimeModals(context),
      child: Scaffold(
        body: Container(
              height: double.infinity,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.fitHeight,
                      image: NetworkImage("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSDGof9KdPnrFSTOqjKs36fa9yjN01y2AP64Q&s")
                  )
              ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Break Time",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30),),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Consumer<ThirdTimeModals>(builder: (context , myModel , child){
                    return Text(myModel.countdown.toString(),style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold,),);
                  },),
                  Text(" s",style: TextStyle(fontSize: 35,fontWeight: FontWeight.bold),),
                ],
              ),
             Container(
               padding: EdgeInsets.symmetric(horizontal: 10,vertical: 1),
               decoration: BoxDecoration(
                   color: Colors.blue,
                 borderRadius: BorderRadius.circular(5)
               ),
               child:  TextButton( onPressed: (){
                 Navigator.push(context, CupertinoPageRoute(builder: (context)=>FinalScreen()));
               },child : Text("SKIP",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),)),
             ),
            ],
          ),
        ),
      ),
    );
  }
}


class ThirdTimeModals with ChangeNotifier{
  ThirdTimeModals(context){
    MyTime(context);
  }

  int countdown = 10;
  MyTime(context)async{
    Timer.periodic(Duration(seconds: 1), (timer) {
      countdown--;
      notifyListeners();
      if(countdown==0){
        timer.cancel();
        //Navigator.push(context, MaterialPageRoute(builder: (context)=>FinalScreen()));
      }
    });
  }
}
