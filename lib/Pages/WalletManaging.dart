

import 'package:customer_app/Objects/Customer.dart';
import 'package:customer_app/Objects/theme.dart';
import 'package:customer_app/appBar.dart';
import 'package:customer_app/data/SocketConnect.dart';
import 'package:flutter/material.dart';

class WalletManaging extends StatefulWidget {



  @override
  _WalletManagingState createState() => _WalletManagingState();
}

class _WalletManagingState extends State<WalletManaging> {

  var _formKey = GlobalKey<FormState>();
  bool isInteger(String string) {
    // Null or empty string is not a number
    if (string == null || string.isEmpty) {
      return false;
    }

    // Try to parse input string to number.
    // Both integer and double work.
    // Use int.tryParse if you want to check integer only.
    // Use double.tryParse if you want to check double only.
    final number = int.tryParse(string);

    if (number == null) {
      return false;
    }

    return true;
  }
  int increaseAmount = 0;

  void _sendMessage() async {
    await SocketConnect.socket.then((value) {
      print('Connected to Server in WalletManaging');

      value.writeln("wallet::$increaseAmount"); //ToDo need widget.currentCustomer :/

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      backgroundColor: theme.yellow2,
      body: Center(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: EdgeInsets.only(left: 20, right: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children:[
                Text("Current Wallet: $increaseAmount"), //ToDo need widget.currentCustomer
                TextFormField(
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
                      icon: Icon(Icons.attach_money),
                      labelText: "Increase Amount",
                      labelStyle: TextStyle(fontSize: 18,)
                  ),
                  validator: (String value) {
                    if(!isInteger(value) ||
                        value.contains(' ')){
                      return "Increase amount should be a digit";
                    }
                    return null;
                  },
                  onSaved: (String value) => increaseAmount = int.tryParse(value),
                ),
                SizedBox(height: 20,),
                ElevatedButton(
                  child: Text("Increase"),
                  style: ElevatedButton.styleFrom(
                      onPrimary: theme.yellow,
                      primary: theme.black,
                      padding: EdgeInsets.all(20)
                  ),
                  onPressed: () {
                    if (_formKey.currentState.validate()) {
                      _formKey.currentState.save();
                      //ToDo need: widget._customer.setWallet(widget._customer.getWallet()+increaseAmount);
                      _sendMessage();
                    }
                    setState(() {});
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
