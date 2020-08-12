import 'package:flutter/material.dart';
import 'package:stad_project/models/user.dart';
import 'package:stad_project/services/database.dart';
import 'package:provider/provider.dart';
import 'package:stad_project/shared/loading.dart';

class SettingsForm extends StatefulWidget {
  @override
  _SettingsFormState createState() => _SettingsFormState();
}

class _SettingsFormState extends State<SettingsForm> {

  final _formKey = GlobalKey<FormState>();

  String _currentName;
  String _currentContact;

  @override
  Widget build(BuildContext context) {

    final user = Provider.of<User>(context);

    return StreamBuilder<UserData>(
      stream: DatabaseService(uid: user.uid).userData,
      builder: (context, snapshot) {
        if(snapshot.hasData) {

          UserData userData = snapshot.data;

        return Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              Text(
                'Update your preferences.',
                style: TextStyle(fontSize: 18.0),
              ),
              SizedBox(height: 20.0,),
              TextFormField(
                initialValue: userData.name,
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
                        
                          
                          border: new OutlineInputBorder(
                          ),
                      ),
                      validator: (val) => val.isEmpty ? 'Please enter a name' : null,
                      onChanged: (val) => setState(() => _currentName = val,),
              ),
              SizedBox(height: 20.0,),
              TextFormField(
                initialValue: userData.contact,
                decoration: InputDecoration(
                      fillColor: Colors.white, filled: true,
                        labelText: ('Contact'),
                        labelStyle: TextStyle(
                          fontWeight: FontWeight.w300
                        ),
                        hintText: "Enter your Contact.",
                        hintStyle: TextStyle(
                          fontWeight: FontWeight.w300,
                          color: Colors.black),
                        
                          
                          border: new OutlineInputBorder(
                          ),
                      ),
                      validator: (val) => val.isEmpty ? 'Please enter a contact' : null,
                      onChanged: (val) => setState(() => _currentContact = val,),
              ),
              SizedBox(height: 20.0,),

             RaisedButton(
                     shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                        side: BorderSide(color: Colors.black),
                      ),
                    color: Colors.white,
                    child: Text(
                      'Update',
                      style: TextStyle(color: Colors.black, fontSize: 20),
                    ),
                    onPressed: () async {
                      if(_formKey.currentState.validate()) {
                        await DatabaseService(uid: user.uid).updateUserData(
                          _currentName ?? userData.name,
                          _currentContact ?? userData.contact, 
                        );
                        Navigator.pop(context);
                      }
                    },
                  ),
            ],
          )
        );

        } else {
          return Loading();

        }
        
      }
    );
  }
}