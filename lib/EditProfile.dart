import 'package:flutter/material.dart';
import 'package:customer_app/appBar.dart';
import 'package:flutter/cupertino.dart';
import 'Objects/Customer.dart';

class EditProfile extends StatefulWidget {

  Customer currentCustomer;
  EditProfile(this.currentCustomer);

  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      body: Container(
        height: double.maxFinite,
        child: SingleChildScrollView(

      ),
      )
    );
  }
}
