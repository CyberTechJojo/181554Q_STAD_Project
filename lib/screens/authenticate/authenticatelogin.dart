import 'package:flutter/material.dart';
import 'package:stad_project/screens/authenticate/sign_in.dart';

class AuthenticateLogin extends StatefulWidget {
  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<AuthenticateLogin> {

  @override
  Widget build(BuildContext context) {
    return SignIn();
  }
}