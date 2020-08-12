import 'package:flutter/material.dart';
import 'package:stad_project/screens/authenticate/register.dart';
import 'package:stad_project/services/auth.dart';
import 'package:stad_project/shared/loading.dart';

class SignIn extends StatefulWidget {

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  

  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  bool loading = false;

  // Text Field state
  String email = '';
  String password = '';
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
      body: SingleChildScrollView(
        child: Container(
          height: 605,
           decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("images/blur.jpeg"), fit: BoxFit.cover)),
          child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              SizedBox(height: 10.0,),
               Container(
            margin: const EdgeInsets.fromLTRB(0, 60, 0, 20),
            child: Align(
              alignment: Alignment.topCenter,
              child: Text(
                'Login',
                style: TextStyle(
                    fontSize: 38,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    ),
              ),
            ),
            ),
            Container(
              width: 270,
                  height: 70,
            child: TextFormField(
              style: TextStyle(color: Colors.black),
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
                      border: new OutlineInputBorder(
                      ),
                  ),
                  
                validator: (val) => val.isEmpty ? 'Enter an email' : null,
                onChanged: (val) {
                  setState(() => email = val);
                },
              ),
            ),

              SizedBox(height: 20.0,),
              Container(
                width: 270,
                  height: 70,
            child: TextFormField(
              style: TextStyle(color: Colors.black),
                decoration: InputDecoration(
                  fillColor: Colors.white, filled: true,
                   labelText: 'Password',
                    hintText: "Enter your password.",
                    hintStyle: TextStyle(
                      fontWeight: FontWeight.w300,
                      color: Colors.black),
                     
                      border: new OutlineInputBorder(),
                      ),
                obscureText: true,
                validator: (val) => val.length < 6 ? 'Enter a password 6+ chars long' : null,
                onChanged: (val) {
                  setState(() => password = val);
                },
              ),
              ),

        
          
              SizedBox(height: 40.0,),

         

            Container(
             margin: const EdgeInsets.fromLTRB(0, 0, 0, 20),
              width: 250,
              height: 40,
              child: RaisedButton(
                 shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                    
                  ),
                color: Colors.red,
                child: Text(
                  'Login',
                  style: TextStyle(color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold,),
                ),
                onPressed: () async {
                  if(_formKey.currentState.validate()){
                    dynamic result = await _auth.signInWithEmailAndPassword(email, password);
                    setState(() => loading = true);
                    if(result == null) {
                      setState(() {
                        error = 'Could not sign in with those credentials';
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
                margin: const EdgeInsets.fromLTRB(0, 130, 0, 0),
                child: GestureDetector(
                onTap: () {
                       Navigator.pushReplacement(
                         context, 
                       MaterialPageRoute(builder:(context)=>Register()),
                       );
                      },
                      child: Text(
                        'Create Account',
                         style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                      ),
              ),
              ),
                

                 
            ],
          ),
        ),
        ), 
      ),
    );
  }
}