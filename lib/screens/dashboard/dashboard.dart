import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:local_auth/local_auth.dart';
import 'package:petshop/screens/add/add-screen.dart';
import 'dart:async';

import 'package:petshop/screens/dashboard/components/card_dashboard.dart';





class DashBoard extends StatefulWidget {
  @override
  _DashBoardState createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {

  String url = 'http://apirest-pet.herokuapp.com/api/produtos';


  Future getData() async{
    try{
      Map<String, String> headers = {"Content-Type": "application/json"};
      http.Response response = await http.get(url, headers: headers);
      print(response);
      return json.decode(response.body);
      
    } catch(e){
      print(e);
    }

  }


  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getData(), // a previously-obtained Future<String> or null
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.none:
//            return Text('Press button to start.');
          case ConnectionState.active:
          case ConnectionState.waiting:
            return Scaffold(
                body: Container(
                    alignment: Alignment.center,
                    width: MediaQuery.of(context).size.width,
                    height:MediaQuery.of(context).size.height,
                    decoration: BoxDecoration(
                      gradient: new LinearGradient(
                        colors: [Color(0xff0072ce), Color(0xff0072ce)],
                        begin: const FractionalOffset(0.0, 0.0),
                        end: const FractionalOffset(1.0, 1.0),
                        stops: [0.0, 1.0],
                        tileMode: TileMode.clamp,
                      ),
                    ),
                    child: Container(
                        width: 50,
                        height: 50,
                        child: CircularProgressIndicator(
                          backgroundColor: Colors.white,
                        )
                    )
                )
            );
          case ConnectionState.done:
            if (snapshot.hasError)
              return Scaffold(
                  body: Container(
                      alignment: Alignment.center,
                      width: MediaQuery.of(context).size.width,
                      height:MediaQuery.of(context).size.height,
                      decoration: BoxDecoration(
                        gradient: new LinearGradient(
                          colors: [Color(0xff0072ce), Color(0xff0072ce)],
                          begin: const FractionalOffset(0.0, 0.0),
                          end: const FractionalOffset(1.0, 1.0),
                          stops: [0.0, 1.0],
                          tileMode: TileMode.clamp,
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          SizedBox(),
                          Container(
                            width: 200,
                            height: 80,
                            child: Image(
                              image: AssetImage("assets/images/logo.png"),
                            ),
                          ),
                          Container(
                              color: Colors.red,
                              width: MediaQuery.of(context).size.width,
                              height: 30,
                              child: Center(
                                child: Text(
                                  "Sem Internet!",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18
                                  ),
                                ),
                              )
                          )
                        ],

                      )
                  )
              );

            int nu = 0;

            var timeUpdate = new DateTime.now();
            var hour = timeUpdate.hour;
            var minute = timeUpdate.minute.toString().padLeft(2,'0');
            //var masc = MoneyMaskedTextController(thousandSeparator: ".",decimalSeparator: "", precision: 0);

            return Scaffold(
                appBar: new AppBar(
                  title: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image(
                      width: 50,
                      image: AssetImage('assets/images/logo.png'),
                    ),
                  ),
                  actions: <Widget>[
                    IconButton(
                      icon: Icon(Icons.refresh),
                      color: Colors.black87,
                      onPressed: () {
                        setState(() {
                          print('ola');
                        });
                      },
                    ),
                  ],
                  centerTitle: true,
                  backgroundColor: Colors.white,
                  elevation: 0,
                ),
                floatingActionButton: FloatingActionButton(
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> AddScreen()));
                  },
                  child: Icon(Icons.add) ,
                ),
                body: new Column(
                  children: <Widget>[
                    new Expanded(
                        child: new ListView.builder
                          (
                            itemCount: snapshot.data.length,
                            itemBuilder: (context,index) {

                              for(var i in snapshot.data){

                                String titulo = snapshot.data[nu]['nome'];
                                double quantidade = snapshot.data[nu]['quantidade'];


                                nu++;

                                return CardDashboard(titulo, quantidade,10);
                              }



                                return CardDashboard('ola', 2,20);
                            }
                        )
                    )
                  ],
                )
            );
        }
        return null; // unreachable
      },
    );
  }
}