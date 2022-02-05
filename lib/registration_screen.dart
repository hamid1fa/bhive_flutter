// ignore: file_names
// ignore: file_names
// ignore: file_names, avoid_web_libraries_in_flutter

// ignore_for_file: unused_import, prefer_typing_uninitialized_variables

import 'package:bhive_flutter/referalpage.dart';
import 'package:bhive_flutter/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:bhive_flutter/login_screen.dart';
import 'package:fluttertoast/fluttertoast.dart';

// ignore: camel_case_types
class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({Key? key}) : super(key: key);

  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

// ignore: camel_case_types
class _RegistrationScreenState extends State<RegistrationScreen> {
  final _auth = FirebaseAuth.instance;

  final _formkey = GlobalKey<FormState>();
  final secondNameEditingController = TextEditingController();
  final firstNameEditingController = TextEditingController();
  final emailNameEditingController = TextEditingController();
  final passwordNameEditingController = TextEditingController();
  final confirmpasswordNameEditingController = TextEditingController();

  get value => null;

  // ignore: prefer_typing_uninitialized_variable

  @override
  Widget build(BuildContext context) {
    final firstNamefield = TextFormField(
        autofocus: false,
        controller: firstNameEditingController,
        keyboardType: TextInputType.name,
        validator: (value) {
          RegExp regExp = RegExp(r'^.{3,}$');
          if (value!.isEmpty) {
            return ("First Name cannot be empty");
          }
          if (!regExp.hasMatch(value)) {
            return ("Enter Valid name(min.3 Character)");
          }
          return null;
        },
        // ignore: non_constant_identifier_names
        onSaved: (Value) {
          firstNameEditingController.text = value!;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          prefixIcon: const Icon(Icons.account_circle),
          contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "First Name",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ));

    final secondNamelField = TextFormField(
        autofocus: false,
        controller: secondNameEditingController,
        keyboardType: TextInputType.name,
        validator: (value) {
          if (value!.isEmpty) {
            return ("second name cannot be empty");
          }
          return null;
        },
        // ignore: duplicate_ignore
        onSaved: (value) {
          secondNameEditingController.text = value!;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          prefixIcon: const Icon(Icons.account_circle_outlined),
          contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Second Name",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ));

    final emailField = TextFormField(
        autofocus: false,
        controller: emailNameEditingController,
        keyboardType: TextInputType.emailAddress,
        validator: (value) {
          if (value!.isEmpty) {
            return ("please enter a valid email");
          }
          return null;
        },
        // ignore: non_constant_identifier_names
        onSaved: (Value) {
          emailNameEditingController.text = value!;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          prefixIcon: const Icon(Icons.mail),
          contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "E-mail",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ));

    final passwordField = TextFormField(
        autofocus: false,
        controller: passwordNameEditingController,
        obscureText: true,
        validator: (value) {
          // ignore: unused_local_variable
          RegExp regExp = RegExp(r'^,{6,}$');
          if (value!.isEmpty) {
            return ("password is required for signup");
          }
          return null;
        },
        onSaved: (value) {
          passwordNameEditingController.text = value!;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          prefixIcon: const Icon(Icons.vpn_key_rounded),
          contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Password",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ));

    final confirmpasswordField = TextFormField(
        autofocus: false,
        controller: confirmpasswordNameEditingController,
        obscureText: true,
        validator: (value) {
          // ignore: unrelated_type_equality_checks
          if (confirmpasswordNameEditingController.text !=
              passwordNameEditingController.text) {
            return "password don't match";
          }
          return null;
        },
        // ignore: non_constant_identifier_names
        onSaved: (Value) {
          confirmpasswordNameEditingController.text = value!;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          prefixIcon: const Icon(Icons.vpn_key_sharp),
          contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Confirm Password",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ));

    final signUpButton = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(50),
      color: Colors.redAccent,
      child: MaterialButton(
          padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
          minWidth: MediaQuery.of(context).size.height,
          onPressed: () {
            signUp(emailNameEditingController.text,
                passwordNameEditingController.text);
            Fluttertoast.showToast(
                msg: "Account Created Successfully ",
                backgroundColor: Colors.black,
                toastLength: Toast.LENGTH_LONG,
                timeInSecForIosWeb: 3);
            Navigator.pushAndRemoveUntil(
                (context),
                MaterialPageRoute(builder: (context) => LoginScreen()),
                // ignore: avoid_types_as_parameter_names, non_constant_identifier_names
                (Route) => false);
          },
          child: const Text(
            "Sign Up",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 40, color: Colors.white, fontWeight: FontWeight.bold),
          )),
    );

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.red),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(36.0),
              child: Form(
                key: _formkey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                        height: 200,
                        child: Image.asset(
                          "assets/bhive.png",
                          fit: BoxFit.contain,
                        )),
                    const SizedBox(height: 45),
                    firstNamefield,
                    const SizedBox(height: 45),
                    secondNamelField,
                    const SizedBox(height: 45),
                    emailField,
                    const SizedBox(height: 45),
                    passwordField,
                    const SizedBox(height: 45),
                    confirmpasswordField,
                    signUpButton,
                    const SizedBox(height: 25),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "Already have an account?",
                          style: TextStyle(fontSize: 16, color: Colors.black),
                        ),
                        TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => LoginScreen()),
                              );
                            },
                            child: Text("Sign in"))
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> signUp(String email, String password) async {
    // ignore: empty_statements
    if (_formkey.currentState!.validate()) {
      await _auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) => {postDetailsToFirestore()})
          .catchError((e) {
        Fluttertoast.showToast(msg: e!.message);
      });
    }
  }

  postDetailsToFirestore() async {
    // ignore: unused_local_variable
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    // ignore: non_constant_identifier_names
    User? user = _auth.currentUser;

    // ignore: unused_local_variable
    UserModel usermodel = UserModel();

    var userModel;
    userModel.email = user!.email;
    userModel.uid = user.uid;
    userModel.firstName = firstNameEditingController.text;
    userModel.secondName = secondNameEditingController.text;

    await firebaseFirestore
        .collection("users")
        .doc(user.uid)
        .set(userModel.toMap());
  }
}
