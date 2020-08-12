import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stad_project/screens/authenticate/start.dart';
import 'package:stad_project/screens/home/home.dart';
import 'package:stad_project/models/user.dart';

class Entry extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final user = Provider.of<User>(context);
   
   //return either home or authenticate
   if(user == null) {
     return StartWidget();
     
     //return StartWidget();
   }
   else {
     return Home();

   }

   
  }
}