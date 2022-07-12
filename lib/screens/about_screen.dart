import 'package:flutter/material.dart';

class AboutScreen extends StatefulWidget {
  const AboutScreen({Key? key}) : super(key: key);

  @override
  _AboutScreenState createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xff151922),
        appBar: AppBar(
          brightness: Brightness.dark,
          elevation: 0.0,
          backgroundColor: Color(0xff242a33),
          title: Text(
            'About',
            style: TextStyle(color: Colors.white,fontFamily: 'Ubuntu',fontWeight: FontWeight.bold),
          ),
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios_new_rounded,
              color: Colors.white,
            ),
            onPressed: () => Navigator.pop(context),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 0.0),
          child: Column(
            children: [
              Container(
                height: 60.0,
                width: MediaQuery.of(context).size.width - 30.0,
                decoration: BoxDecoration(
                    color: Color(0xff343d50),
                    borderRadius: BorderRadius.circular(8.0)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Version',
                        style: TextStyle(
                            color: Colors.white,fontFamily: 'Ubuntu',
                            fontWeight: FontWeight.w500,
                            fontSize: 20.0),
                      ),
                      Text(
                        '1.0.0',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,fontFamily: 'Ubuntu',
                            fontWeight: FontWeight.w800),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Container(
                height: 60.0,
                width: MediaQuery.of(context).size.width - 30.0,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [Color(0xff2aa7f3), Color(0xff2463f6)]),
                    borderRadius: BorderRadius.circular(8.0)),
                child: Padding(
                    padding: const EdgeInsets.fromLTRB(10.0, 17.0, 10.0, 0.0),
                    child: Text(
                      'Created by PassHub INC.',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,fontFamily: 'Ubuntu',
                          fontWeight: FontWeight.w600),
                    )),
              ),
              SizedBox(
                height: 20.0,
              ),
              Container(
              child: Padding(
                  padding: const EdgeInsets.fromLTRB(10.0, 17.0, 10.0, 0.0),
                  child: Center(child: Text(
                    'Created by Gibin M George (AJC19IT023) , Roshan Reji(AJC19IT043) , Arjun Biju(AJC19IT016) , Christy Martin(AJC19IT020) as part of S6 Mini-Project .',
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: 10.0,fontFamily: 'Ubuntu',
                        fontWeight: FontWeight.w600),
                  )),),
              ),
            ],
          ),
        ));
  }
}
