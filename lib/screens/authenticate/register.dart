import 'package:flutter/material.dart';
import 'package:stad_project/screens/authenticate/sign_in.dart';
import 'package:stad_project/services/auth.dart';
import 'package:stad_project/shared/loading.dart';

class Register extends StatefulWidget {

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  bool loading = false;

  String name = '';
   String email = '';
  String password = '';
  String contact = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    return loading ? Loading() : Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
            centerTitle: true,
          title: Row(
          children: <Widget>[
             Text(
          'LetsFitness', style: TextStyle(
            fontSize: 30.0,
            fontStyle: FontStyle.italic,
          ),
          ), 
          IconButton(icon: Icon(Icons.pool), onPressed: (){}
          ),
          ],
        ), 
      ),
      body: Container(
        height: 603,
           decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("images/blurgrouprunning2.png"), fit: BoxFit.cover)),
          child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                Container(
                  margin: const EdgeInsets.fromLTRB(0, 20, 0, 0),
              child: Align(
                alignment: Alignment.topCenter,
                child: Text(
                  'Create Account',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                      fontSize: 30,
                      color: Colors.black),
                ),
              ),
              ),
              SizedBox(height: 20.0,),
                Container(
                  width: 270,
                  height: 70,
                      child: TextFormField(
                    decoration: InputDecoration(
                       fillColor: Colors.white, filled: true,
                        labelText: ('Name'),
                        labelStyle: TextStyle(
                          fontWeight: FontWeight.w300
                        ),
                        hintText: "Enter your name.",
                        hintStyle: TextStyle(
                          fontWeight: FontWeight.w300,
                          color: Colors.black),

                          contentPadding: const EdgeInsets.all(20),
                          border: new OutlineInputBorder(
                          ),
                      ),
                    validator: (val) => val.isEmpty ? 'Enter your name' : null,
                    onChanged: (val) {
                      setState(() => name = val);
                    },
                  ),
                ),


               SizedBox(height: 10.0,),
                Container(
                  width: 270,
                  height: 70,
                    child: TextFormField(
                    decoration: InputDecoration(
                       fillColor: Colors.white, filled: true,
                        labelText: ('Email'),
                        labelStyle: TextStyle(
                          fontWeight: FontWeight.w300
                        ),
                        hintText: "Enter your email.",
                        hintStyle: TextStyle(
                          fontWeight: FontWeight.w300,
                          color: Colors.black),

                          contentPadding: const EdgeInsets.all(20),
                          border: new OutlineInputBorder(
                          ),
                      ),
                    validator: (val) => val.isEmpty ? 'Enter an email' : null,
                    onChanged: (val) {
                      setState(() => email = val);
                    },
                  ),
                ),
                SizedBox(height: 10.0,),
                Container(
                  width: 270,
                  height: 70,
                    child: TextFormField(
                    decoration: InputDecoration(
                       fillColor: Colors.white, filled: true,
                       labelText: 'Password',
                        hintText: "Enter your password.",
                        hintStyle: TextStyle(
                          fontWeight: FontWeight.w300,
                          color: Colors.black),
                          contentPadding: const EdgeInsets.all(20),
                          border: new OutlineInputBorder(),
                          ),
                    obscureText: true,
                     validator: (val) => val.length < 6 ? 'Enter a password 6+ chars long' : null,
                    onChanged: (val) {
                      setState(() => password = val);
                    },
                  ),
                ),

                SizedBox(height: 10.0,),
                Container(
                  width: 270,
                  height: 70,
                    child: TextFormField(
                    decoration: InputDecoration(
                       fillColor: Colors.white, filled: true,
                        labelText: ('Contact'),
                        labelStyle: TextStyle(
                        ),
                        hintText: "Enter your contact.",
                        hintStyle: TextStyle(
                          fontWeight: FontWeight.w300,
                          color: Colors.black),

                          contentPadding: const EdgeInsets.all(20),
                          border: new OutlineInputBorder(
                          ),
                      ),
                    validator: (val) => val.length < 8 || val.length > 8 ? 'Enter your contact' : null,
                    onChanged: (val) {
                      setState(() => contact = val);
                    },
                  ),
                ),

                SizedBox(height: 10.0,),
                 Container(
                   width: 250,
                  height: 40,
               margin: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                child: RaisedButton(
                   shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  color: Colors.red,
                  child: Text(
                    'Register',
                    style: TextStyle(color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold,),
                  ),
                  onPressed: () async {
                    if(_formKey.currentState.validate()){
                      setState(() => loading = true);
                      dynamic result = await _auth.registerWithEmailAndPassword(email, password, name, contact);
                      if(result == null) {
                        setState(() {
                           error = 'Please provide a valid email';
                           loading = false;
                        });
                      }
                    }
                  },
                ),
             ),
             SizedBox(height: 12.0,),
                Text(
                  error,
                  style: TextStyle(color: Colors.red, fontSize:  16.0, fontWeight: FontWeight.bold,),
                ),

                 Container(
                   margin: const EdgeInsets.fromLTRB(0, 30, 0, 0),
                    child: GestureDetector(
                    onTap: () {
                            Navigator.pushReplacement(
                             context, 
                           MaterialPageRoute(builder:(context)=>SignIn()),
                           );
                          },
                          child: Text(
                            'Login',
                             style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                          ),
                ),
                 ),
              ],
            ),
          )
        ),
      ),
    );
  }
}