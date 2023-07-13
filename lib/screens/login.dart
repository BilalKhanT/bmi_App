import 'package:firebase_auth/firebase_auth.dart';
import 'package:first_application/screens/home.dart';
import 'package:first_application/screens/signup.dart';
import 'package:flutter/material.dart';

class loginScreen extends StatefulWidget {
  const loginScreen({Key? key}) : super(key: key);

  @override
  State<loginScreen> createState() => _loginScreenState();
}

class _loginScreenState extends State<loginScreen> {
  var userController = TextEditingController();
  var pasController = TextEditingController();

  @override
  void dispose() {
    userController.dispose();
    pasController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          padding: EdgeInsets.only(top: 150),
          width: 300,
          child: SingleChildScrollView(
            child: Column(
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
                  height: 41,
                ),
                TextField(
                  controller: userController,
                  decoration: InputDecoration(
                    label: Text(
                      'Enter UserName',
                      style: TextStyle(),
                    ),
                    prefixIcon: Icon(Icons.person),
                  ),
                ),
                SizedBox(
                  height: 11,
                ),
                TextField(
                  controller: pasController,
                  obscureText: true,
                  decoration: InputDecoration(
                    label: Text(
                      'Enter Password',
                      style: TextStyle(),
                    ),
                    prefixIcon: Icon(Icons.password),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                        onPressed: () {},
                        child: Text(
                          'Forgot Password?',
                          style: TextStyle(
                              fontSize: 15,
                              color: Colors.green,
                              fontWeight: FontWeight.w500),
                        ))
                  ],
                ),
                SizedBox(
                  height: 11,
                ),
                ElevatedButton(
                    onPressed: () {
                      FirebaseAuth.instance.signInWithEmailAndPassword(
                          email: userController.text.trim(),
                          password: pasController.text.trim());
                    },
                    style: ElevatedButton.styleFrom(
                      primary:
                          Colors.green, // Sets the background color to white
                      minimumSize: Size(double.infinity, 50),
                    ),
                    child: Text(
                      'Login',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    )),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Dont have an account.',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => signupScreen()));
                        },
                        child: Text(
                          'Sign Up',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w900,
                            color: Colors.green,
                          ),
                        ))
                  ],
                ),
                SizedBox(
                  height: 31,
                ),
                Text(
                  'or',
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      color: Colors.black),
                ),
                Text(
                  'sign in with',
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      color: Colors.black),
                ),
                SizedBox(
                  height: 21,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: Image.asset(
                        'assets/gogIcon.png',
                        width: 60, // Adjust the width as per your preference
                        height: 60, // Adjust the height as per your preference
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Image.asset(
                        'assets/fbIcon.png',
                        width: 60, // Adjust the width as per your preference
                        height: 60, // Adjust the height as per your preference
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
