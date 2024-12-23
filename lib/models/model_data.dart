import 'package:flutter/material.dart';

class YagaModels {
  static String YogaTable1 = "BeginnerYoga";
  static String YogaTable2 = "WeightLossYoga";
  static String YogaTable3 = "StudentYoga";
  static String AllYoga = "AllYoga";
     //||AllYoga
  static String YogaWorkOutName = "YogaWorkOutName";
  static String BackImg = "BackImg";
  static String TimeTaken = "TimeTaken";
  static String TotleNoOfWork = "TotleNoOfWork";

  static String IDNAME = "ID";
  static String YAGANAME = "YagaName";
  static String SECONDORNOT = "secondsOrNot";
  static String SECONDOrTime = "SECONDOrTime";
  static String IMAGESNAME = "Imagesname";
  static List<String>? YogaTable1ColumName = [YagaModels.IDNAME,YagaModels.YAGANAME, YagaModels.SECONDORNOT , YagaModels.IMAGESNAME];
}

class Yoga {
  final int? id;
  final bool Seconds;
  final String YogaTitle;
  final String YogaImgUrl;
  final String SecondOrTime;

  const Yoga({
    required this.id,
      required this.Seconds,
      required this.YogaTitle,
      required this.YogaImgUrl,
      required this.SecondOrTime
      });


   Yoga copy({int? id, bool? Seconds, String? YogaTitle, String? YogaImgUrl, String? SecondOrTime}){
     return Yoga(
         id: id?? this.id,
         Seconds: Seconds?? this.Seconds,
         YogaTitle: YogaTitle?? this.YogaTitle,
         YogaImgUrl: YogaImgUrl?? this.YogaImgUrl,
         SecondOrTime: SecondOrTime?? this.SecondOrTime,
     );
   }

   static Yoga fromJson(Map<String , Object?> json){
     return Yoga(
         id: json[YagaModels.IDNAME] as int?,
         Seconds: json[YagaModels.SECONDORNOT] == 1,
         YogaTitle: json[YagaModels.IMAGESNAME] as String ,
         YogaImgUrl: json[YagaModels.YAGANAME] as String,
         SecondOrTime: json[YagaModels.SECONDOrTime] as String
     );
   }

   Map<String , Object?>toJson(){
     return{
       YagaModels.IDNAME: id,
       YagaModels.SECONDORNOT : Seconds?1:0,
       YagaModels.YAGANAME : YogaTitle,
       YagaModels.IMAGESNAME : YogaImgUrl,
       YagaModels.SECONDOrTime : SecondOrTime
     };
   }


}


class AllYoga {
  final int? id;
  final String YogaWorkOutName;
  final String BackImg;
  final String TimeTaken;
  final String TotleNoOfWork;


  const AllYoga({
    required this.id,
    required this.YogaWorkOutName,
    required this.BackImg,
    required this.TimeTaken,
    required this.TotleNoOfWork
  });


  AllYoga copy({int? id, String? YogaWorkOutName, String? BackImg, String? TimeTaken,String? TotleNoOfWork}){
    return AllYoga(
        id: id?? this.id,
        YogaWorkOutName: YogaWorkOutName?? this.YogaWorkOutName,
        BackImg: BackImg?? this.BackImg,
        TimeTaken: TimeTaken?? this.TimeTaken,
        TotleNoOfWork: TotleNoOfWork?? this.TotleNoOfWork
    );
  }

  static AllYoga fromJson(Map<String , Object?> json){
    return AllYoga(
        id: json[YagaModels.IDNAME] as int?,
        YogaWorkOutName: json[YagaModels.YogaWorkOutName] as String,
        BackImg: json[YagaModels.BackImg] as String ,
        TimeTaken: json[YagaModels.TimeTaken] as String,
        TotleNoOfWork: json[YagaModels.TotleNoOfWork] as String
    );
  }

  Map<String , Object?>toJson(){
    return{
      YagaModels.IDNAME: id,
      YagaModels.YogaWorkOutName : YogaWorkOutName,
      YagaModels.BackImg : BackImg,
      YagaModels.TimeTaken : TimeTaken,
      YagaModels.TotleNoOfWork : TotleNoOfWork
    };
  }


}
