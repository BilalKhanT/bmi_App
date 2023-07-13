import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:first_application/screens/otp.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class signupScreen extends StatefulWidget {
  const signupScreen({Key? key}) : super(key: key);

  @override
  State<signupScreen> createState() => _signupScreenState();
}

class _signupScreenState extends State<signupScreen> {
  var nameController = TextEditingController();
  var passController = TextEditingController();
  var conPassController = TextEditingController();
  var phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_back_ios_new,
                color: Colors.green,
              ))),
      body: Center(
        child: Container(
          width: 300,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                child: RichText(
                  text: TextSpan(children: [
                    TextSpan(
                        text: 'Health',
                        style: TextStyle(
                          fontSize: 34,
                          fontWeight: FontWeight.w700,
                          letterSpacing: 3,
                          color: Colors.black,
                        )),
                    TextSpan(
                        text: 'Metric',
                        style: TextStyle(
                          fontSize: 34,
                          fontWeight: FontWeight.w700,
                          letterSpacing: 3,
                          color: Colors.green,
                        )),
                  ]),
                ),
              ),
              SizedBox(
                height: 21,
              ),
              TextField(
                controller: nameController,
                decoration: InputDecoration(
                    label: Text(
                      'Enter Username',
                      style: TextStyle(),
                    ),
                    prefixIcon: Icon(Icons.person)),
              ),
              SizedBox(
                height: 11,
              ),
              TextField(
                controller: passController,
                decoration: InputDecoration(
                  label: Text(
                    'Enter Password',
                    style: TextStyle(),
                  ),
                  prefixIcon: Icon(Icons.password),
                ),
              ),
              SizedBox(
                height: 11,
              ),
              TextField(
                controller: conPassController,
                decoration: InputDecoration(
                  label: Text(
                    'Confirm Password',
                    style: TextStyle(),
                  ),
                  prefixIcon: Icon(Icons.password),
                ),
              ),
              SizedBox(
                height: 11,
              ),
              IntlPhoneField(
                controller: phoneController,
                decoration: InputDecoration(
                  label: Text(
                    'Enter Phone Number',
                    style: TextStyle(),
                  ),
                ),
                keyboardType: TextInputType.number,
              ),
              SizedBox(
                height: 21,
              ),
              ElevatedButton(
                  onPressed: () {
                    FirebaseAuth.instance.createUserWithEmailAndPassword(
                        email: nameController.text.trim(),
                        password: passController.text.trim(),);

                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.green,
                    minimumSize: Size(double.infinity, 50),
                  ),
                  child: Text(
                    'Create Account',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
