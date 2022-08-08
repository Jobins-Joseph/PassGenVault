import 'package:encrypt/encrypt.dart';
import 'package:flutter/material.dart';
import 'package:password_manager/db/password_database.dart';
import 'package:password_manager/encrypt/encrypter.dart';
import 'package:password_manager/model/password_model.dart';

class AddTask extends StatefulWidget {
  late Function refershPasswords;
  AddTask({required this.refershPasswords});

  @override
  _AddTaskState createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  TextEditingController title = TextEditingController();
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();

  late List<Password> passwords;
  bool isLoading = false;
  String status = '';

  @override
  void initState() {
    super.initState();

    refreshNotes();
  }

  Future refreshNotes() async {
    setState(() => isLoading = true);

    this.passwords = await PasswordDatabase.instance.readAllNotes();

    setState(() => isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xfffdfdfd),
        appBar: AppBar(
          brightness: Brightness.dark,
          elevation: 0.0,
          backgroundColor: Color(0xffffffff),
          centerTitle: false,
          title: Text(
            'Add New Password',
            style: TextStyle(color: Colors.black,fontFamily: 'Ubuntu',fontWeight: FontWeight.bold),
          ),
          leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: Icon(
              Icons.arrow_back_ios_new_rounded,
              color: Colors.black,
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 0.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Website Name',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 14.0,fontFamily: 'Ubuntu',
                    fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 5.0,
              ),
              Container(
                height: 75.0,
                width: MediaQuery.of(context).size.width - 40.0,
                child: TextFormField(
                  style: TextStyle(color: Colors.black),
                  cursorColor: Colors.black,
                  maxLength: 60,
                  controller: title,
                  onFieldSubmitted: (value) {
                    title.text = value;
                  },
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(color: Colors.black, width: 2.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(
                        color: Colors.black,
                        width: 2.0,
                      ),
                    ),
                    counterStyle: TextStyle(color: Colors.black),
                    prefixIcon: Icon(
                      Icons.title,
                      size: 24,
                      color: Colors.black,
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0)),
                  ),
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Text(
                'Username/Email',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 14.0,fontFamily: 'Ubuntu',
                    fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 5.0,
              ),
              Container(
                height: 75.0,
                width: MediaQuery.of(context).size.width - 40.0,
                child: TextFormField(
                  style: TextStyle(color: Colors.black),
                  maxLength: 60,
                  controller: username,
                  onFieldSubmitted: (value) {
                    username.text = value;
                  },
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(color: Colors.black, width: 2.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(
                        color: Colors.black,
                        width: 2.0,
                      ),
                    ),
                    counterStyle: TextStyle(color: Colors.black),
                    prefixIcon: Icon(
                      Icons.email_rounded,
                      size: 24,
                      color: Colors.black,
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0)),
                  ),
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Text(
                'Password',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 14.0,fontFamily: 'Ubuntu',
                    fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 5.0,
              ),
              Container(
                height: 75.0,
                width: MediaQuery.of(context).size.width - 40.0,
                child: TextFormField(
                  style: TextStyle(color: Colors.black),
                  maxLength: 60,
                  controller: password,
                  onFieldSubmitted: (value) {
                    password.text = value;
                  },
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(color: Colors.black, width: 2.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(
                        color: Colors.black,
                        width: 2.0,
                      ),
                    ),
                    prefixIcon: Icon(
                      Icons.password_rounded,
                      size: 24,
                      color: Colors.black,
                    ),
                    counterStyle: TextStyle(color: Colors.black),
                    fillColor: Colors.black,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0)),
                  ),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              GestureDetector(
                onTap: () {
                  if (title.text == '' &&
                      username.text == '' &&
                      password.text == '') {
                    setState(() {
                      status = "All Fields Can't Be Empty";
                    });
                  } else if (title.text == '' || password.text == '') {
                    setState(() {
                      status = "Title And Password Are Compulsory";
                    });
                  } else {
                    
                    final encryptedText = Encrypt.instance.encryptOrDecryptText(title.text, true);
                    final encryptedUsername = Encrypt.instance.encryptOrDecryptText(username.text, true);
                    final encryptedPassword = Encrypt.instance.encryptOrDecryptText(password.text, true);

                    var passwordss = Password(
                        title: encryptedText,
                        username: encryptedUsername,
                        password: encryptedPassword);
                    PasswordDatabase.instance.create(passwordss);
                    widget.refershPasswords();
                    Navigator.pop(context);
                  }
                },
                child: Center(child: Container(
                  height: 50.0,
                  width: MediaQuery.of(context).size.width - 60.0,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [Color(0xff000000), Color(0xff000000)]),
                      borderRadius: BorderRadius.circular(35.0)),
                  child: Center(
                    child: Text(
                      'Save Password',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 24.0,fontFamily: 'Ubuntu',
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),),
              SizedBox(
                height: 5.0,
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
