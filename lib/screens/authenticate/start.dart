import 'package:flutter/material.dart';
import 'package:stad_project/screens/authenticate/authenticatelogin.dart';
import 'package:stad_project/screens/authenticate/authenticateregister.dart';
import 'package:stad_project/screens/contactus.dart';

class StartWidget extends StatefulWidget {
  @override
  _StartWidgetState createState() => _StartWidgetState();
}


class _StartWidgetState extends State<StartWidget> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
      body: Container(
         decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("images/startbackground.png"), fit: BoxFit.cover)),
      child: Column(
        children: <Widget>[
          Container(
            margin: const EdgeInsets.fromLTRB(20, 120, 20, 10),
            child: Align(
              alignment: Alignment.topCenter,
              child: Text(
                'LetFitness',
                style: TextStyle(
                  fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.bold,
                    fontSize: 52,
                    color: Colors.black),
              ),
            ),
            ),
         Container(
           margin: const EdgeInsets.fromLTRB(20, 20, 20, 5),
           child: Align(
              alignment: Alignment.topCenter,
              child: Text(
                'Lets Get Started!',
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.black),
              ),
            ),
         ),

         Container(
            margin: const EdgeInsets.fromLTRB(20, 20, 20, 10),
            child:  Align(
              alignment: Alignment.bottomCenter,
              child: SizedBox(
                width: 280.0,
                height: 45.0,
                child: RaisedButton(
                  onPressed: (){
                     Navigator.pushReplacement(
                         context, 
                       MaterialPageRoute(builder:(context)=>AuthenticateLogin()),
                       );
                  },
                  textColor: Colors.white,
                  color: Colors.red,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                  disabledColor: Colors.grey,
                  disabledTextColor: Colors.white,
                  elevation: 5.0,
                  child: Text('Login', 
                  style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                                  ),
                  ),
                ),
              ),
            ),
         ),

          Container(
            margin: const EdgeInsets.fromLTRB(20, 20, 20, 10),
            child:  Align(
              alignment: Alignment.bottomCenter,
              child: SizedBox(
                width: 280.0,
                height: 45.0,
                child: RaisedButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                         context, 
                       MaterialPageRoute(builder:(context)=>AuthenticateRegister()),
                       ); 
                  },
                  textColor: Colors.white,
                  color: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                  disabledColor: Colors.grey,
                  disabledTextColor: Colors.white,
                  elevation: 5.0,
                  child: Text('Register',
                  style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                                  ),
                  ),
                ),
              ),
            ),
         ),

           Container(
           margin: const EdgeInsets.fromLTRB(20, 260, 20, 10),
             child: GestureDetector(
               onTap: (){
                 Navigator.push(context, MaterialPageRoute(builder: (context)=>ContactUs()));
               },
                            child: Text('Contact Us', style: TextStyle(fontSize: 20),
               ),
             ),
            
         ),


        ],
      ),

    ),
     );
  }
}

