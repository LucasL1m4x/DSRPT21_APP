import 'dart:io';

import 'package:dsrpt21_app/screens/progress_screen.dart';
import 'package:flutter/material.dart';
import 'package:dsrpt21_app/services/linha_de_robos_service.dart';
import 'package:dsrpt21_app/models/linha_de_robos_model.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

const kBlueColor = Color.fromRGBO(16, 38, 228, .9);

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController nameC = TextEditingController();
  final TextEditingController numberC = TextEditingController();
  LinhaDeRobosModel linhaRobos = LinhaDeRobosModel();
  File _image;

  @override
  void initState() {
    super.initState();
  }

  Future getImage() async {
    final image = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      _image = image;
    });
  }

  createAlertDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("Selecione um esquema para poder continuar!"),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kBlueColor,
        title: Text("Criador de robôs"),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.only(top: 60, left: 40, right: 40),
        color: Colors.white,
        child: ListView(
          children: <Widget>[
            SizedBox(
              width: 128,
              height: 128,
              child: Image.asset("assets/robot.png"),
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              // autofocus: true,
              controller: nameC,
              keyboardType: TextInputType.name,
              decoration: InputDecoration(
                enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: kBlueColor)),
                labelText: "Nome dos robôs",
                labelStyle: TextStyle(
                  color: Colors.black38,
                  fontWeight: FontWeight.w400,
                  fontSize: 20,
                ),
              ),
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              // autofocus: true,
              controller: numberC,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: kBlueColor)),
                labelText: "Número de robôs",
                labelStyle: TextStyle(
                  color: Colors.black38,
                  fontWeight: FontWeight.w400,
                  fontSize: 20,
                ),
              ),
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              child: RaisedButton(
                color: kBlueColor,
                onPressed: () {
                  getImage();
                },
                child: Text("Escolher esquema de construção",
                    style: TextStyle(color: Colors.white)),
              ),
            ),
            SizedBox(
              height: 40,
              child: Text(
                  "O sistema só funcionará após a seleção do esquema de construção(imagem)"),
            ),
            Container(
              height: 60,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: kBlueColor,
                borderRadius: BorderRadius.all(
                  Radius.circular(5),
                ),
              ),
              child: SizedBox.expand(
                child: FlatButton(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "Começar",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 20,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                  onPressed: () {
                    int n = int.parse(numberC.text);
                    String caminho = _image.path;
                    setState(() {
                      linhaRobos = LinhaDeRobosModel(
                          nome: nameC.text,
                          numero: int.parse(numberC.text),
                          esquema: caminho,
                          statusProducao: 0);
                    });
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            ProgressScreen(nameC.text, n, caminho),
                      ),
                    );
                    LinhaDeRobosService().create(linhaRobos);
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
