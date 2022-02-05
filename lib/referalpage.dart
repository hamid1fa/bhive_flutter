// ignore_for_file: prefer_const_constructors, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:bhive_flutter/constants.dart';
import 'colors.dart';

// ignore: use_key_in_widget_constructors
class ReferalPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('welcome to referral page'),
        centerTitle: false,
        shadowColor: Colors.limeAccent,
        leading: IconButton(
          icon: Icon(Icons.home_outlined),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Stack(
              children: <Widget>[
                Image.asset(
                  bgimage,
                  height: height * 0.4,
                  width: width,
                  fit: BoxFit.fill,
                ),
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      // ignore: prefer_const_literals_to_create_immutables
                      stops: [0.6, 0.9],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      // ignore: prefer_const_literals_to_create_immutables
                      colors: [Colors.transparent, Colors.yellow],
                    ),
                  ),
                ),
              ],
            ),
            Center(
              child: Text(
                appName,
                style: TextStyle(
                    fontSize: 30,
                    color: Colors.deepOrange,
                    fontWeight: FontWeight.w900),
              ),
            ),
            Center(
                child: Text(
              slogan,
              style: TextStyle(color: Colors.yellowAccent[600]),
            )),
            Padding(
              padding: const EdgeInsets.only(left: 10.0, top: 50),
              child: Container(
                child: Text(
                  "  $referal  ",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.redAccent,
                      fontSize: 26),
                ),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.blue.withOpacity(0.6),
                      Colors.transparent,
                    ],
                  ),
                  border: Border(
                    left: BorderSide(color: primarycolor, width: 5),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Center(
                  child: Text(
                subcontent,
                style: TextStyle(
                    color: Colors.black87,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              )),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: Center(
                child: SizedBox(
                  height: height * 0.08,
                  width: width - 1200,
                  child: FlatButton(
                    color: Colors.cyan,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(50))),
                    onPressed: () {},
                    child: Text(
                      refFriend,
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: Center(
                child: SizedBox(
                  height: height * 0.08,
                  width: width - 1200,
                  child: FlatButton(
                    color: Colors.yellow,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(50))),
                    onPressed: () {},
                    child: Text(
                      refDashboard,
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "share to ...",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                  ),
                  ElevatedButton(
                      onPressed: () {},
                      child: Text(
                        "Gmail",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.redAccent),
                      )),
                  OutlinedButton(
                      onPressed: () {},
                      child: Text(
                        "Facebook",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.lightBlue),
                      )),
                  OutlinedButton(
                      onPressed: () {},
                      child: Text(
                        "WhatsApp",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.greenAccent),
                      )),
                  OutlinedButton(
                      onPressed: () {},
                      child: Text(
                        "Instagram",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.pinkAccent),
                      )),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
