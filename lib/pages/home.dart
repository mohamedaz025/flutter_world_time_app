// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers

import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    // استقبال الداتا من الاسكرين السابقة ووضعها داخل متغير
    Map datafromloding = ModalRoute.of(context)!.settings.arguments as Map;
      String bgimg = datafromloding["isdaytime"]? "day.png" : "night.png";

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 55, 53, 63),
          image: DecorationImage(
              image: AssetImage("assets/$bgimg"), fit: BoxFit.cover),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton.icon(
                onPressed: () {},
                icon: Icon(
                  Icons.edit_location,
                  color: Color.fromARGB(255, 255, 129, 129),
                  size: 24.0,
                ),
                label: Text(
                  "Edit location",
                  style: TextStyle(fontSize: 19),
                ),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                      Color.fromARGB(146, 90, 103, 223)),
                  padding: MaterialStateProperty.all(EdgeInsets.all(22)),
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12))),
                ),
              ),
              SizedBox(
                height: 300,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 0, vertical: 25),
                color: Color.fromARGB(111, 0, 0, 0),
                width: double.infinity,
                child: Column(
                  children: [
                    Text(
                      //  استدعاء الداتا المستدعاة من صفحه الخري اذاكانت بداخل ماب
                      datafromloding["timenow55"],
                      style: TextStyle(fontSize: 35, color: Colors.white),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      //  استدعاء الداتا المستدعاة من صفحه الخري اذاكانت بداخل ماب
                      datafromloding["timezone66"],
                      style: TextStyle(fontSize: 35, color: Colors.white),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
