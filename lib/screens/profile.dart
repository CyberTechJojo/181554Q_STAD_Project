import 'package:flutter/material.dart';
import 'package:stad_project/models/user.dart';
import 'package:stad_project/screens/compute.dart';
import 'package:stad_project/screens/contactus.dart';
import 'package:stad_project/screens/home/settings_form.dart';
import 'package:stad_project/screens/newsfeed.dart';
import 'package:stad_project/screens/tracklocation.dart';
import 'package:stad_project/services/database.dart';
import 'package:provider/provider.dart';
import 'package:stad_project/shared/loading.dart';



class Profile extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    void _showSettingsPanel() {
      showModalBottomSheet(context: context, builder: (context) {
        return Container(
          padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 60.0),
          child: SettingsForm(),
        );
      });
    }

    final screenWidth = MediaQuery.of(context).size.width/3;

    final user = Provider.of<User>(context);

    return StreamBuilder<UserData>(
      stream: DatabaseService(uid: user.uid).userData,
      builder: (context, snapshot) {
        if(snapshot.hasData) {

          UserData userData = snapshot.data;

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
             decoration: BoxDecoration(
           image: DecorationImage(
            image: AssetImage('images/bluemanrunning.jpg'),
            fit: BoxFit.cover,
          ),
        ),
              child: Column(
              children: <Widget>[
                Container(
                  margin: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                  child:  Align(
                  alignment: Alignment.topCenter,
                  child:  Text(
                  'Profile',
                  style: TextStyle(fontSize: 33.0,),
                  textAlign: TextAlign.center,
                ),
                ),
                ),
               
               
               Container(
                 margin: const EdgeInsets.fromLTRB(10, 10, 10, 5),
                 child: Align(alignment: Alignment.center,
                 child: Text(userData.name, style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
                ),
                ), 
               ),

               Container(
                 margin: const EdgeInsets.fromLTRB(10, 5, 10, 0),
                 child: Align(alignment: Alignment.center,
                 child: Text('Contact', style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold, color: Colors.red),
                ),
                ), 
               ),
                
                
                Container(
                  margin: const EdgeInsets.fromLTRB(10, 5, 10, 10),
                  child: Align(alignment: Alignment.center,
                  child: Text(userData.contact, style: TextStyle(fontSize: 25.0),
                ),
              ), 
              ),

              Container(
                margin: const EdgeInsets.fromLTRB(130, 10, 10, 10),
                child: Row(
                        children: <Widget>[
                 Icon(Icons.settings),
              
               GestureDetector(
                  onTap: () =>_showSettingsPanel(),
                        child: Padding(
                          padding: EdgeInsets.all(10),
                          child: Text(
                          'Edit Profile',
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


               Expanded(
               child: Container(
                margin: const EdgeInsets.fromLTRB(60, 80, 60, 35),
                 decoration: BoxDecoration(
                   color: Colors.white,
                     border: Border.all(
                    color: Colors.black,
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(20))
               ),
               child: GridView.count(
                 primary: false,
                  padding: const EdgeInsets.all(10),
                  childAspectRatio: screenWidth/100,
                  crossAxisSpacing: 1,
                  mainAxisSpacing: 2,
                 crossAxisCount: 2,
                 children: <Widget>[

                   Container(
                     padding: const EdgeInsets.all(2),
                      child: Column(
                        children: <Widget>[
                          Text('Home', textAlign: TextAlign.center, style: TextStyle(fontSize:16),
                          ),
                          IconButton(icon: Icon(Icons.home), iconSize: 40, onPressed: () {
                            Navigator.pop(context);
                          })
                        ],
                      ),

                   ),
                  
                    Container(
                      padding: const EdgeInsets.all(2),
                       child: Column(
                        children: <Widget>[
                          Text('Helpful Tips', textAlign: TextAlign.center, style: TextStyle(fontSize: 16),
                          ),
                          IconButton(icon: Icon(Icons.phone_android), iconSize: 40, onPressed: (){
                             Navigator.pushReplacement(
                           context, 
                         MaterialPageRoute(builder:(context)=>NewsFeed()),
                         );
                          })
                        ],
                      ),
                    ),

                    Container(
                      padding: const EdgeInsets.all(2),
                       child: Column(
                        children: <Widget>[
                          Text('Compute BMI', textAlign: TextAlign.center, style: TextStyle(fontSize: 16),
                          ),
                          IconButton(icon: Icon(Icons.directions_run), iconSize: 40, onPressed: (){
                             Navigator.pushReplacement(
                           context, 
                         MaterialPageRoute(builder:(context)=>Compute()),
                         );
                          })
                        ],
                      ),
                    ),

                    Container(
                      padding: const EdgeInsets.all(2),
                       child: Column(
                        children: <Widget>[
                          Text('Pinpoint Location', textAlign: TextAlign.center, style: TextStyle(fontSize: 16),
                          ),
                          IconButton(icon: Icon(Icons.location_on), iconSize: 40, onPressed: (){
                             Navigator.pushReplacement(
                           context, 
                         MaterialPageRoute(builder:(context)=>MyLocationApp()),
                         );
                          })
                        ],
                      ),
                    ),
                  ],
               ),

               ),
             ),

             Container(
               margin: const EdgeInsets.fromLTRB(0, 0, 0, 15),
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
          )
        );

        } else {
          return Loading();

        }
        
      }
    );
  }
}