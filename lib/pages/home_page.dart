import 'package:eight_hrs/widgets/drawer.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Catalog App", style: TextStyle(color: Colors.black),),
      ),
      body: Center(
        child: Container(
          child: Text("Welcome to 30 days of flutter"),

        ),
      ),
      drawer: MyDrawer(),
    );
  }
}
