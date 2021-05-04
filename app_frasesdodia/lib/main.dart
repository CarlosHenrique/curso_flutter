import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Home(),
    debugShowCheckedModeBanner: false,
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var _frases = [
    "Enfrente os problemas e leve a melhor!",
    "Dê mais atenção ao que você tem de bom na sua vida.",
    "Para chegar ao topo, o que importa é começar!",
    "De nada adianta ter sonhos, se você não se empenhar em correr atrás.",
    "Preste atenção nas oportunidades que estão à sua frente!",
    "Positividade para começar o dia é colocar a sua fé em prática.",
    "Não deixe nada nem ninguém estragar o seu bom humor.",
    "Ontem já passou, é hora de planejar o futuro.",
  ];

  var _fraseGerada = "Clique abaixo para gerar uma nova frase!";

  void _gerarFrase() {
    var index = Random().nextInt(_frases.length);
    setState(() {
      _fraseGerada = _frases[index];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Daily Motivation"),
        backgroundColor: Color(0xFF00BFA6),
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(20),
          //width: double.infinity,

          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset("images/logo.png"),
              Container(
                padding: EdgeInsets.all(10),
                margin: EdgeInsets.all(15),
                decoration: BoxDecoration(
                    color: Color(0xff00BFA6),
                    borderRadius: BorderRadius.circular(20)),
                child: Text(
                  _fraseGerada,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 25, color: Colors.white),
                ),
              ),
              RaisedButton(
                child: Text(
                  "Nova frase",
                  style: TextStyle(
                      fontSize: 25,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
                color: Color(0xFF00BFA6),
                onPressed: _gerarFrase,
              )
            ],
          ),
        ),
      ),
    );
  }
}
