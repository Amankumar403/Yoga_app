import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yoga/Screen/ruready.dart';


class Startup extends StatefulWidget {
  const Startup({super.key});

  @override
  State<Startup> createState() => _StartupState();
}

class _StartupState extends State<Startup> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Colors.blue,
            pinned: true,
            expandedHeight: 300,
            flexibleSpace: FlexibleSpaceBar(
              title:  Text("Yoga"),
              background: Image.network("https://cdn.pixabay.com/animation/2022/10/05/15/54/15-54-38-48_512.gif",fit: BoxFit.cover,),
            ),
            actions: [
              IconButton(onPressed: (){}, icon: Icon(Icons.thumb_up,color: Colors.white,))
            ],
          ),
          SliverToBoxAdapter(
            child: Container(
              padding: EdgeInsets.all(20),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text("20min ' 60Workouts",style: TextStyle(fontWeight: FontWeight.w400),),
                    ],
                  ),
                  Divider(thickness: 2,),
                  ListView.separated(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    separatorBuilder: (context , index)=>Divider(thickness: 2,),
                    itemCount: 10,
                    itemBuilder: (context , index)=>ListTile(
                      leading: Container(
                        margin: EdgeInsets.only(right: 10,),
                        child: Image.network("https://cdn.pixabay.com/animation/2023/02/24/22/23/22-23-30-31_512.gif",fit: BoxFit.cover,),
                      ),
                      title: Text("Yoga $index",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
                      subtitle: Text((index%2 == 0)? "00:20" : "x20",style: TextStyle(fontSize: 15)),
                    ),
                  )
                ],
              ),
            )
          )
        ],
      ),

      floatingActionButton: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue,
            padding: EdgeInsets.symmetric(horizontal: 25,vertical: 15),
              textStyle: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold)
          ),
        child: Text("START",style: TextStyle(color: Colors.white),),
        onPressed: (){
            Navigator.push(context, CupertinoPageRoute(builder: (context)=>RUready()));
        },
      ),
    );
  }
}
