import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yoga/SQFlite_services/yagadatabase.dart';
import 'package:yoga/Screen/startup.dart';
import 'package:yoga/Widgets/customappbar.dart';
import 'package:yoga/Widgets/customdrawer.dart';
import 'package:yoga/models/model_data.dart';




class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {

  late AnimationController _animationController;
  late AnimationController _textAnimationController;
  late Animation _colorTween , _homeTween , _yogaTween ,_iconTween , _drawerTween ;

  // Future makeYoagEntry (Yoga yoga , String TableName)async{
  //   await YogaDatabase.instance.Insert(yoga, TableName);
  // }
  // Future makeAllYoagEntry (AllYoga allYoga)async{
  //   await YogaDatabase.instance.InsertAllYoga(allYoga);
  // }
  //
  //
  //  bool isLoding = true;
  //  late List<AllYoga> yogasumlst;
  //
  //  Future readYogaSumEntry() async{
  //    await YogaDatabase.instance.readyAllYogasec();
  //
  //   setState(() {
  //     isLoding = false;
  //   });
  //    print(yogasumlst);
  //  }

  @override
  void initState() {
    _animationController = AnimationController(vsync: this , duration: Duration(seconds: 0));
    _colorTween = ColorTween(begin: Colors.transparent , end: Colors.white).animate(_animationController);
    _homeTween = ColorTween(begin: Colors.white , end: Colors.blue).animate(_animationController);
    _yogaTween = ColorTween(begin: Colors.white , end: Colors.black).animate(_animationController);
    _iconTween = ColorTween(begin: Colors.white , end: Colors.blue).animate(_animationController);
    _drawerTween = ColorTween(begin: Colors.white , end: Colors.black).animate(_animationController);
    _textAnimationController = AnimationController(vsync: this, duration: Duration(seconds: 0));
    super.initState();

    // makeAllYoagEntry(AllYoga(id: null, YogaWorkOutName: YagaModels.YogaTable1, BackImg: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSrsPKmuPhL1TdxSWxN0SQySVQgDtthSgrOcQ&s", TimeTaken: "10", TotleNoOfWork: "15"));
    // makeYoagEntry(Yoga(id: null, Seconds: true, YogaTitle: "Anulom", YogaImgUrl: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSrsPKmuPhL1TdxSWxN0SQySVQgDtthSgrOcQ&s", SecondOrTime: '30'),YagaModels.YogaTable1);
    // makeYoagEntry(Yoga(id: null, Seconds: true, YogaTitle: "Vilom", YogaImgUrl: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSrsPKmuPhL1TdxSWxN0SQySVQgDtthSgrOcQ&s", SecondOrTime: '25'),YagaModels.YogaTable1);
    // makeYoagEntry(Yoga(id: null, Seconds: true, YogaTitle: "Kapalbharti", YogaImgUrl: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSrsPKmuPhL1TdxSWxN0SQySVQgDtthSgrOcQ&s", SecondOrTime: '20'),YagaModels.YogaTable1);
    //
    //
    // readYogaSumEntry();

  }

  bool scrollListener(ScrollNotification  scrollNotification){
    bool scroll = false;
    if(scrollNotification.metrics.axis == Axis.vertical){
      _animationController.animateTo(scrollNotification.metrics.pixels/80);
      _textAnimationController.animateTo(scrollNotification.metrics.pixels);
      return scroll = true;
    }
    return scroll;
  }

  // used for open drawer key
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      key: scaffoldKey,
      drawer: CustomDrawer(),
      backgroundColor: Colors.white,

