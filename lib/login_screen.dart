// ignore_for_file: prefer_const_constructors, deprecated_member_use, avoid_print, duplicate_ignore, unused_field
import 'package:flutter/material.dart';
import 'package:bhive_flutter/registration_screen.dart';
import 'package:bhive_flutter/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:bhive_flutter/referalpage.dart';
import 'package:fluttertoast/fluttertoast.dart';

// ignore: import_of_legacy_library_into_null_safe
// ignore: import_of_legacy_library_into_null_safe

// ignore: use_key_in_widget_constructors

// ignore: use_key_in_widget_constructors
class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  late String _email, _password;

  void signin(BuildContext context) async {
    await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: _email, password: _password)
        .catchError((e) {
      print(e);
    }).then((authUser) {
      if (authUser.user != null) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => ReferalPage()));
        Fluttertoast.showToast(
            msg: "login successful",
            textColor: Colors.white,
            timeInSecForIosWeb: 3);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text('Welcome to login page'),
          centerTitle: true,
          shadowColor: Colors.white,
          leading: IconButton(
            icon: Icon(Icons.login),
            onPressed: () {},
          ),
          backgroundColor: Colors.pink,
        ),
        body: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: SingleChildScrollView(
            child: Form(
              key: formkey,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Stack(
                      children: [
                        Container(
                          height: height * 0.50,
                          width: width,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                                stops: const [0.3, 0.9],
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: const [
                                  Colors.pinkAccent,
                                  Colors.purpleAccent,
                                ]),
                          ),
                        ),
                      ],
                    ),
                    Center(
                      child: Text(
                        appName,
                        style: TextStyle(
                            fontSize: 50,
                            color: Colors.deepOrangeAccent,
                            fontWeight: FontWeight.w900),
                      ),
                    ),
                    Center(
                      child:
                          Text(slogan, style: TextStyle(color: Colors.black87)),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 00, top: 100),
                      child: Container(
                        child: Text(
                          "  $loginString  ",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 56),
                        ),
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.topRight,
                              colors: const [
                                Colors.yellowAccent,
                                Colors.greenAccent,
                              ],
                            ),
                            border: Border(
                                top: BorderSide(color: Colors.blue, width: 5))),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 30.0, top: 30, right: 30.0),
                      child: TextFormField(
                        onSaved: (value) {
                          _email = value!;
                        },
                        validator: (email) {
                          if (email!.isEmpty) {
                            return "Please Enter E-mail Id";
                          } else if (!RegExp(
                                  r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                              .hasMatch(email)) {
                            return "Its not a valid Email-Id";
                          }
                          return null;
                        },
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          focusedBorder: UnderlineInputBorder(
                              borderSide: (BorderSide(color: Colors.black))),
                          prefixIcon: Icon(Icons.email, color: Colors.black),
                          labelText: "E-mail Id",
                          labelStyle:
                              TextStyle(color: Colors.black, fontSize: 18),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 30.0, top: 30, right: 30.0),
                      child: TextFormField(
                        onSaved: (value) {
                          _password = value!;
                        },
                        validator: (password) {
                          if (password!.isEmpty) {
                            return "Please Enter Password";
                          } else if (password.length < 8 ||
                              password.length > 15) {
                            return "Password is Incorrect";
                          }
                          return null;
                        },
                        obscureText: true,
                        decoration: InputDecoration(
                          focusedBorder: UnderlineInputBorder(
                              borderSide: (BorderSide(color: Colors.blue))),
                          prefixIcon:
                              Icon(Icons.lock_open, color: Colors.black87),
                          labelText: "Password",
                          labelStyle:
                              TextStyle(color: Colors.black, fontSize: 18),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: Align(
                          alignment: Alignment.topRight,
                          child: FlatButton(
                              onPressed: () {},
                              child: Text(
                                forpswd,
                                style: TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.w900),
                              ))),
                    ),
                    Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: Center(
                          child: SizedBox(
                            height: height * 0.08,
                            width: width - 700,
                            child: FlatButton(
                              color: Colors.amber,
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(50))),
                              onPressed: () {
                                FocusScope.of(context).unfocus();
                                if (formkey.currentState!.validate()) {
                                  formkey.currentState!.save();
                                  signin(context);

                                  // if (_email == "hamid@gmail.com" &&
                                  //   _password == "abcd1234") {
                                  // FocusScope.of(context).unfocus();
                                  //Navigator.push(
                                  // context,
                                  //  MaterialPageRoute(
                                  //   builder: (context) => ReferalPage(),
                                  // ),
                                  //);
                                  //  } else {
                                  // ignore: avoid_print
                                  //  print("Invalid LoginId or Password");
                                  // }
                                }
                              },
                              child: Text(
                                "Login To Account",
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                              ),
                            ),
                          ),
                        )),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "Dont't have an account?",
                          style: TextStyle(fontSize: 16, color: Colors.black38),
                        ),
                        TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => RegistrationScreen()),
                              );
                            },
                            child: Text("Create Account"))
                      ],
                    )
                  ]),
            ),
          ),
        ));
  }
}
