import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
        title: Text("Home Page "),
      ),
      
      body: Center(
        child: Text('Welcome To  Home Page ', style: TextStyle(color: Colors.black12,fontWeight: FontWeight.bold,fontSize: 18),),
      ),
    );
  }
}
