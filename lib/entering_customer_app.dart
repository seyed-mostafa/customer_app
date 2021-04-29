
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'main_panel_customer_app.dart';
import 'Rigestering.dart';

class Entering extends StatefulWidget {
  @override
  _EnteringState createState() => _EnteringState();
}

class _EnteringState extends State<Entering> {

  String password = "123";
  String phoneNumber = "456";
  String inputPhoneNumberEnter = '', inputPasswordEnter = '';
  String errorMessage = "Phone number Or Password is wrong";
  bool validUser = false;
  bool flag = true;


  final _formKey = GlobalKey<FormState>();

  String inputPhoneNumber = '', inputPassword = '',
      inputName = '', inputAddress = '';
  bool hidden = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(child: Text("Entering page")),
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(50),
            child: Column(
              children: [
                validUser||flag ?
                Container():
                Container(
                  child: Text(errorMessage,
                    style: TextStyle(color: Colors.white,
                        backgroundColor: Colors.red),),
                ),
                SizedBox(height: 20,),
                TextField(
                  onChanged: (String value){
                    inputPhoneNumberEnter = value;
                  },
                  decoration: InputDecoration(
                      icon: Icon(Icons.phone),
                      labelText: "phone number",
                      labelStyle: TextStyle(fontSize: 18,)
                  ),
                ),
                TextField(
                  onChanged: (String value){
                    inputPasswordEnter = value;
                  },
                  decoration: InputDecoration(
                      icon: Icon(Icons.vpn_key_sharp),
                      labelText: "password",
                      labelStyle: TextStyle(fontSize: 18,)
                  ),
                ),
                SizedBox(height: 20,),
                ElevatedButton(
                  onPressed: (){
                    flag = false;
                    print(inputPhoneNumberEnter);
                    print(inputPasswordEnter);
                    if(inputPhoneNumberEnter == phoneNumber && inputPasswordEnter == password){
                      validUser=true;
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => MainPanel()),
                      );
                    }else{
                      validUser=false;
                    }
                    setState(() {});
                  },
                  child: Text("Sign in"),
                ),
                SizedBox(height: 20,),
                ElevatedButton(
                    onPressed: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Rigestring()),
                      );
                    },
                    child: Text("Sign up")
                ),
              ],
            ),
          ),
        )
    );
  }
}