      body: NotificationListener<ScrollNotification>(
        onNotification: scrollListener,
        child: Container(
          height: double.infinity,
          child: Stack(
            children: [
              SingleChildScrollView(
                child: Stack(
                  children: [
                    Column(
                      children: [
                        Container(
                          padding : EdgeInsets.fromLTRB(30 , 110, 30 , 30),
                          decoration: BoxDecoration(
                              color: Colors.red.withOpacity(0.8),
                              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20), bottomRight: Radius.circular(20))
                          ),
                          child : Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                children: [
                                  Text("1",style: TextStyle(color: Colors.white,fontSize: 18),),
                                  Text("Streak",style: TextStyle(color: Colors.white,fontSize: 18),)
                                ],
                              ),
                              Column(
                                children: [
                                  Text("150",style: TextStyle(color: Colors.white,fontSize: 18),),
                                  Text("KCAL",style: TextStyle(color: Colors.white,fontSize: 18),)
                                ],
                              ),
                              Column(
                                children: [
                                  Text("12",style: TextStyle(color: Colors.white,fontSize: 18),),
                                  Text("Minutes",style: TextStyle(color: Colors.white,fontSize: 18),)
                                ],
                              )
                            ],
                          ),
                        ),
                        Divider(thickness: 3 ,indent: 30, endIndent: 30,),

                        InkWell(
                          onTap: (){
                            Navigator.push(context, CupertinoPageRoute(builder: (context)=>Startup()));
                            },
                          child: Container(
                            padding: EdgeInsets.all(10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Yoga For All",style: TextStyle(fontSize: 15),),
                                Padding(padding: EdgeInsets.symmetric(vertical: 8,),
                                    child:  Stack(
                        children: [
                          Container(
                            height: 145,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                image: DecorationImage(
                                    image: NetworkImage("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSrsPKmuPhL1TdxSWxN0SQySVQgDtthSgrOcQ&s".toString()),fit: BoxFit.cover
                                )
                            ),
                          ),
                          Positioned(
                              left: 10,top: 5,
                              child: Text("Yoga For Beginners",style: TextStyle(color: Colors.blue,fontSize: 15,fontWeight: FontWeight.bold),)),
                          Positioned(
                              left: 10,top: 23,
                              child: Text("Last Time : 10 Dec",style: TextStyle(color: Colors.black,fontSize: 12,),))
                        ],
                      )),
                                Padding(padding: EdgeInsets.symmetric(vertical: 4),
                                    child:  Stack(
                        children: [
                          Container(
                            height: 145,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                image: DecorationImage(
                                    image: NetworkImage("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRJsOAcWrG0E8w2U977-ceeQO7ecLttG23Oyw&s"),fit: BoxFit.cover
                                )
                            ),
                          ),
                          Positioned(
                              left: 10,top: 5,
                              child: Text("Weight Loss Yoga",style: TextStyle(color: Colors.blue,fontSize: 15,fontWeight: FontWeight.bold),)),
                          Positioned(
                              left: 10,top: 23,
                              child: Text("Last Time : 16 Dec",style: TextStyle(color: Colors.black,fontSize: 12,),))
                        ],
                      )),
                              ],
                            ),
                          ),
                        ),

                        InkWell(
                          onTap: (){
                            Navigator.push(context, CupertinoPageRoute(builder: (conter)=>Startup()));
                          },
                          child: Container(
                            padding: EdgeInsets.all(10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Yoga For Student"),
                                Padding(padding: EdgeInsets.symmetric(vertical: 5),
                                    child: Stack(
                                      children: [
                                        Container(
                                          height: 145,
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(10),
                                              image: DecorationImage(
                                                  image: NetworkImage("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSuFdM0lyBFkK2emKy3sxXh_9oRUrTfcaNc1A&s"),fit: BoxFit.cover
                                              )
                                          ),
                                        ),
                                        Positioned(
                                            left: 10,top: 5,
                                            child: Text("Power Yoga",style: TextStyle(color: Colors.blue,fontSize: 15,fontWeight: FontWeight.bold),)),
                                        Positioned(
                                            left: 10,top: 23,
                                            child: Text("Last Time : 20 Dec",style: TextStyle(color: Colors.red,fontSize: 12,),))
                                      ],
                                    )
                                ),
                                Padding(padding: EdgeInsets.symmetric(vertical: 5),
                                    child:  Stack(
                                      children: [
                                        Container(
                                          height: 145,
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(10),
                                              image: DecorationImage(
                                                  image: NetworkImage("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSl_spt49_gPzgtJHp7SPIDkCG6OU7LqlHKzA&s"),fit: BoxFit.cover
                                              )
                                          ),
                                        ),
                                        Positioned(
                                            left: 10,top: 5,
                                            child: Text("Yoga For Beginners",style: TextStyle(color: Colors.blue,fontSize: 15,fontWeight: FontWeight.bold),)),
                                        Positioned(
                                            left: 10,top: 23,
                                            child: Text("Last Time : 10 Dec",style: TextStyle(color: Colors.black,fontSize: 12,),))
                                      ],
                                    )
                                ),
                                Padding(padding: EdgeInsets.symmetric(vertical: 5),
                                    child: Stack(
                                      children: [
                                        Container(
                                          height: 130,
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(10),
                                              image: DecorationImage(
                                                  image: NetworkImage("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQgfor9d7Z-3gwXZ8zgHBrpO71W-iPeUJNgxA&s"),fit: BoxFit.cover
                                              )
                                          ),
                                        ),
                                        Positioned(
                                            left: 10,top: 5,
                                            child: Text("Yoga For Beginners",style: TextStyle(color: Colors.blue,fontSize: 15,fontWeight: FontWeight.bold),)),
                                        Positioned(
                                            left: 10,top: 23,
                                            child: Text("Last Time : 10 Dec",style: TextStyle(color: Colors.black,fontSize: 12,),))
                                      ],
                                    )
                                ),
                                Padding(padding: EdgeInsets.symmetric(vertical: 5),
                                    child: Stack(
                                      children: [
                                        Container(
                                          height: 130,
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(10),
                                              image: DecorationImage(
                                                  image: NetworkImage("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTbyogOMkaFhwOrTvXamK3Zejfg0TaqLhsPAQ&s"),fit: BoxFit.cover
                                              )
                                          ),
                                        ),
                                        Positioned(
                                            left: 10,top: 5,
                                            child: Text("Yoga For Beginners",style: TextStyle(color: Colors.blue,fontSize: 15,fontWeight: FontWeight.bold),)),
                                        Positioned(
                                            left: 10,top: 23,
                                            child: Text("Last Time : 10 Dec",style: TextStyle(color: Colors.red,fontSize: 12,),))
                                      ],
                                    )
                                )
                              ],
                            ),
                          )
                        ),
                      ],
                    )
                  ],
                ),
              ),


              CustomAppBar(animationController: _animationController, colorTween: _colorTween, iconTween: _iconTween, homeTween: _homeTween, yogaTween: _yogaTween, drawerTween: _drawerTween,
                  onPressed: (){scaffoldKey.currentState?.openDrawer();}
              )


            ],
          ),
        )
      ),
    );
  }
}


