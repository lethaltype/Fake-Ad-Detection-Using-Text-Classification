import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carzio/MainPage.dart';
import 'package:carzio/already_have_an_account_acheck.dart';
import 'package:carzio/SignUp.dart';

class SignIn extends StatefulWidget {
  TextEditingController _email = new TextEditingController();
  TextEditingController _password = new TextEditingController();

  bool _validate = false;

  Future<void> signin(BuildContext context) async {
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _email.text,
        password: _password.text,
      );
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => MainPage()));
    } catch (e) {
      print(e);
    }
  }

  bool isHiddenPassword = true;

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  TextEditingController _email = new TextEditingController();
  TextEditingController _password = new TextEditingController();

  Future<void> signin(BuildContext context) async {
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _email.text,
        password: _password.text,
      );
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => MainPage()));
    } catch (e) {
      print(e);
    }
  }

  final _formKey = GlobalKey<FormState>();
  bool isHiddenPassword = true;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.black,
        body: Padding(
          padding: const EdgeInsets.all(30),
          child: Center(
            child: Form(
              key: _formKey,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 50,
                      margin: EdgeInsets.all(10),
                      padding: EdgeInsets.all(10),
                      child: TextFormField(
                        decoration: InputDecoration(
                          hintText: 'Email Address',
                          icon: Icon(Icons.email),
                        ),
                        controller: _email,
                        validator: (String value) {
                          if (value.isEmpty) {
                            return "Please Enter Email ";
                            // ignore: missing_return
                          }
                          return null;
                        },
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadiusDirectional.circular(10),
                      ),
                    ),
                    Container(
                      height: 50,
                      margin: EdgeInsets.all(10),
                      padding: EdgeInsets.all(10),
                      child: TextFormField(
                        obscureText: isHiddenPassword,
                        decoration: InputDecoration(
                            hintText: 'Enter Password',
                            icon: Icon(Icons.lock),
                            suffixIcon: InkWell(
                              onTap: _togglePasswordView,
                              child: Icon(
                                Icons.visibility,
                              ),
                            )),
                        controller: _password,
                        validator: (String value) {
                          if (value.isEmpty) {
                            return "Field Cant be empty";
                            // ignore: missing_return
                          }
                          return null;
                        },
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadiusDirectional.circular(10),
                      ),
                    ),
                    Container(
                      height: 50,
                      width: 150,
                      padding: EdgeInsets.all(10),
                      child: FlatButton(
                        child: Text(
                          "Sign In",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                        ),
                        onPressed: () {
                          if (_formKey.currentState.validate()) {
                            signin(context);
                          }
                        },
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadiusDirectional.circular(20),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(10),
                      padding: EdgeInsets.all(10),
                      child: AlreadyHaveAnAccountCheck(
                        press: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return SignUp();
                              },
                            ),
                          );
                        },
                      ),
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

  void _togglePasswordView() {
    isHiddenPassword = !isHiddenPassword;
    setState(() {});
  }
}
