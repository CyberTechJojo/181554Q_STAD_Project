import 'package:flutter/material.dart';
import 'package:stad_project/screens/compute.dart';
import 'package:stad_project/screens/profile.dart';
import 'package:stad_project/screens/tracklocation.dart';
import 'package:url_launcher/url_launcher.dart' as UrlLauncher;

class NewsFeed extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Newsfeed App',
      theme: ThemeData(fontFamily: "Open Sans"),
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 4,
        child:  Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green,
          title: Text("Healthy Tips"),
          bottom: TabBar(
            tabs: <Widget>[
              Tab(child: IconButton(icon: Icon(Icons.home), onPressed:(){
                 Navigator.pop(context);
              })),
              Tab(child: IconButton(icon: Icon(Icons.person), onPressed: (){
                 Navigator.pushReplacement(
                         context, 
                       MaterialPageRoute(builder:(context)=>Profile()),
                       );
              })),
              Tab(child: IconButton(icon: Icon(Icons.directions_run), onPressed: (){
                 Navigator.pushReplacement(
                         context, 
                       MaterialPageRoute(builder:(context)=>Compute()),
                       );
              },)),
              Tab(child: IconButton(icon: Icon(Icons.location_on), onPressed: (){
                 Navigator.pushReplacement(
                         context, 
                       MaterialPageRoute(builder:(context)=>MyLocationApp()),
                       );
              })),
            ],
          ),
        ),
        body: ListView.builder(
          itemCount: 1,
          itemBuilder: (context,index) => CardItem(),
          ),
      ),
      ),
     
      
    );
  }
}

