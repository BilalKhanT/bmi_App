import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

class otpScreen extends StatefulWidget {
  const otpScreen({Key? key}) : super(key: key);

  @override
  State<otpScreen> createState() => _otpScreenState();
}

class _otpScreenState extends State<otpScreen> {
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
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.only(top: 150),
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
                height: 110,
              ),
              Text('Phone Number Verification.',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  )),
              SizedBox(
                height: 21,
              ),
              Text(
                'We need to register your phone number\nbefore getting started',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.green),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 21,
              ),
              Pinput(
                length: 6,
                pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
                showCursor: true,
              ),
              SizedBox(
                height: 21,
              ),
              ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    primary: Colors.green, // Sets the background color to white
                    minimumSize: Size(double.minPositive, 40),
                  ),
                  child: Text(
                    'Verify phone number',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  )),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  TextButton(
                      onPressed: () {},
                      child: Text(
                        'Edit phone number?',
                        style: TextStyle(
                            fontSize: 15,
                            color: Colors.green,
                            fontWeight: FontWeight.w500),
                      )),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
