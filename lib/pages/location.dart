// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class Location extends StatefulWidget {
  const Location({super.key});

  @override
  State<Location> createState() => _LocationState();
}

class _LocationState extends State<Location> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 191, 191, 199),
      appBar: AppBar(
        title: Text("Choose Location"),
        backgroundColor: Colors.grey,
      ),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                child: ListTile(
                  onTap: () {},
                  title: Text(
                    "egypt - cairo",
                    style: TextStyle(fontSize: 35, color: Colors.black),
                  ),
                  leading: CircleAvatar(
                    backgroundImage: AssetImage("assets/egypt.png"),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
