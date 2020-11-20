import 'package:dsrpt21_app/services/linha_de_robos_service.dart';
import 'package:flutter/material.dart';
import 'package:dsrpt21_app/models/linha_de_robos_model.dart';

const kBlueColor = Color.fromRGBO(16, 38, 228, .9);

final TextEditingController profissaoC = TextEditingController();
LinhaDeRobosModel linhaRobos = LinhaDeRobosModel();

class FinalScreen extends StatefulWidget {
  final String nameC, caminho;
  final int n;
  FinalScreen(this.nameC, this.n, this.caminho);
  @override
  _FinalScreenState createState() => _FinalScreenState();
}

createAlertDialog(BuildContext context, String nameC, int n, String profissaoC,
    List<String> lista) {
  return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Robôs construídos com sucesso"),
          content: Text(
              "Nome dos robôs: ${nameC} \n\nNúmero de robôs construídos: ${n} \n\nProfissão dos robôs: ${profissaoC}\n\nHabilidades escolhidas: \n${lista.toString()}"),
        );
      });
}

class _FinalScreenState extends State<FinalScreen> {
  bool carac1 = false, carac2 = false, carac3 = false, carac4 = false;
  List<String> lista = List();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Personalização dos robôs"),
        centerTitle: true,
        backgroundColor: kBlueColor,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(top: 20, left: 15, right: 10),
              child: Text(
                "Nome da linha de robôs: ${widget.nameC}\nNúmero de robôs: ${widget.n}\nStatus da produção: 75%",
                style: TextStyle(fontSize: 17),
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 40, left: 30, right: 30),
              child: TextFormField(
                // autofocus: true,
                controller: profissaoC,
                keyboardType: TextInputType.name,
                decoration: InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: kBlueColor)),
                  labelText: "Profissão dos robôs",
                  labelStyle: TextStyle(
                    color: Colors.black38,
                    fontWeight: FontWeight.w400,
                    fontSize: 20,
                  ),
                ),
                style: TextStyle(fontSize: 20),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              padding: EdgeInsets.only(left: 15, right: 10),
              child: CheckboxListTile(
                  value: carac1,
                  title: Text(
                    "Habilidade com armas",
                    style: TextStyle(fontSize: 15.0),
                  ),
                  subtitle: Text("Armas brancas e de fogo"),
                  activeColor: kBlueColor,
                  onChanged: (bool valor) {
                    setState(() {
                      carac1 = valor;
                      lista.add('Habilidade com armas');
                    });
                  }),
            ),
            Container(
              padding: EdgeInsets.only(left: 15, right: 10),
              child: CheckboxListTile(
                  value: carac2,
                  title: Text(
                    "Habilidade em dirigir veículos",
                    style: TextStyle(fontSize: 15.0),
                  ),
                  subtitle: Text("Terrestres, aéreos e aquáticos"),
                  activeColor: kBlueColor,
                  onChanged: (bool valor) {
                    setState(() {
                      carac2 = valor;
                      lista.add('Habilidade em dirigir veículos');
                    });
                  }),
            ),
            Container(
              padding: EdgeInsets.only(left: 15, right: 10),
              child: CheckboxListTile(
                  value: carac3,
                  title: Text(
                    "Consciência aprimorada",
                    style: TextStyle(fontSize: 15.0),
                  ),
                  subtitle: Text("Capacidade de reflexão e sentimento"),
                  activeColor: kBlueColor,
                  onChanged: (bool valor) {
                    setState(() {
                      carac3 = valor;
                      lista.add('Consciência aprimorada');
                    });
                  }),
            ),
            Container(
              padding: EdgeInsets.only(left: 15, right: 10),
              child: CheckboxListTile(
                  value: carac4,
                  title: Text(
                    "Capacidade de estudo aprimorada",
                    style: TextStyle(fontSize: 15.0),
                  ),
                  subtitle: Text(
                      "Adiquire todo o conhecimento sobre a profissão escolhida"),
                  activeColor: kBlueColor,
                  onChanged: (bool valor) {
                    setState(() {
                      carac4 = valor;
                      lista.add('Capacidade de estudo aprimorada');
                    });
                  }),
            ),
            SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Container(
                height: 60,
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
                          "Finalizar robôs",
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
                            nome: widget.nameC,
                            numero: widget.n,
                            esquema: widget.caminho,
                            caracteristicas: lista,
                            profissao: profissaoC.text,
                            statusProducao: 100.0,
                            id: 1);
                      });
                      LinhaDeRobosService().update(linhaRobos);
                      createAlertDialog(context, widget.nameC, widget.n,
                          profissaoC.text, lista);
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
