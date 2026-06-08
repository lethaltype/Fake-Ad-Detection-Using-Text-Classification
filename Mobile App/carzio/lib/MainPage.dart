import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  TextEditingController _link = new TextEditingController();

  var _formkey = GlobalKey<FormState>();
  String predict='Waiting For results';
  String link ='no link';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black26,
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: Center(
          child: Form(
            key: _formkey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 100,
                  margin: EdgeInsets.all(10),
                  padding: EdgeInsets.all(10),
                  child: TextFormField(
                    enableInteractiveSelection: true,
                    toolbarOptions: ToolbarOptions(
                      paste: true,
                      copy: true,
                      selectAll: true,
                    ),
                    decoration: InputDecoration(
                      labelText: "Pakwheel Ad URL",
                      hintText: 'paste URL',
                      icon: Icon(Icons.link),
                    ),
                    controller: _link,
                    validator: (String value) {
                      link=value;
                      if (value.isEmpty) {
                        return "Please Enter URL ";
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
                    child: Text("Check",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                    onPressed: () async {
                      final send = await http.post(Uri.parse('http://172.17.56.52:5000/link'),
                          body: json.encode({'link':_link.text}));
                      final response = await http.get(Uri.parse('http://172.17.56.52:5000/result'));
                      final decoded=json.decode(response.body) as Map<String,dynamic>;
                      setState(() {
                        predict=decoded['result'];

                      });
                    },
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadiusDirectional.circular(10),
                  ),
                ),
                Container(

                  padding: EdgeInsets.all(50),
                  child: Text(predict,style: TextStyle(
                    fontSize: 20, color: Colors.white,
                  ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}