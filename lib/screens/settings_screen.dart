import 'package:flutter/material.dart';
import 'package:password_manager/screens/about_screen.dart';
import 'package:password_manager/screens/password_report_screen.dart';
import 'package:password_manager/screens/security_screen.dart';

class Settings extends StatelessWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xff151922),
        appBar: AppBar(
          brightness: Brightness.dark,
          elevation: 0.0,
          backgroundColor: Color(0xff050404),
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios_new_rounded,
            ),
            color: Colors.white,
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: Text(
            'Settings',
            style: TextStyle(color: Colors.white,fontFamily: 'Ubuntu',fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
        ),
        body: Column(
          children: [
            Expanded(
                child: Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  color: Color(0xffffffff),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10.0),
                      topRight: Radius.circular(10.0))),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 0.0),
                child: Column(
                  children: [
                    SizedBox(
                      height: 10.0,
                    ),
                     GestureDetector(
                       onTap: () => Navigator.push(
                          context,
                           MaterialPageRoute(
                               builder: (_) => PasswordReportScreen())),
                       child: Container(
                         height: 60.0,
                         width: MediaQuery.of(context).size.width - 10.0,
                         decoration: BoxDecoration(
                             gradient: LinearGradient(
                                 begin: Alignment.topLeft,
                                 end: Alignment.bottomRight,
                                 colors: [Color(0xff000000), Color(0xff000000)]),
                             borderRadius: BorderRadius.circular(8.0)),
                         child: Padding(
                           padding: const EdgeInsets.all(8.0),
                           child: Row(
                             children: [
                               Icon(
                                 Icons.health_and_safety_outlined,
                                 color: Colors.white,
                                 size: 30.0,
                               ),
                               SizedBox(
                                 width: 10.0,
                               ),
                               Expanded(
                                 child: Row(
                                   mainAxisAlignment:
                                       MainAxisAlignment.spaceBetween,
                                   children: [
                                     Text(
                                       'Password Health',
                                       style: TextStyle(
                                           color: Colors.white, fontSize: 21.0,fontFamily: 'Ubuntu',),
                                     ),
                                     Icon(Icons.arrow_forward_ios_rounded)
                                   ],
                                 ),
                               ),
                             ],
                           ),
                         ),
                       ),
                     ),
                    SizedBox(
                      height: 20.0,
                    ),
                    GestureDetector(
                      onTap: () => Navigator.push(context,
                          MaterialPageRoute(builder: (_) => SecurityScreen())),
                      child: Container(
                        height: 60.0,
                        width: MediaQuery.of(context).size.width - 10.0,
                        decoration: BoxDecoration(
                            color: Color(0xff000000),
                            borderRadius: BorderRadius.circular(10.0)),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Row(
                            children: [
                              Icon(
                                Icons.security_rounded,
                                color: Colors.white,
                                size: 30.0,
                              ),
                              SizedBox(
                                width: 10.0,
                              ),
                              Expanded(
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Security',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 22.0,fontFamily: 'Ubuntu',),
                                    ),
                                    Icon(
                                      Icons.arrow_forward_ios_rounded,
                                      color: Colors.white,
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    GestureDetector(
                      onTap: () => Navigator.push(context,
                          MaterialPageRoute(builder: (_) => AboutScreen())),
                      child: Container(
                        height: 60.0,
                        width: MediaQuery.of(context).size.width - 10.0,
                        decoration: BoxDecoration(
                            color: Color(0xff050404),
                            borderRadius: BorderRadius.circular(10.0)),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Row(
                            children: [
                              Icon(
                                Icons.info_outline_rounded,
                                color: Colors.white,
                                size: 30.0,
                              ),
                              SizedBox(
                                width: 10.0,
                              ),
                              Expanded(
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'About',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 22.0,fontFamily: 'Ubuntu',),
                                    ),
                                    Icon(
                                      Icons.arrow_forward_ios_rounded,
                                      color: Colors.white,
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ))
          ],
        ));
  }
}
