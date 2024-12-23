import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yoga/Screen/workout.dart';


class RUready extends StatelessWidget {
  const RUready({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context)=>TimeModel(context),
      child: Scaffold(
        body: Center(
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
    SizedBox(height: MediaQuery.of(context).size.height/2-100,),
                Text("Are You Redy ?",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
                SizedBox(height: 30,),
                Consumer<TimeModel>(builder: (context , myModel , child){
                  return Text(myModel.countdown.toString(),style: TextStyle(fontSize: 45));
                }),
    Spacer(),
                Divider(thickness: 2,indent: 10,endIndent: 10,),
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
        )
      ),
    );
  }
}


class TimeModel with ChangeNotifier{
  TimeModel(context){
    MyTime(context);
  }
  int countdown = 3;
  MyTime(context)async{
    Timer.periodic(Duration(seconds: 1), (timer) {
      countdown--;
      notifyListeners();
      if(countdown==0){
        timer.cancel();
        Navigator.push(context, CupertinoPageRoute(builder: (context)=>WorkOutData()));
      }
    });
  }
}
