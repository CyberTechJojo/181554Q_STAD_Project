import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart' as UrlLauncher;

void main() {
  runApp(ContactUs());
}

class ContactUs extends StatefulWidget {
  @override
  _ContactUsState createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUs> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        width: 600,
         decoration: BoxDecoration(
           image: DecorationImage(
            image: AssetImage('images/blurgrouprunning2.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: <Widget>[

            Container(
              margin: const EdgeInsets.fromLTRB(0, 30, 95, 0),
              width: 300,
              height: 140,
              decoration: BoxDecoration(
                 color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(20))
             ),
              child: Column(
                children: <Widget>[
                  Container(
                    width: 300,
                    color: Colors.red,       
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(70, 0, 0, 0),
                       child: Text(
                      'Contact Us', style: TextStyle(color: Colors.white, fontSize: 30),
                    ),
                      ),
                  ),

                  Row(
                    children: <Widget>[

                      Container(
                        margin: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                          child: Text(
                          'Email: ', style: TextStyle(fontSize: 16,),
                        ),
                      ),

                      Container(
                        width: 220,
                    child: FlatButton(
                    onPressed: () => UrlLauncher.launch('mailto:LetsFitness@gmail.com'),
                    child: new Text("LetsFitness@gmail.com", style: TextStyle(fontSize: 16,),)
                    ),
                      ),
                    ],
                  ),   
                    
                    Row(
                      children: <Widget>[
                           Container(
                        margin: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                          child: Text(
                          'Contact: ', style: TextStyle(fontSize: 16,),
                        ),
                      ),
                           FlatButton(
                          onPressed: () => UrlLauncher.launch('tel:+65 83683487'),
                          child: new Text("+65 83683487", style: TextStyle(fontSize: 16,)
                          ),
                          ),
                      ],
                    ),
                ],
              ),
            ),

             Container(
              margin: const EdgeInsets.fromLTRB(80, 60, 0, 0),
              width: 300,
              height: 240,
              decoration: BoxDecoration(
                 color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(20))
             ),
              child: Column(
                children: <Widget>[
                  Container(
                    width: 300,
                    color: Colors.red,       
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(40, 8, 0, 8),
                       child: Text(
                      'About Lets Fitness', style: TextStyle(color: Colors.white, fontSize: 25),
                    ),
                      ),
                  ),

                   Container(
                     child: Padding(
                       padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                  child: Text('LetsFitness is an easy-to-use and multi-purpose app that helps users with tracking fitness facilities nearby them. Also, they can have access to different features such as a BMI calculator and a newsfeed page based on fitness.'
                       , style: TextStyle(fontSize: 18,),),
                     ),
                     ),

              
                ],
              ),
            ),

            
        
              Container(
               margin: const EdgeInsets.fromLTRB(0, 20, 0, 10),
                child: RaisedButton(
                   shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  color: Colors.red,
                  child: Text(
                    'Back',
                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  onPressed: ()  {
                     Navigator.pop(context);
                  },
                ),
              ),
          ],
        )
      )
    );
  }
}