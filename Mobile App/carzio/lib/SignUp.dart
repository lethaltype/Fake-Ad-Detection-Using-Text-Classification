import 'package:carzio/main.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:carzio/already_have_an_account_acheck.dart';
import 'package:carzio/SignIn.dart';


class SignUp extends StatefulWidget {
  TextEditingController _email = new TextEditingController();
  TextEditingController _password = new TextEditingController();

  Future<void> signup(BuildContext context) async {
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _email.text,
        password: _password.text,
      );
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => HomePage()));
    } catch (e) {
      print(e);
    }
  }

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController _email = new TextEditingController();
  TextEditingController _username = new TextEditingController();
  TextEditingController _password = new TextEditingController();
  TextEditingController _confirmpassword = new TextEditingController();

  Future<void> signup(BuildContext context) async {
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _email.text,
        password: _password.text,
      );
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => HomePage()));
    } catch (e) {
      print(e);
    }
  }

  var _formkey = GlobalKey<FormState>();
  bool isHiddenPassword = true;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.black,
        body: Center(
          child: Form(
            key: _formkey,
            child: Padding(
              padding: EdgeInsets.all(30),
              child: Center(
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
                            hintText: "Enter Username",
                            icon: Icon(Icons.person),
                          ),
                          controller: _username,
                          validator: (String value) {
                            if (value.isEmpty) {
                              return "Please Enter Username ";
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
                          decoration: InputDecoration(
                            hintText: "Enter your Email",
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
                              hintText: "Enter your password ",
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
                              return "Please Enter password ";
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
                              hintText: "Confirm your password ",
                              icon: Icon(Icons.lock),
                              suffixIcon: InkWell(
                                onTap: _togglePasswordView,
                                child: Icon(
                                  Icons.visibility,
                                ),
                              )),
                          controller: _confirmpassword,
                          validator: (String value) {
                            if (value.isEmpty) {
                              return "Please Re-Enter Password";
                            }
                            if (value != _password.text) {
                              return 'Password Not Match';
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
                            "Sign Up",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),
                          ),
                          onPressed: () {
                            if (_formkey.currentState.validate()) {
                              signup(context);
                            }
                          },
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadiusDirectional.circular(10),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.all(10),
                        padding: EdgeInsets.all(10),
                        child: AlreadyHaveAnAccountCheck(
                          login: false,
                          press: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return SignIn();
                                },
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
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
