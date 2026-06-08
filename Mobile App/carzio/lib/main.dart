import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:carzio/SignUp.dart';
import 'package:carzio/SignIn.dart';
import 'package:flutter_svg/svg.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      color: Colors.black,
      debugShowCheckedModeBanner: false,
      home: SplashScreen2(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: Container(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                  child: SvgPicture.asset(
                "assets/1.svg",
                width: 300.0,
                height: 300.0,
                alignment: Alignment.center,
              )),
              Container(
                height: 50,
                width: 150,
                padding: EdgeInsets.all(10),
                margin: EdgeInsets.all(10),
                child: FlatButton(
                    child: Text(
                      "Sign Up",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => SignUp()));
                    }),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadiusDirectional.circular(20),
                ),
              ),
              Container(
                height: 50,
                width: 150,
                margin: EdgeInsets.all(10),
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
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => SignIn()));
                    }),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadiusDirectional.circular(20),
                ),
              )
            ],
          ),
        ));
  }
}

class SplashScreen2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      backgroundColor: Colors.black,
      seconds: 5,
      navigateAfterSeconds: HomePage(),
      image: Image.asset(
        "assets/1.jpg",
        width: 300.0,
        height: 300.0,
        alignment: Alignment.center,
      ),
      photoSize: 200,
      title: Text(
        "Carzio! The Genuine Deals",
        style: TextStyle(
          color: Colors.white,
        ),
      ),
      loadingText: Text(
        "Loading...",
        style: TextStyle(
          color: Colors.white,
        ),
      ),
      loaderColor: Colors.amber[700],
    );
  }
}
