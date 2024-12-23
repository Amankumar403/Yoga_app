import 'package:flutter/material.dart';


class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 200,
            decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSrsPKmuPhL1TdxSWxN0SQySVQgDtthSgrOcQ&s")
                )
            ),
          ),

          ListTile(
            title: Text("Reset Porgress",style: TextStyle(fontSize: 18),),
            leading: Icon(Icons.restart_alt,size: 28,),
          ),
          ListTile(
            title: Text("Share With Friends",style: TextStyle(fontSize: 18),),
            leading: Icon(Icons.share,size: 28,),
          ),
          ListTile(
            title: Text("Rate Up",style: TextStyle(fontSize: 18),),
            leading: Icon(Icons.star,size: 28,),
          ),
          ListTile(
            title: Text("FeedBack",style: TextStyle(fontSize: 18),),
            leading: Icon(Icons.feedback,size: 26,),
          ),
          ListTile(
            title: Text("Privacy Policy",style: TextStyle(fontSize: 18),),
            leading: Icon(Icons.privacy_tip,size: 28,),
          ),
          Divider(thickness: 2 ,indent: 50, endIndent: 50,),
          Text("Version 1.0.0",style: TextStyle(fontWeight: FontWeight.bold),)
        ],
      ),
    );
  }
}