class CardItem extends StatelessWidget {
  const CardItem({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Card(
      child: Container(
        height: 350.0,
        child: Column(
          children: <Widget> [
            ListTile(
              leading: IconButton(icon: Icon(Icons.pool), onPressed: (){},),
              title: Text("LetsFitness"),
              subtitle: Text("Posted on 25 July 2020"),
            ),
            Container(
              child: Padding(
                padding: EdgeInsets.fromLTRB(0, 0, 225, 9),
                child: Text("How to start working out!", textAlign: TextAlign.left, style: TextStyle(fontSize: 15.0),),
              ) 
             
            ),
            Expanded(
                    child: GestureDetector(
                      onTap: () => UrlLauncher.launch('https://www.realsimple.com/health/fitness-exercise/workouts/how-to-start-working-out'),
                      child: Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage("https://previews.123rf.com/images/kittisaktaramas/kittisaktaramas1609/kittisaktaramas160900002/68990768-man-workout-fitness-aerobic-and-exercises-vector-illustration-.jpg"),
                        fit: BoxFit.cover,
                      ),
                  ),
                ),
                    ),
              ),

              
              SizedBox(height: 14.0,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget> [
                  Row(
                     children: <Widget>[
                  Icon(Icons.thumb_up, color: Colors.grey),
                  SizedBox(width: 8.0,),
                  Text("Like", style: TextStyle(color: Colors.grey),
                  ),
                    ],
                   ),

                    Row(
                     children: <Widget>[
                  Icon(Icons.comment, color: Colors.grey),
                  SizedBox(width: 8.0,),
                  Text("Comments", style: TextStyle(color: Colors.grey),
                  ),
                    ],
                   ),

                    Row(
                     children: <Widget>[
                  Icon(Icons.share, color: Colors.grey),
                  SizedBox(width: 8.0,),
                  Text("Share", style: TextStyle(color: Colors.grey),
                  ),
                    ],
                   ),

                ],
              ),
              SizedBox(height: 12.0,),
          ]
        )
      ),
    ),

     Card(
      child: Container(
        height: 350.0,
        child: Column(
          children: <Widget> [
            ListTile(
              leading: IconButton(icon: Icon(Icons.pool), onPressed: (){},),
              title: Text("LetsFitness"),
              subtitle: Text("Posted on 12 May 2020"),
            ),
            Container(
              child: Padding(
                padding: EdgeInsets.fromLTRB(0, 0, 140, 9),
                child: Text("How to build your own workout routine!", textAlign: TextAlign.left, style: TextStyle(fontSize: 15.0),),
              ) 
             
            ),
            Expanded(
                  child: GestureDetector(
                    onTap: () => UrlLauncher.launch('https://www.nerdfitness.com/blog/how-to-build-your-own-workout-routine/'),
                    child: Container(
                    decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage("https://content.active.com/Assets/Active.com+Content+Site+Digital+Assets/Fitness/580x350/Secrets+of+People+Who+Love+to+Work+Out/Secret+8.jpg"),
                            fit: BoxFit.cover,
                          )
                    ),
                ),
                      ),
              ),
              SizedBox(height: 14.0,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget> [
                  Row(
                     children: <Widget>[
                  Icon(Icons.thumb_up, color: Colors.grey),
                  SizedBox(width: 8.0,),
                  Text("Like", style: TextStyle(color: Colors.grey),
                  ),
                    ],
                   ),

                    Row(
                     children: <Widget>[
                  Icon(Icons.comment, color: Colors.grey),
                  SizedBox(width: 8.0,),
                  Text("Comments", style: TextStyle(color: Colors.grey),
                  ),
                    ],
                   ),

                    Row(
                     children: <Widget>[
                  Icon(Icons.share, color: Colors.grey),
                  SizedBox(width: 8.0,),
                  Text("Share", style: TextStyle(color: Colors.grey),
                  ),
                    ],
                   ),

                ],
              ),
              SizedBox(height: 12.0,),
          ]
        )
      ),
    ),

     Card(
      child: Container(
        height: 350.0,
        child: Column(
          children: <Widget> [
            ListTile(
              leading: IconButton(icon: Icon(Icons.pool), onPressed: (){},),
              title: Text("LetsFitness"),
              subtitle: Text("Posted on 10 May 2020"),
            ),
            Container(
              child: Padding(
                padding: EdgeInsets.fromLTRB(0, 0, 190, 9),
                child: Text("Top 10 High Fat Foods to avoid!", textAlign: TextAlign.left, style: TextStyle(fontSize: 15.0),),
              ) 
             
            ),
            Expanded(
              child: GestureDetector(
                onTap: () => UrlLauncher.launch('https://www.myfooddata.com/articles/high-fat-foods-to-avoid.php'),
                    child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage("https://www.thehealthsite.com/wp-content/uploads/2017/12/Diet-junk-THS-655x353-2.jpg"),
                      fit: BoxFit.cover,
                    )
                  ),
                ),
              )
              ),
              SizedBox(height: 14.0,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget> [
                  Row(
                     children: <Widget>[
                  Icon(Icons.thumb_up, color: Colors.grey),
                  SizedBox(width: 8.0,),
                  Text("Like", style: TextStyle(color: Colors.grey),
                  ),
                    ],
                   ),

                    Row(
                     children: <Widget>[
                  Icon(Icons.comment, color: Colors.grey),
                  SizedBox(width: 8.0,),
                  Text("Comments", style: TextStyle(color: Colors.grey),
                  ),
                    ],
                   ),

                    Row(
                     children: <Widget>[
                  Icon(Icons.share, color: Colors.grey),
                  SizedBox(width: 8.0,),
                  Text("Share", style: TextStyle(color: Colors.grey),
                  ),
                    ],
                   ),
                ],
              ),
              SizedBox(height: 12.0,),
          ]
        )
      ),
    ),

     Card(
      child: Container(
        height: 350.0,
        child: Column(
          children: <Widget> [
            ListTile(
              leading: IconButton(icon: Icon(Icons.pool), onPressed: (){},),
              title: Text("LetsFitness"),
              subtitle: Text("Posted on 28 April 2020"),
            ),
            Container(
              child: Padding(
                padding: EdgeInsets.fromLTRB(0, 0, 230, 9),
                child: Text("Considering going vegan?", textAlign: TextAlign.left, style: TextStyle(fontSize: 15.0),),
              ) 
             
            ),
            Expanded(
              child: GestureDetector(
                onTap: () => UrlLauncher.launch('https://www.healthshots.com/healthy-eating/nutrition/considering-going-vegan-here-are-5-health-benefits-you-must-know-before-joining-the-club/'),
                    child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage("https://dreenaburton.com/wp-content/uploads/2013/01/Teriyaki-Stir-Fry_2-e1511324313699-480x375.jpg"),
                      fit: BoxFit.cover,
                    )
                  ),
                ),
              )
              ),
              SizedBox(height: 14.0,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget> [
                  Row(
                     children: <Widget>[
                  Icon(Icons.thumb_up, color: Colors.grey),
                  SizedBox(width: 8.0,),
                  Text("Like", style: TextStyle(color: Colors.grey),
                  ),
                    ],
                   ),

                    Row(
                     children: <Widget>[
                  Icon(Icons.comment, color: Colors.grey),
                  SizedBox(width: 8.0,),
                  Text("Comments", style: TextStyle(color: Colors.grey),
                  ),
                    ],
                   ),

                    Row(
                     children: <Widget>[
                  Icon(Icons.share, color: Colors.grey),
                  SizedBox(width: 8.0,),
                  Text("Share", style: TextStyle(color: Colors.grey),
                  ),
                    ],
                   ),

                ],
              ),
              SizedBox(height: 12.0,),
          ]
        )
      ),
    ),

     Card(
      child: Container(
        height: 350.0,
        child: Column(
          children: <Widget> [
            ListTile(
              leading: IconButton(icon: Icon(Icons.pool), onPressed: (){},),
              title: Text("LetsFitness"),
              subtitle: Text("Posted on 10 March 2020"),
            ),
            Container(
              child: Padding(
                padding: EdgeInsets.fromLTRB(0, 0, 180, 9),
                child: Text("14 Best Gyms in Singapore 2020!", textAlign: TextAlign.left, style: TextStyle(fontSize: 15.0),),
              ) 
             
            ),
            Expanded(
              child: GestureDetector(
                onTap: () => UrlLauncher.launch('https://epochtimes.today/14-best-gyms-in-singapore-2020/'),
                  child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage("https://media.timeout.com/images/105305439/630/472/image.jpg"),
                      fit: BoxFit.cover,
                    )
                  ),
                ),
              )
              ),
              SizedBox(height: 14.0,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget> [
                  Row(
                     children: <Widget>[
                  Icon(Icons.thumb_up, color: Colors.grey),
                  SizedBox(width: 8.0,),
                  Text("Like", style: TextStyle(color: Colors.grey),
                  ),
                    ],
                   ),

                    Row(
                     children: <Widget>[
                  Icon(Icons.comment, color: Colors.grey),
                  SizedBox(width: 8.0,),
                  Text("Comments", style: TextStyle(color: Colors.grey),
                  ),
                    ],
                   ),

                    Row(
                     children: <Widget>[
                  Icon(Icons.share, color: Colors.grey),
                  SizedBox(width: 8.0,),
                  Text("Share", style: TextStyle(color: Colors.grey),
                  ),
                    ],
                   ),

                ],
              ),
              SizedBox(height: 12.0,),
          ]
        )
      ),
    ),

     Card(
      child: Container(
        height: 350.0,
        child: Column(
          children: <Widget> [
            ListTile(
              leading: IconButton(icon: Icon(Icons.pool), onPressed: (){},),
              title: Text("LetsFitness"),
              subtitle: Text("Posted on 25 February 2020"),
            ),
            Container(
              child: Padding(
                padding: EdgeInsets.fromLTRB(0, 0, 180, 9),
                child: Text("Here is how to change your diet!", textAlign: TextAlign.left, style: TextStyle(fontSize: 15.0),),
              ) 
             
            ),
            Expanded(
              child: GestureDetector(
                onTap: () => UrlLauncher.launch('https://happyness.life/how-to-gradually-change-your-diet/'),
                    child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage("https://static.toiimg.com/thumb/75786266.cms?width=680&height=512&imgsize=303729"),
                      fit: BoxFit.cover,
                    )
                  ),
                ),
              )
              ),
              SizedBox(height: 14.0,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget> [
                  Row(
                     children: <Widget>[
                  Icon(Icons.thumb_up, color: Colors.grey),
                  SizedBox(width: 8.0,),
                  Text("Like", style: TextStyle(color: Colors.grey),
                  ),
                    ],
                   ),

                    Row(
                     children: <Widget>[
                  Icon(Icons.comment, color: Colors.grey),
                  SizedBox(width: 8.0,),
                  Text("Comments", style: TextStyle(color: Colors.grey),
                  ),
                    ],
                   ),

                    Row(
                     children: <Widget>[
                  Icon(Icons.share, color: Colors.grey),
                  SizedBox(width: 8.0,),
                  Text("Share", style: TextStyle(color: Colors.grey),
                  ),
                    ],
                   ),

                ],
              ),
              SizedBox(height: 12.0,),
          ]
        )
      ),
    ),

        ],
      )
    );
    
  }
  
}