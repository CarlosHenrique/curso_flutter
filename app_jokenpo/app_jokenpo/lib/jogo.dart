import 'dart:math';

import 'package:flutter/material.dart';

class Jogo extends StatefulWidget {
  @override
  _JogoState createState() => _JogoState();
}

class _JogoState extends State<Jogo> {
  var _imagemApp = AssetImage("images/padrao.png");
  var _mensagem = "Faça sua escolha: ";
  void _opcaoSelecionada(String escolhaUsuario) {
    var options = ["pedra", "papel", "tesoura"];
    var number = Random().nextInt(3);
    var escolhaJarvis = options[number];

    switch (escolhaJarvis) {
      case "pedra":
        setState(() {
          this._imagemApp = AssetImage("images/pedra.png");
        });
        break;
      case "papel":
        setState(() {
          this._imagemApp = AssetImage("images/papel.png");
        });
        break;
      case "tesoura":
        setState(() {
          this._imagemApp = AssetImage("images/tesoura.png");
        });
        break;
    }

    if ((escolhaUsuario == "pedra" && escolhaJarvis == "tesoura") ||
        (escolhaUsuario == "papel" && escolhaJarvis == "pedra") ||
        (escolhaUsuario == "tesoura" && escolhaJarvis == "papel")) {
      this._mensagem = "Uhuu!!! Você venceu!";
    } else if ((escolhaJarvis == "pedra" && escolhaUsuario == "tesoura") ||
        (escolhaJarvis == "papel" && escolhaUsuario == "pedra") ||
        (escolhaJarvis == "tesoura" && escolhaUsuario == "papel")) {
      this._mensagem = "Afff! Não foi dessa vez!";
    } else if (escolhaJarvis == escolhaUsuario) {
      this._mensagem = "Empateee! Tente de novo!!";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("JokenPo"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          //text
          Padding(
            padding: EdgeInsets.only(top: 32, bottom: 16),
            child: Text(
              "Jarvis escolheu:",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Image(
            image: this._imagemApp,
            height: 200,
          ),
          Padding(
            padding: EdgeInsets.only(top: 32, bottom: 16),
            child: Text(
              this._mensagem,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 50),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () => _opcaoSelecionada("pedra"),
                  child: Image.asset(
                    "images/pedra.png",
                    height: 100,
                  ),
                ),
                GestureDetector(
                  onTap: () => _opcaoSelecionada("papel"),
                  child: Image.asset(
                    "images/papel.png",
                    height: 100,
                  ),
                ),
                GestureDetector(
                  onTap: () => _opcaoSelecionada("tesoura"),
                  child: Image.asset(
                    "images/tesoura.png",
                    height: 100,
                  ),
                ),
              ],
            ),
          )

          //image
          // text result
          //linha 3 images
        ],
      ),
    );
  }
}
