import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {

  AnimationController animationController;
  Animation colorTween , homeTween , yogaTween ,iconTween , drawerTween ;
  Function ()? onPressed;

  CustomAppBar({required this.animationController , required this.colorTween ,required this.iconTween ,  required this.homeTween , required this.yogaTween , required this.drawerTween , required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      child: AnimatedBuilder(
        animation: animationController,
        builder: (BuildContext context, Widget? child)=> AppBar(
          backgroundColor: colorTween.value,
          leading: IconButton(
            icon: Icon(Icons.dehaze,color: drawerTween.value,),
            onPressed: onPressed,
          ),
          title: Row(
            children: [
              Text("HOME",style: TextStyle(color: homeTween.value, fontWeight: FontWeight.bold,fontSize: 20),),
              Text("YOGA",style: TextStyle(color: yogaTween.value, fontWeight: FontWeight.bold,fontSize: 20),)
            ],
          ),
          actions: [
            Icon(Icons.notifications,color: iconTween.value,size: 25,),
            //SizedBox(width: 5,),
            Padding(padding: EdgeInsets.all(9),
              child: CircleAvatar(backgroundImage: NetworkImage("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRQGaIyIfD5mGH8XTXf_xGdR1lkFws9IdfH1a6bgP3KIoSAMP_GqWj3WXF-ZXcYy32--6U&usqp=CAU"),),
            )
          ],
        ),
      ),
    );
  }
}
