import 'package:flutter/material.dart';
import 'package:yoga/Screen/homepage.dart';


class FinalScreen extends StatelessWidget {
  const FinalScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Image.network("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSANkVgjPw-aYzcXD9k1I28fTRIuA1VRQZazg&s"),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20,vertical: 15),
              child:  Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Text("1",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                      Text("Streak",style: TextStyle(fontSize: 18),)
                    ],
                  ),
                  Column(
                    children: [
                      Text("150",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                      Text("KCAL",style: TextStyle(fontSize: 18),)
                    ],
                  ),
                  Column(
                    children: [
                      Text("12",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                      Text("Minutes",style: TextStyle(fontSize: 18),)
                    ],
                  )
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 5),
              child:  Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(onPressed: (){}, child: Text("DO IT AGAIN")),
                  TextButton(onPressed: (){}, child: Text("SHARE"))
                ],
              ),
            ),
            Stack(
              children: [
                Container(
                  height: 200,
                  color: Colors.grey,
                ),
                Positioned(
                  left: 150,bottom: 100,
                  child: Icon(Icons.image,size: 50,),
                ),
                Positioned(
                    left: 146,bottom: 70,
                    child: Text("ADS",style: TextStyle(fontSize: 30),)
                )
              ],
            ),
            SizedBox(height: 40,),
            Text("Reat This Yoag Asans"),
            SizedBox(height: 10,),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                 // backgroundColor: Colors.blue,
                  padding: EdgeInsets.symmetric(horizontal: 25,vertical: 15),
                  textStyle: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold)
              ),
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage()));
              },
                child: Text("NEXT"),
            )
          ],
        ),
      )
    );
  }
}
