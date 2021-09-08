import 'package:customer_app/Objects/Customer.dart';
import 'package:customer_app/Objects/theme.dart';
import 'package:customer_app/Pages/profile_pages/comments_list_page.dart';
import 'package:customer_app/Pages/profile_pages/wallet_detail_page.dart';
import 'package:customer_app/data/Data.dart';
import 'package:flutter/material.dart';
import 'edit_profile_page.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  Customer currentCustomer = Data.customer;

  @override
  Widget build(BuildContext context) {
    Widget informationWidget() {
      return Row(
        children: [
          Container(
              child: Icon(
            Icons.account_circle,
            size: 150,
          )),
          SizedBox(
            width: 10,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("First Name : " + currentCustomer.getName()),
              Text("Last Name : " + currentCustomer.getLastName()),
              Text("Money of Wallet : " +
                  currentCustomer.getWallet().toString() +
                  " T")
            ],
          )
        ],
      );
    }

    Widget choicesWidget(String title, Widget page) {
      return Card(
        shadowColor: theme.black,
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        color: theme.yellow,
        child: TextButton(
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => page));
            },
            child: Text(
              title,
              style: TextStyle(fontSize: 24, color: theme.black),
            )),
      );
    }

    return Container(
      padding: EdgeInsets.only(left: 10, right: 10),
      child: ListView(
        children: [
          SizedBox(
            height: 10,
          ),
          informationWidget(),
          choicesWidget("Edit Information of Profile", EditProfilePage()),
          choicesWidget("Wallet Managing", WalletDetailPage()),
          choicesWidget("My Comments", CommentsListPage()),
        ],
      ),
    );
    // return Stack(
    //   children: [
    //
    //     // Positioned(
    //     //     height: 50,
    //     //     width: MediaQuery.of(context).size.width,
    //     //     bottom: 0,
    //     //     child: Container(
    //     //       color: Colors.black,
    //     //       child: TextButton(
    //     //         child: Text("Edit Profile"),
    //     //         onPressed: (){
    //     //           Navigator.push(context, MaterialPageRoute(builder:
    //     //               (context) => EditProfile(widget.currentCustomer)));
    //     //         },
    //     //       ),
    //     //     )
    //     // ),
    //   ],
    // );
  }
}
