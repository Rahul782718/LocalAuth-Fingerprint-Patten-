import 'package:fingerprint_auth/AuthService.dart';
import 'package:fingerprint_auth/HomePage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    authinit();
  }

  void  authinit() async {
    bool check = await AuthService().authenticateLocally();
    if(check){
      Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage(),));
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Auth Page"),
      ),
      body: Center(
        child: IconButton(onPressed: ()async {
          authinit();
        }, icon: Icon(Icons.fingerprint)),
      ),
    );
  }
}
