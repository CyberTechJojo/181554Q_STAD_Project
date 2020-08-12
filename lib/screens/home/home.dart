import 'package:flutter/material.dart';
import 'package:stad_project/screens/compute.dart';
import 'package:stad_project/screens/contactus.dart';
import 'package:stad_project/screens/newsfeed.dart';
import 'package:stad_project/screens/profile.dart';
import 'package:stad_project/screens/tracklocation.dart';
import 'package:stad_project/services/database.dart';
import 'package:provider/provider.dart';
import 'package:stad_project/services/auth.dart';
import 'package:stad_project/models/user.dart';
import 'package:stad_project/shared/loading.dart';


class Home extends StatelessWidget {

final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
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

          Container(
            margin: const EdgeInsets.fromLTRB(100, 0, 0, 0),
              child: Row(
                      children: <Widget>[
               Icon(Icons.exit_to_app),
            
             GestureDetector(
                onTap: () async {
                  await _auth.signOut();
                }, child: Text(
                        'Logout',
                         style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                      ),
                    ),
                  ],
               ),
            ),

          ],
        ), 
       
        
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(10),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text('Welcome ${userData.name}!',
                style: TextStyle(fontSize: 18.0,
                ),
                ),
              ),
            ),

          Container(
            child: Align(
                alignment: Alignment.topCenter,
                child: Text('Start locating sport facilities near you!',
                style: TextStyle(fontSize: 18.0,
                ),
                ),
              ),
          ),

          InkWell(
            onTap: (){
               Navigator.push(
                         context, 
                       MaterialPageRoute(builder:(context)=>MyLocationApp()),
                       );
            },
            child: Container(
              height: 140,
                  width: 620,
                  child: Image.asset('images/map.jpg', fit: BoxFit.cover,),
                 
            ),
          ),

          Container(
            margin: const EdgeInsets.fromLTRB(10, 3, 10, 3),
            child: Text('Description', textAlign: TextAlign.center,
            style: TextStyle(fontSize: 20.0),
            ),
          ),

          Container(
            margin: const EdgeInsets.fromLTRB(60, 5, 60, 5),
            child: Text('Here at LetsFitness, we provide the best services in our application to help YOU in your workout routine. Please do enjoy the features!',
            textAlign: TextAlign.center, style: TextStyle(fontSize: 16.0,),),
          ),

           Expanded(
             child: Container(
              margin: const EdgeInsets.fromLTRB(60, 20, 60, 35),
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
                   padding: const EdgeInsets.fromLTRB(2, 4, 2, 2),
                    child: Column(
                      children: <Widget>[
                        Text('Profile', textAlign: TextAlign.center, style: TextStyle(fontSize: 16),
                        ),
                        IconButton(icon: Icon(Icons.person), iconSize: 40, onPressed: () {
                          Navigator.push(
                         context, 
                       MaterialPageRoute(builder:(context)=>Profile()),
                       );
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
                           Navigator.push(
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
                          Navigator.push(
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
                        IconButton(icon: Icon(Icons.location_on), iconSize: 40, onPressed:(){
                          Navigator.push(
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
             margin: const EdgeInsets.fromLTRB(0, 0, 0, 20),
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

        } else {
           return Loading();

        }
        
      }
    );
  }
}