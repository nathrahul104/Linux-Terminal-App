import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:http/http.dart' as http;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(CommandApp());
}

class CommandApp extends StatefulWidget {
  @override
  _CommandAppState createState() => _CommandAppState();
}

class _CommandAppState extends State<CommandApp> {
  var fsc = FirebaseFirestore.instance;
  String x;
  String IP_Value = "192.168.1.8";
  var data;
  myweb(cmd) async {
    print(cmd);
    var url = "http://$IP_Value/cgi-bin/a.py?x=${cmd}";
    var r = await http.get(url);

    setState(() {
      data = r.body;
    });

    var d = fsc.collection("execute").add({
      x: data,
    });

    print(data);
  }

  mybody() {
    return Container(
      decoration: BoxDecoration(color: Colors.black),
      child: Center(
        child: Container(
          margin: EdgeInsets.fromLTRB(10, 90, 10, 10),
          child: Center(
            child: Container(
              margin: EdgeInsets.fromLTRB(0, 30, 0, 30),
              padding: EdgeInsets.symmetric(horizontal: 20),
              height: 800,
              width: 600,
              color: Colors.transparent,
              child: Column(
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                    ),
                    margin: EdgeInsets.fromLTRB(0, 0, 0, 20),
                    child: Theme(
                        data: new ThemeData(
                          primaryColor: Colors.blueGrey,
                          primaryColorDark: Colors.blueGrey,
                          hintColor: Colors.blueGrey,
                        ),
                        child: TextFormField(
                          style: TextStyle(color: Colors.white),
                          autocorrect: false,
                          textAlign: TextAlign.center,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.black,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25.0),
                              borderSide: BorderSide(),
                            ),
                            labelText: "Enter the Command ",
                            hoverColor: Colors.blueGrey,
                            prefixIcon: Icon(
                              Icons.tablet_android,
                              color: Colors.blueGrey,
                            ),
                          ),
                          onChanged: (val) {
                            x = val;
                            // print(val);
                          },
                        )),
                  ),
                  SizedBox(
                    width: 200.0,
                    height: 40,
                    child: FlatButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                            side: BorderSide(color: Colors.blueGrey)),
                        color: Colors.black,
                        textColor: Colors.blueGrey,
                        padding: EdgeInsets.all(8.0),
                        onPressed: () {
                          myweb(x);
                        },
                        child: Text(
                          "  Execute  ",
                          style: TextStyle(fontSize: 17),
                        )),
                  ),
                  Container(
                    height: 340,
                    width: 400,
                    margin: EdgeInsets.fromLTRB(0, 30, 0, 0),
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.black,
                      border: Border.all(color: Colors.blueGrey),
                    ),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Text(
                        data ?? " ! output !",
                        style: TextStyle(
                            color: Colors.green,
                            //fontWeight: FontWeight.bold,
                            fontSize: 15),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        //theme: ThemeData.dark(),
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          resizeToAvoidBottomPadding: false,
          appBar: AppBar(
//            actions: <Widget>[Icon(Icons.home)],
            title: Center(
              child: Text(
                "Execute Commands",
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),
            backgroundColor: Colors.black,
          ),
          body: mybody(),
        ));
  }
}
