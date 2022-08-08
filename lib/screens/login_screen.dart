import 'package:flutter/material.dart';
import 'package:password_manager/db/user_database.dart';
import 'package:password_manager/encrypt/encrypter.dart';
import 'package:password_manager/model/user_info_model.dart';
import 'package:password_manager/screens/home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController masterPassword = TextEditingController();

  late List<User> users;
  bool isLoading = false;
  String status = '';

  @override
  void initState() {
    super.initState();

    refreshNotes();
  }

  @override
  void dispose() {
    UserDatabase.instance.close();

    super.dispose();
  }

  Future refreshNotes() async {
    setState(() => isLoading = true);

    this.users = await UserDatabase.instance.readAllNotes();

    setState(() => isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 20.0,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start
                  ,
                  children: [
                    Text(
                      'PassGen Vault',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,fontFamily: 'ubuntu ',
                          fontSize: MediaQuery.of(context).size.width < 800
                              ? 27.0
                              : 32.0),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 15.0,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [

                  ],
                ),
              ),
              SizedBox(
                height: 35.0,
              ),

              SizedBox(
                height: 40.0,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: Text(
                  'Master Password',
                  style: TextStyle(color: Colors.black,fontFamily: 'Ubuntu',),
                ),
              ),
              SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 80.0,
                    width: MediaQuery.of(context).size.width,
                    child: TextFormField(
                      style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold
                      ),
                      maxLength: 60,
                      controller: masterPassword,
                      onFieldSubmitted: (value) {
                        masterPassword.text = value;
                      },
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(0.0),
                          borderSide:
                              BorderSide(color: Colors.black, width: 0.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide(
                            width: 2.0,
                            color: Colors.black,
                          ),
                        ),
                        counterStyle: TextStyle(color: Colors.black),
                        prefixIcon: Icon(
                          Icons.password_rounded,
                          color: Colors.black,
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0)),
                        hintText: 'Enter Your Master Password Here',
                        hintStyle: TextStyle(color: Colors.black,fontFamily: 'Ubuntu',),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 30.0,
              ),
              Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: GestureDetector(
                      onTap: () {
                        if (masterPassword.text == Encrypt.instance.encryptOrDecryptText(users[0].masterpswd, false)) {
                          Navigator.pushReplacement(context,
                              MaterialPageRoute(builder: (_) => HomeScreen()));
                        } else {
                          setState(() {
                            status = 'Incorrect Password';
                          });
                        }
                      },
                      child: Container(
                        height: 55.0,
                        width: MediaQuery.of(context).size.width - 20.0,
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: [Color(0xff000000), Color(0xff000000)]),
                            borderRadius: BorderRadius.circular(10.0)),
                        child: Center(
                          child: Text(
                            'Enter',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 24.0,
                                fontFamily: 'Ubuntu',
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ))),
              SizedBox(
                height: 8.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    status,
                    style: TextStyle(color: Colors.black, fontSize: 16.0),
                  ),
                ],
              )
            ],
          ),
        ));
  }
}
