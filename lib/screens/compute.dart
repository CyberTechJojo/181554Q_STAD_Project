import 'package:flutter/material.dart';
import 'package:stad_project/screens/contactus.dart';
import 'package:stad_project/screens/newsfeed.dart';
import 'package:stad_project/screens/profile.dart';
import 'package:stad_project/screens/tracklocation.dart';


dynamic myWeight = TextEditingController();
dynamic myHeight = TextEditingController();
 
dynamic userWeight = double.parse(myWeight.text);
dynamic userHeight = double.parse(myHeight.text);

class MyData {
   dynamic bmiweight;
   dynamic bmiheight;
  MyData(this.bmiweight, this.bmiheight);
}

void main() => runApp(Compute());
    
class Compute extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width/3;

    return Scaffold(
      appBar:  AppBar(
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
          child: Column(
            children: <Widget>[
              Container(
                  margin: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                  child:  Align(
                  alignment: Alignment.topCenter,
                  child:  Text(
                  'BMI Calculator',
                  style: TextStyle(fontSize: 24.0,),
                  textAlign: TextAlign.center,
                ),
                ),
                ),

                Container(
              margin: const EdgeInsets.fromLTRB(10, 5, 10, 5),
              child: Text('If your BMI exceeds 23 and above, it indicates that your weight is outside the healthy range for your height',
              textAlign: TextAlign.center, style: TextStyle(fontSize: 18.0),),
            ),

            Container(
              margin: const EdgeInsets.fromLTRB(10, 5, 10, 0),
              child: Text('What is your Weight?', textAlign: TextAlign.center, style: TextStyle(fontSize: 20.0),)
            ),

            Container(
              margin: const EdgeInsets.fromLTRB(106, 0, 0, 0),
              child: Row(children: <Widget>[
                  SizedBox(
            height: 35,
            width: 200,
              child: TextFormField(
                          controller: myWeight,
                          keyboardType: TextInputType.number,
                          validator: (input) {
                  final isDigitsOnly = int.tryParse(input);
                  return isDigitsOnly == null
                      ? 'Input needs to be digits only'
                      : null;
                },
                          decoration: InputDecoration(
                        contentPadding: const EdgeInsets.all(8.0),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: BorderSide(color: Colors.black),
                            ),
                          ),
                        ),     
            ),
            Padding(padding: EdgeInsets.fromLTRB(8, 0, 0, 0),
            child: Text(
              'kg', style: TextStyle(fontSize: 20.0),
                ),
            ),
              ],
              ),
            ),

          

            Container(
              margin: const EdgeInsets.fromLTRB(10, 15, 10, 0),
              child: Text('What is your Height?', textAlign: TextAlign.center, style: TextStyle(fontSize: 20.0),)
            ),

            Container(
              margin: const EdgeInsets.fromLTRB(106, 0, 0, 0),
              child: Row(children: <Widget>[
                SizedBox(
              height: 35,
            width: 200,
              child: TextFormField(
                          controller: myHeight,
                          keyboardType: TextInputType.number,
                          validator: (input) {
                  final isDigitsOnly = int.tryParse(input);
                  return isDigitsOnly == null
                      ? 'Input needs to be digits only'
                      : null;
                },
                          decoration: InputDecoration(
                        contentPadding: const EdgeInsets.all(8.0),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: BorderSide(color: Colors.black),
                            ),
                          ),
                        ),     
            ),

             Padding(padding: EdgeInsets.fromLTRB(8, 0, 0, 0),
            child: Text(
              'cm', style: TextStyle(fontSize: 20.0),
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
                      side: BorderSide(color: Colors.black),
                    ),
                  color: Colors.white,
                  child: Text(
                    'Calculate',
                    style: TextStyle(color: Colors.black, fontSize: 25),
                  ),
                  onPressed: ()  {
                    MyData data = new MyData(userWeight, userHeight);
                     Navigator.pushReplacement(
                context, 
                MaterialPageRoute(builder:(context)=>BMIresult(data: data,)
                ),
              );
                  },
                ),
              ),

                 Expanded(
               child: Container(
                margin: const EdgeInsets.fromLTRB(60, 20, 60, 15),
                 decoration: BoxDecoration(
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
                          Text('Profile', textAlign: TextAlign.center, style: TextStyle(fontSize: 16),
                          ),
                          IconButton(icon: Icon(Icons.person), iconSize: 40, onPressed: () {
                            Navigator.pushReplacement(
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
                          Text('Home', textAlign: TextAlign.center, style: TextStyle(fontSize: 16),
                          ),
                          IconButton(icon: Icon(Icons.home), iconSize: 40, onPressed: (){
                            Navigator.pop(context);
                          }),
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
      ),
    );
  }
}



class BMIresult extends StatelessWidget {
  final MyData data;

  BMIresult({Key key, @required this.data}) : super(key:key);


  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width/3;

    print(data.bmiweight);
    print(data.bmiheight);

    double height = data.bmiheight / 100;
    double weight = data.bmiweight;

    double calculate =  weight / (height * height);
    String bmi = calculate.toStringAsFixed(1);

    String risktext = '';

    if(calculate < 18.5)
    {
      risktext = 'You are under weight.';
    }
    else if((calculate >= 18.5 ) && (calculate <24.9))
    {
      risktext = 'You are healthy.';
    }
    else if(calculate > 25)
    {
     risktext = 'You are overweight.';
    }

    return Scaffold(
      appBar:  AppBar(
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
              child: new Column(
            children: <Widget>[
              Container(
                  margin: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                  child:  Align(
                  alignment: Alignment.topCenter,
                  child:  Text(
                  'BMI Calculator',
                  style: TextStyle(fontSize: 24.0,),
                  textAlign: TextAlign.center,
                ),
                ),
                ),

                Container(
              margin: const EdgeInsets.fromLTRB(10, 5, 10, 5),
              child: Text('If your BMI exceeds 23 and above, it indicates that your weight is outside the healthy range for your height',
              textAlign: TextAlign.center, style: TextStyle(fontSize: 18.0),),
            ),

            
            Container(
              margin: const EdgeInsets.fromLTRB(10, 25, 10, 5),
              child: Align(
                alignment: Alignment.center,
                child: Text(risktext, style: TextStyle(fontSize: 25),
                ),
              ),
            ),

            Container(
              margin: const EdgeInsets.fromLTRB(10, 5, 10, 5),
              child: Text('BMI: ' + bmi, style: TextStyle(fontSize: 24),),

            ),

            Container(
                   margin: const EdgeInsets.fromLTRB(0, 30, 0, 35),
                    child: RaisedButton(
                       shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Text('Home', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 23),
                    ),
                  color: Colors.red,
                      onPressed: (){
                        Navigator.pop(context);
                      }),
                 ),


                 Expanded(
               child: Container(
                margin: const EdgeInsets.fromLTRB(60, 20, 60, 15),
                 decoration: BoxDecoration(
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
                          Text('Profile', textAlign: TextAlign.center, style: TextStyle(fontSize: 16),
                          ),
                          IconButton(icon: Icon(Icons.person), iconSize: 40, onPressed: () {
                            Navigator.pushReplacement(
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
                          Text('Home', textAlign: TextAlign.center, style: TextStyle(fontSize: 16),
                          ),
                          IconButton(icon: Icon(Icons.home), iconSize: 40, onPressed: (){
                            Navigator.pop(context);
                          }),
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
  }
}