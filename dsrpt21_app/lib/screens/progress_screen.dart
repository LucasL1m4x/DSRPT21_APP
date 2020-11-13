import 'package:flutter/material.dart';

const DOIS_PI = 3.14 * 2;
const kBlueColor = Color.fromRGBO(16, 38, 228, .9);

class ProgressScreen extends StatefulWidget {
  @override
  _ProgressScreenState createState() => _ProgressScreenState();
}

class _ProgressScreenState extends State<ProgressScreen> {
  @override
  Widget build(BuildContext context) {
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
            duration: Duration(seconds: 5),
            builder: (context, value, child) {
              int percentage = (value * 100).ceil();
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
                        "OO I OO",
                        style: TextStyle(fontSize: 25, color: kBlueColor),
                      ),
                      top: -75,
                      left: 55,
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
