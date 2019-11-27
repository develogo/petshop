import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;


class AddScreen extends StatefulWidget {
  @override
  _AddScreenState createState() => _AddScreenState();
}

TextEditingController nomeController = new TextEditingController();
TextEditingController quantidadeController = new TextEditingController();
TextEditingController valorController = new TextEditingController();

String url = 'http://apirest-pet.herokuapp.com/api/produto';


Future getData() async{

    Map<String, String> headers = {"Content-Type": "application/json"};
    String jsonn = '{"nome": "Teste2", "quantidade": 10, "valor" : 10}';
    http.Response response = await http.post(url, headers: headers,body: jsonn);
    print(response);
    return json.decode(response.body);

}

class _AddScreenState extends State<AddScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height:MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            gradient: new LinearGradient(
              colors: [Color(0xFF03A9F4), Color(0xFF01579B)],
              begin: const FractionalOffset(0.0, 0.0),
              end: const FractionalOffset(1.0, 1.0),
              stops: [0.0, 1.0],
              tileMode: TileMode.clamp,
            ),
          ),
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: 75.0),
                child: new Image(
                  width: 90.0,
                  height: 90.0,
                  fit: BoxFit.fill,
                  image: new AssetImage('assets/images/logo.png'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top:50.0),
                child: Container(
                  width: 314.0,
                  height: 50.0,
                  decoration: BoxDecoration(
                    color: Color(0x552B2B2B),
                    borderRadius: BorderRadius.all(Radius.circular(25.0)),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "Dados do Cliente",
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontFamily: 'WorkSansSemiBold',
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 23.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Card(
                      elevation: 2.0,
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: Container(
                        margin: EdgeInsets.all(0),
                        width: 400,
                        height: 200,
                        child: Column(
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.only(
                                  top: 20.0, bottom: 5.0, left: 25.0, right: 25.0),
                              child: TextField(
                                //focusNode: myFocusNodeEmailLogin,
                                controller: nomeController,
                                enabled: true,
                                keyboardType: TextInputType.text,
                                style: TextStyle(
                                    fontFamily: "WorkSansSemiBold",
                                    fontSize: 16.0,
                                    color: Colors.black),
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  icon: Icon(
                                    FontAwesomeIcons.user,
                                    color: Colors.black,
                                    size: 22.0,
                                  ),
                                  hintText: "Nome",
                                  hintStyle: TextStyle(
                                      fontFamily: "WorkSansSemiBold", fontSize: 17.0),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  top: 5.0, bottom: 5.0, left: 25.0, right: 25.0),
                              child: TextField(
                                //focusNode: myFocusNodeEmailLogin,
                                controller: quantidadeController,
                                enabled: true,
                                keyboardType: TextInputType.number,
                                style: TextStyle(
                                    fontFamily: "WorkSansSemiBold",
                                    fontSize: 16.0,
                                    color: Colors.black),
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  icon: Icon(
                                    FontAwesomeIcons.monument,
                                    color: Colors.black,
                                    size: 22.0,
                                  ),
                                  hintText: "Quantidade",
                                  hintStyle: TextStyle(
                                      fontFamily: "WorkSansSemiBold", fontSize: 17.0),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  top: 5.0, bottom: 5.0, left: 25.0, right: 25.0),
                              child: TextField(
                                //focusNode: myFocusNodeEmailLogin,
                                controller: valorController,
                                enabled: true,
                                keyboardType: TextInputType.number,
                                style: TextStyle(
                                    fontFamily: "WorkSansSemiBold",
                                    fontSize: 16.0,
                                    color: Colors.black),
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  icon: Icon(
                                    FontAwesomeIcons.moneyBill,
                                    color: Colors.black,
                                    size: 22.0,
                                  ),
                                  hintText: "Valor",
                                  hintStyle: TextStyle(
                                      fontFamily: "WorkSansSemiBold", fontSize: 17.0),
                                ),
                              ),
                            ),

                          ],
                        ),
                      ),
                    ),
                    MaterialButton(
                      highlightColor: Colors.transparent,
                      splashColor: Color(0xFF01579B),
                      child: Padding(
                        padding:
                        const EdgeInsets.symmetric(
                            vertical: 10.0,
                            horizontal: 42.0),
                        child: Text(
                          "Entrar",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 25.0,
                              fontFamily: "WorkSansBold"),
                        ),
                      ),
                      onPressed: (){
                        getData();
                      },
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
