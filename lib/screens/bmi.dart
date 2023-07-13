import 'package:first_application/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class bmiScreen extends StatelessWidget {
  var weight;
  var ft;
  var inch;

  bmiScreen(this.weight, this.ft, this.inch);

  double getBMI() {
    var bmi;
    var total_inch = (ft * 12) + inch;
    var tCm = total_inch * 2.54;
    var tM = tCm / 100;
    bmi = weight / (tM * tM);
    return bmi;
  }

  String result(double bmi) {
    if (bmi < 18.5) {
      return ('You are Underweight');
    } else if (bmi > 18.5 && bmi < 24.9) {
      return 'You are Healthy';
    } else {
      return 'You are Overweight';
    }
  }

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
              height: 300,
              width: 200,
              child: SfRadialGauge(
                axes: <RadialAxis>[
                  RadialAxis(
                    minimum: 10,
                    maximum: 50,
                    ranges: <GaugeRange>[
                      GaugeRange(
                          startValue: 10, endValue: 18.5, color: Colors.green),
                      GaugeRange(
                          startValue: 18.5,
                          endValue: 24.9,
                          color: Colors.yellow),
                      GaugeRange(
                          startValue: 24.9,
                          endValue: 29.9,
                          color: Colors.orange),
                      GaugeRange(
                          startValue: 29.9, endValue: 50, color: Colors.red),
                    ],
                    pointers: <GaugePointer>[
                      NeedlePointer(value: getBMI(), enableAnimation: true),
                    ],
                    annotations: <GaugeAnnotation>[
                      GaugeAnnotation(
                        widget: Container(
                          child: Text(
                            getBMI().toStringAsFixed(1),
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                        angle: 90,
                        positionFactor: 0.8,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 31,
            ),
            Text(
              result(getBMI()),
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
                color: Colors.black,
              ),
            )
          ],
        ),
      ),
    );
  }
}
