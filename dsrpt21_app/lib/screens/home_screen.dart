import 'package:dsrpt21_app/screens/progress_screen.dart';
import 'package:flutter/material.dart';
import 'package:dsrpt21_app/services/linha_de_robos_service.dart';
import 'package:dsrpt21_app/models/linha_de_robos_model.dart';

const kDefaultShadow = BoxShadow(
  offset: Offset(0, 15),
  blurRadius: 27,
  color: Colors.black12,
);
const kBlueColor = Color.fromRGBO(16, 38, 228, .9);

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
  }

  final TextEditingController nameC = TextEditingController();
  final TextEditingController numberC = TextEditingController();
  final TextEditingController esquemaC = TextEditingController();
  LinhaDeRobosModel linhaRobos = LinhaDeRobosModel();
  //LinhaDeRobosService serviceRobos = LinhaDeRobosService();
  @override
  Widget build(BuildContext context) {
    var dropdownValue;
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
            new DropdownButton<String>(
              value: dropdownValue,
              icon: Icon(
                Icons.arrow_downward,
                color: kBlueColor,
              ),
              iconSize: 24,
              elevation: 16,
              underline: Container(
                height: 1,
                color: kBlueColor,
              ),
              onChanged: (String newValue) {
                setState(() {
                  linhaRobos.esquema = newValue;
                });
              },
              items: <String>[
                '                                                         Esquema 1',
                '                                                         Esquema 2',
                '                                                         Esquema 3',
                '                                                         Esquema 4'
              ].map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            SizedBox(
              height: 40,
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
                    setState(() {
                      linhaRobos = LinhaDeRobosModel(
                          nome: nameC.text,
                          numero: int.parse(numberC.text),
                          esquema: esquemaC.text,
                          statusProducao: 0);
                    });
                    LinhaDeRobosService().create(linhaRobos);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProgressScreen(),
                      ),
                    );
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
