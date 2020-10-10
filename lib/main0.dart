import 'package:flutter/material.dart';
import 'package:linuxcommands_app/main1.dart';
import 'package:firebase_core/firebase_core.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();
  runApp(MaterialApp(
    home: FirstRoute(),
  ));
}

class FirstRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: Container(
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
                                  labelText: "Enter the IP Address ",
                                  hoverColor: Colors.blueGrey,
                                  prefixIcon: Icon(
                                    Icons.tablet_android,
                                    color: Colors.blueGrey,
                                  ),
                                ),
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
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => MyApp()),
                                );
                              },
                              child: Text(
                                "  Continue  ",
                                style: TextStyle(fontSize: 17),
                              )),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
