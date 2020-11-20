import 'package:dsrpt21_app/screens/home_screen.dart';
import 'package:dsrpt21_app/services/linha_de_robos_service.dart';
import 'package:flutter/material.dart';
import 'package:dsrpt21_app/screens/final_screen.dart';

const DOIS_PI = 3.14 * 2;
const kBlueColor = Color.fromRGBO(16, 38, 228, .9);

class ProgressScreen extends StatefulWidget {
  final String nameC, caminho;
  final int n;
  ProgressScreen(this.nameC, this.n, this.caminho);

  num get price => null;
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
          title: Text("Construíndo robo..."),
        ),
        body: Center(
          child: TweenAnimationBuilder(
            tween: Tween(begin: 0.0, end: 1.0),
            duration: Duration(seconds: 5 * widget.n),
            onEnd: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      FinalScreen(widget.nameC, widget.n, widget.caminho),
                ),
              );
            },
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
                        "Linha ${widget.nameC} de ${widget.n} robôs, \n            sendo feita",
                        style: TextStyle(fontSize: 25, color: kBlueColor),
                      ),
                      top: -75,
                      left: -40,
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
