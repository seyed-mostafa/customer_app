

import 'package:customer_app/Objects/Customer.dart';
import 'package:customer_app/Objects/theme.dart';
import 'package:customer_app/appBar.dart';
import 'package:customer_app/data/Data.dart';
import 'package:customer_app/data/Data.dart';
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

  void _sendMessage() async {
    await SocketConnect.socket.then((value) {
      print('Connected to Server in WalletManaging');

      value.writeln("wallet::${Data.customer.getWallet()}");

    });
  }

  @override
  Widget build(BuildContext context) {
  int increaseAmount = Data.customer.getWallet();
    return Scaffold(
      appBar: appBar(context),
      backgroundColor: theme.yellow2,
      body: Center(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: EdgeInsets.only(left: 20, right: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children:[
                Text("Current Wallet: $increaseAmount"),
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
                  onSaved: (String value) => increaseAmount += int.tryParse(value),
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
                      Data.customer.setWallet(increaseAmount);
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
