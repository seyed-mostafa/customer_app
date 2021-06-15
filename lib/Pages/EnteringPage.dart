
import 'dart:io';
import 'package:customer_app/Pages/Nav.dart';
import 'package:customer_app/appBar.dart';
import 'package:flutter/material.dart';
import 'package:customer_app/Objects/theme.dart';
import 'RegisteringPage.dart';

class EnteringPage extends StatefulWidget {


  @override
  _EnteringPageState createState() => _EnteringPageState();
}

class _EnteringPageState extends State<EnteringPage> {

  //fake Dates
  String password = "123";
  String phoneNumber = "456";

  //input Variable
  String inputPhoneNumberEnter = '', inputPasswordEnter = '';

  String errorMessage = "Phone number Or Password is wrong";
  bool validUser = false;

  //for first time don't show error of input (red container in top)
  bool flag = true;

  String messageServer = "";

  //for hide entering password
  bool hidden = true;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: appBar(),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          color: theme.yellow,
          padding: EdgeInsets.fromLTRB(50, 30, 50, 50),
          child: Column(
            children: [
              SizedBox(height: 20,),
              validUser||flag ?
              Container(height: 40,):
              Container(
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                height: 40,
                child: Center(
                  child: Text(errorMessage,
                    style: TextStyle(color: Colors.white,),),
                ),
              ),
              SizedBox(height: 20,),
              TextField(
                cursorColor: theme.black,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                    border: new OutlineInputBorder(
                      borderRadius: const BorderRadius.all(
                        const Radius.circular(10),
                      ),
                      borderSide: new BorderSide(
                        color: theme.black,
                        width: 1.0,
                      ),
                    ),
                    fillColor: theme.yellow,
                    filled: true,
                    icon: Icon(Icons.phone),
                    labelText: "phone number",
                    labelStyle: TextStyle(fontSize: 18,)
                ),
                onChanged: (String value){
                  inputPhoneNumberEnter = value;
                },
              ),
              SizedBox(height: 20,),
              TextField(
                cursorColor: theme.black,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                    border: new OutlineInputBorder(
                      borderRadius: const BorderRadius.all(
                        const Radius.circular(10),
                      ),
                      borderSide: new BorderSide(
                        color: theme.black,
                        width: 1.0,
                      ),
                    ),
                    fillColor: theme.yellow,
                    filled: true,
                    icon: Icon(Icons.vpn_key_sharp),
                    labelText: "password",
                    labelStyle: TextStyle(fontSize: 18)
                ),
                onChanged: (String value){
                  inputPasswordEnter = value;
                },
              ),
              SizedBox(height: 40,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(width: 20,),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        onPrimary: theme.yellow,
                        primary: theme.black,
                        padding: EdgeInsets.all(20)
                    ),
                    onPressed: (){
                      flag = false;
                      print(inputPhoneNumberEnter);
                      print(inputPasswordEnter);
                      _sendMessage();
                      if (validUser) {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => Nav()), // 0 index just for test
                        );
                      }
                      validUser=true;
                      setState(() {});
                    },
                    child: Text("Sign in", style: TextStyle(fontSize: 18),),
                  ),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          onPrimary: theme.yellow,
                          primary: theme.black,
                          padding: EdgeInsets.all(20)
                      ),
                      onPressed: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => RegisteringPage()),
                        );
                      },
                      child: Text("Sign up", style: TextStyle(fontSize: 18),)
                  ),
                  SizedBox(width: 30,)
                ],
              ),
            ],
          ),
        ),
      )
    );
  }


  void _sendMessage() async {
    await Socket.connect("192.168.56.1", 8080)
        .then((serverSocket) {
      print('Connected to Server');
      serverSocket.writeln("Phone: " + inputPhoneNumberEnter + ", " + "pass: " + inputPasswordEnter);
      serverSocket.listen((socket) async {
        String messageServer = await String.fromCharCodes(socket).trim();
        setState(() {
          print(messageServer);
          if (messageServer.contains("true")) {
            validUser = true;
          }
        });
      });
    });
  }
}