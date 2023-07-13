import 'package:firebase_auth/firebase_auth.dart';
import 'package:first_application/screens/bmi.dart';
import 'package:first_application/screens/login.dart';
import 'package:flutter/material.dart';

class homeScreen extends StatefulWidget {
  const homeScreen({Key? key}) : super(key: key);

  @override
  State<homeScreen> createState() => _homeScreenState();
}

class _homeScreenState extends State<homeScreen> {
  var weightController = TextEditingController();
  var ftController = TextEditingController();
  var inchController = TextEditingController();
  var result = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
              onPressed: () {
                FirebaseAuth.instance.signOut();
                Navigator.push(context, MaterialPageRoute(builder: (context) => loginScreen()));
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
                height: 31,
              ),
              TextField(
                controller: weightController,
                decoration: InputDecoration(
                  label: Text(
                    'Enter Weight(in Kgs)',
                    style: TextStyle(),
                  ),
                  prefixIcon: Icon(Icons.line_weight),
                ),
                keyboardType: TextInputType.number,
              ),
              SizedBox(
                height: 11,
              ),
              TextField(
                controller: ftController,
                decoration: InputDecoration(
                  label: Text(
                    'Enter Height(in fts)',
                    style: TextStyle(),
                  ),
                  prefixIcon: Icon(Icons.height),
                ),
                keyboardType: TextInputType.number,
              ),
              SizedBox(
                height: 11,
              ),
              TextField(
                controller: inchController,
                decoration: InputDecoration(
                  label: Text(
                    'Enter Height(in inches)',
                    style: TextStyle(),
                  ),
                  prefixIcon: Icon(Icons.height),
                ),
                keyboardType: TextInputType.number,
              ),
              SizedBox(
                height: 41,
              ),
              ElevatedButton(
                  onPressed: () {
                    var weight = weightController.text.toString();
                    var ft = ftController.text.toString();
                    var inch = inchController.text.toString();

                    if (weight != '' && ft != '' && inch != '') {
                      var iWt = int.parse(weight);
                      var iFt = int.parse(ft);
                      var iInc = int.parse(inch);

                      setState(() {
                        result = '';
                      });
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => bmiScreen(iWt, iFt, iInc)));
                    } else {
                      setState(() {
                        result = 'Please fill all the required fields';
                      });
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.green, // Sets the background color to white
                    minimumSize: Size(double.infinity, 50),
                  ),
                  child: Text(
                    'Calculate BMI',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  )),
              SizedBox(
                height: 11,
              ),
              Text(
                result,
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: Colors.red,
                ),
              ),
              
              
            ],
          ),
        ),
      ),
    );
  }
}
