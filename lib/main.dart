import 'package:flutter/material.dart';
import 'package:stad_project/screens/entry.dart';
import 'package:provider/provider.dart';
import 'package:stad_project/services/auth.dart';
import 'package:stad_project/models/user.dart';

void main() {
 runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
 
     return StreamProvider<User>.value(
      value: AuthService().user,
          child: MaterialApp(
          home: Entry(),
      ),
    );
    
    
  }
}