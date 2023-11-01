// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, use_build_context_synchronously

import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart';
import 'package:intl/intl.dart';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  
  
 
  getData() {
    //  عمل متغير ووضع قيمته في وقت لاحق
   late bool isdaytime ;
    Timer(Duration(seconds: 0), () async {
      Response response = await get(
          Uri.parse('http://worldtimeapi.org/api/timezone/Africa/Cairo'));
      // تخزين الجيسون بداخل متغير عام عبارة عن ماب
      Map receivedData = jsonDecode(response.body);
      //  تحويل الداتا من استرينج لوقت
      DateTime datetime = DateTime.parse(receivedData["utc_datetime"]);
      //  تحويل الداتا من استرينج الي رقم وتحديد الكراكتر من الي واول كاركتر من 1 واخر كاركتر 3
      int offset = int.parse(receivedData["utc_offset"].substring(0, 3));
      //  اضافة الرقم المحول علي الوقت المحول
      DateTime realimee = datetime.add(Duration(hours: offset));
      //  لتحقيق شرطين لتغير الخلفية
      if (realimee.hour > 5 && realimee.hour < 18) {
        isdaytime = true;
      } else {
        isdaytime = false;
      }

      // تحديد شكل ظهور الوقت عن طريق بكاكيدج الوقت انتل وتخزينها داخل استرينج
      String timenow70 = DateFormat('hh :mm a').format(realimee);
      // تخزين التايم زون داخل متغير استرينج
      String timezone80 = receivedData["timezone"];
      // فتح الصفحة التاليه مع ارسال الداتا للصفحة التاليه
      Navigator.pushReplacementNamed(context, '/home', arguments: {
        "timenow55": timenow70,
        "timezone66": timezone80,
        "isdaytime":isdaytime,
      });
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //  لعمل شكل تحميل
            SpinKitDualRing(
              color: Colors.red,
              size: 100.0,
            ),
          ],
        ),
      ),
    );
  }
}
