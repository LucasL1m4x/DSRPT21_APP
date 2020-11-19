import 'package:dsrpt21_app/services/linha_de_robos_service.dart';
import 'package:flutter/material.dart';
import 'package:dsrpt21_app/models/linha_de_robos_model.dart';
import 'package:dsrpt21_app/screens/final_screen.dart';

const DOIS_PI = 3.14 * 2;
const kBlueColor = Color.fromRGBO(16, 38, 228, .9);

class ProgressScreen extends StatefulWidget {
  @override
  _ProgressScreenState createState() => _ProgressScreenState();
}

class _ProgressScreenState extends State<ProgressScreen> {
  @override
  Widget build(BuildContext context) {
    LinhaDeRobosModel linhaRobos = LinhaDeRobosModel();
    final size = 200.0;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: kBlueColor,
          title: Text("Construindo robô..."),
        ),
        body: Center(
          child: TweenAnimationBuilder(
            tween: Tween(begin: 0.0, end: 1.0),
            duration: Duration(seconds: 5 * 4),
            onEnd: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => FinalScreen(),
                ),
              );
            },
            builder: (context, value, child) {
              int percentage = (value * 100).ceil();
              double num = 0;
              if (percentage <= 25) {
                num = 4 * 0.25;
              } else {
                if (percentage <= 50) {
                  num = 4 * 0.5;
                } else {
                  if (percentage <= 75) {
                    num = 4 * 0.75;
                  } else {
                    if (percentage <= 100) {
                      num = 4 * 1.0;
                    }
                  }
                }
              }
              int numInt = num.toInt();
              return Container(
                width: size,
                height: size,
                child: Stack(
                  children: [
                    ShaderMask(
                      shaderCallback: (rect) {
                        return SweepGradient(
                                startAngle: 0.0,
                                endAngle: DOIS_PI,
                                stops: [value, value],
                                center: Alignment.center,
                                colors: [kBlueColor, Colors.grey.withAlpha(55)])
                            .createShader(rect);
                      },
                      child: Container(
                        width: size,
                        height: size,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                image: Image.asset("assets/radial_scale.png")
                                    .image)),
                      ),
                    ),
                    Center(
                      child: Container(
                        width: size - 40,
                        height: size - 40,
                        decoration: BoxDecoration(
                            color: Colors.white, shape: BoxShape.circle),
                        child: Center(
                            child: Text(
                          "$percentage %",
                          style: TextStyle(fontSize: 40, color: kBlueColor),
                        )),
                      ),
                    ),
                    Positioned(
                      child: Text(
                        "Robô ${numInt} de 4, sendo feito",
                        style: TextStyle(fontSize: 25, color: kBlueColor),
                      ),
                      top: -75,
                      left: -20,
                    ),
                  ],
                  overflow: Overflow.visible,
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
