import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:password_manager/getStartedScreen/second_screen.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({Key? key}) : super(key: key);

  @override
  _FirstScreenState createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff1f1f1),
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 80.0,
            ),
            SizedBox(
              height: 80.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.security_rounded,
                  color: Colors.black,
                  size:
                  MediaQuery.of(context).size.width < 800 ? 220.0 : 240.0,
                ),
              ],
            ),
            SizedBox(
              height: 40.0,
            ),
            Text(
              'Passhub - Password Manager',
              style: TextStyle(
                  color: Colors.black,fontFamily: 'Ubuntu',
                  fontSize:
                      MediaQuery.of(context).size.width < 800 ? 30.0 : 36.0),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 40.0,
            ),
            Text(
              'A Complete Solution for securely Managing Your Passwords',
              style: TextStyle(
                  color: Colors.black,fontFamily: 'Ubuntu',
                  fontSize:
                  MediaQuery.of(context).size.width < 800 ? 24.0 : 30.0),
              textAlign: TextAlign.center,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                '',
                style: TextStyle(
                    color: Colors.black,
                    fontSize:
                        MediaQuery.of(context).size.width < 800 ? 14.0 : 20.0),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: GestureDetector(
                  onTap: () => Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (_) => SecondScreen())),
                  child: Container(
                    height: 60.0,
                    width: MediaQuery.of(context).size.width - 70.0,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [Color(0xff020000), Color(0xff050000)]),
                        borderRadius: BorderRadius.circular(35.0)),
                    child: Center(
                      child: Text(
                        'Get started',
                        style: TextStyle(color: Colors.white, fontSize: 24.0,fontFamily: 'Ubuntu',),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 40.0,
            ),
          ],
        ),
      ),
    );
  }
}
