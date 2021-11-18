import 'dart:math';

import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var resultado = 'Iniciar Jogo';
  var iniciar = 'Escolha uma opção abaixo para iniciar';
  var imageApp = AssetImage('imagens/int.png');
  var imageUsuario = AssetImage('imagens/int.png');
  var color = Colors.amber;
  var ganhaUsuario = 0;
  var ganhaCpu = 0;
  var falaCpu = 'Vamos Jogar?';
  var cont = 0;
  void opcaoSelecionadaUsuario(String escolhaDoUsuario) {
    var opcoes = ["pedra", "papel", "tesoura"];
    var numero = Random().nextInt(3);
    var escolhaApp = opcoes[numero];

    switch (escolhaApp) {
      case "pedra":
        setState(() {
          this.imageApp = AssetImage('imagens/pedra.png');
          this.imageUsuario = AssetImage('imagens/pedra.png');
        });
        break;
      case "papel":
        setState(() {
          this.imageApp = AssetImage('imagens/papel.png');
          this.imageUsuario = AssetImage('imagens/papel.png');
        });
        break;
      case "tesoura":
        setState(() {
          this.imageApp = AssetImage('imagens/tesoura.png');
          this.imageUsuario = AssetImage('imagens/tesoura.png');
        });
        break;
    }

    if (escolhaDoUsuario == "pedra") {
      setState(() {
        imageUsuario = AssetImage('imagens/pedra.png');
      });
    } else if (escolhaDoUsuario == "papel") {
      setState(() {
        imageUsuario = AssetImage('imagens/papel.png');
      });
    } else {
      setState(() {
        imageUsuario = AssetImage('imagens/tesoura.png');
      });
    }

    if ((escolhaDoUsuario == "pedra" && escolhaApp == "tesoura") ||
        (escolhaDoUsuario == "tesoura" && escolhaApp == "papel") ||
        (escolhaDoUsuario == "papel" && escolhaApp == "pedra")) {
      resultado = 'GANHOU';
      ganhaUsuario = ganhaUsuario + 1;

      var opcoesVenc = [
        "Pura Sorte",
        "Quero ver\n Repetir",
        "Cagada X2",
        "Pura\n sorte!!!",
        "Na proxima\n Perde"
      ];
      var numeroVenc = Random().nextInt(opcoesVenc.length);

      // ignore: unused_local_variable
      dynamic falaCpu1 = opcoesVenc[numeroVenc];

      falaCpu = falaCpu1;

      iniciar = 'Parabens!\n Jogue novamente!';
      color = Colors.green;
    } else if ((escolhaDoUsuario == "tesoura" && escolhaApp == "pedra") ||
        (escolhaDoUsuario == "papel" && escolhaApp == "tesoura") ||
        (escolhaDoUsuario == "pedra" && escolhaApp == "papel")) {
      resultado = 'PERDEU';
      iniciar = 'Que Triste!\n Jogue novamente!';
      ganhaCpu = ganhaCpu + 1;
      color = Colors.red;

      var opcoesPerd = [
        "Toma",
        "Toma!!",
        "Desista vá!!",
        "Huehuehue",
        "Te falta\n sorte!",
        "Perca\n de novo"
      ];
      var numeroPerd = Random().nextInt(opcoesPerd.length);

      // ignore: unused_local_variable
      dynamic falaCpu2 = opcoesPerd[numeroPerd];
      falaCpu = falaCpu2;
    } else {
      resultado = 'EMPATOU';
      iniciar = 'Jogue novamente!';
      color = Colors.orange;
      falaCpu = 'Joga de novo';
    }
    cont = cont + 1;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Joken Po'),
        centerTitle: true,
        backgroundColor: Colors.black38,
      ),
      body: Column(
        children: [
          Container(
            height: 3,
            color: Colors.lightGreen,
          ),
          Container(
            height: 195,
            decoration: BoxDecoration(
                color: Colors.lightGreen,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(150),
                    bottomRight: Radius.circular(150))),
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('imagens/pedra.png')),
                        borderRadius: BorderRadius.circular(30)),
                  ),
                  Column(
                    children: [
                      Container(
                        width: 65,
                        height: 60,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage('imagens/papel.png')),
                            borderRadius: BorderRadius.circular(30)),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(12, 10, 12, 0),
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.green[700],
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(20),
                                bottomLeft: Radius.circular(0),
                                bottomRight: Radius.circular(0),
                              )),
                          child: Column(
                            children: [
                              Container(
                                width: 95,
                                height: 95,
                                decoration: BoxDecoration(
                                    color: Colors.black12,
                                    image:
                                        DecorationImage(image: this.imageApp),
                                    borderRadius: BorderRadius.circular(50)),
                              ),
                              Padding(
                                padding: EdgeInsets.fromLTRB(0, 7, 0, 07),
                                child: Text(
                                  'CPU',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('imagens/tesoura.png')),
                        borderRadius: BorderRadius.circular(30)),
                  ),
                ],
              ),
            ),
          ),

          // PRIMEIRA PARTE

          Container(
            height: 75,
            decoration: BoxDecoration(
                color: Colors.green[700],
                borderRadius: BorderRadius.circular(20)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      height: 45,
                      width: 25,
                      decoration: BoxDecoration(
                          color: Colors.amber,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20),
                              bottomLeft: Radius.circular(20),
                              bottomRight: Radius.circular(20))),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                              height: 20,
                              decoration: BoxDecoration(
                                  color: Colors.orange,
                                  borderRadius: BorderRadius.circular(10)),
                              child: Center(
                                  child: Text(
                                'Jg',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ))),
                          Padding(
                            padding: EdgeInsets.fromLTRB(0, 0, 0, 6),
                            child: Text(
                              cont.toString(),
                              style: TextStyle(
                                  fontSize: 10, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 50,
                      width: 60,
                      decoration: BoxDecoration(
                          color: Colors.amber,
                          borderRadius: BorderRadius.circular(10)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                color: Colors.orange,
                                borderRadius: BorderRadius.circular(10)),
                            height: 20,
                            child: Center(
                              child: Text(
                                'Placar:',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 4,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                ganhaUsuario.toString(),
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text(
                                'X',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text(
                                ganhaCpu.toString(),
                                style: TextStyle(fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 5,
                          )
                        ],
                      ),
                    ),
                    Center(
                      child: Container(
                        width: 120,
                        height: 55,
                        decoration: BoxDecoration(
                            color: color,
                            borderRadius: BorderRadius.circular(10)),
                        padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                        child: Column(children: [
                          SizedBox(
                            height: 3,
                          ),
                          Text(
                            resultado,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                          SizedBox(
                            height: 3,
                          ),
                          Container(
                            width: 90,
                            child: Center(
                              child: Text(
                                iniciar,
                                textAlign: TextAlign.center,
                                style: TextStyle(fontSize: 10),
                              ),
                            ),
                          )
                        ]),
                      ),
                    ),
                    Container(
                      width: 80,
                      height: 55,
                      decoration: BoxDecoration(
                          color: Colors.amber,
                          borderRadius: BorderRadius.circular(10)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Center(
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.orange,
                                  borderRadius: BorderRadius.circular(10)),
                              width: double.infinity,
                              padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
                              child: Text(
                                'CPU: ',
                                textAlign: TextAlign.center,
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.fromLTRB(0, 0, 0, 8),
                            child: Center(
                                child: Text(falaCpu,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(fontSize: 11))),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),

          // TERCEIRA PARTE

          Container(
            decoration: BoxDecoration(
                color: Colors.lightGreen,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(150),
                    topRight: Radius.circular(150))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () => opcaoSelecionadaUsuario("pedra"),
                  child: Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                        border: Border.all(),
                        image: DecorationImage(
                            image: AssetImage('imagens/pedra.png')),
                        borderRadius: BorderRadius.circular(30)),
                  ),
                ),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(12, 0, 12, 10),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.green[700],
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(0),
                              topRight: Radius.circular(0),
                              bottomLeft: Radius.circular(20),
                              bottomRight: Radius.circular(20),
                            )),
                        child: Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.fromLTRB(0, 7, 0, 7),
                              child: Text(
                                'USUARIO',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                            Container(
                              width: 95,
                              height: 95,
                              decoration: BoxDecoration(
                                  color: Colors.black12,
                                  image:
                                      DecorationImage(image: this.imageUsuario),
                                  borderRadius: BorderRadius.circular(50)),
                            ),
                          ],
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () => opcaoSelecionadaUsuario("papel"),
                      child: Container(
                        width: 65,
                        height: 60,
                        decoration: BoxDecoration(
                            border: Border.all(),
                            image: DecorationImage(
                                image: AssetImage('imagens/papel.png')),
                            borderRadius: BorderRadius.circular(30)),
                      ),
                    ),
                  ],
                ),
                GestureDetector(
                  onTap: () => opcaoSelecionadaUsuario("tesoura"),
                  child: Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                        border: Border.all(),
                        image: DecorationImage(
                            image: AssetImage('imagens/tesoura.png')),
                        borderRadius: BorderRadius.circular(30)),
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 4,
            color: Colors.lightGreen,
          ),
        ],
      ),
    );
  }
}
