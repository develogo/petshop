import 'package:flutter/material.dart';


class CardDashboard extends StatefulWidget{

  String titulo;
  double quantidade;
  double preco;

  CardDashboard(this.titulo,this.quantidade,this.preco);

  @override
  _CardDashboardState createState() => _CardDashboardState();
}

class _CardDashboardState extends State<CardDashboard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){},

      child: Container(
        height: 100,
        width: 200,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius:
            BorderRadius.circular(10.0),
          ),
          elevation: 5,
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          widget.titulo,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.blueAccent
                          ),
                        ),
                        Row(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(right: 5),
                              child: Icon(
                                  Icons.pets,
                                size: 13,
                                color: Colors.deepOrangeAccent,
                              ),
                            ),
                            Text(
                              '${widget.quantidade}'
                            )
                          ],
                        )
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left:8.0,right: 10,top: 5,
                      bottom: 8),
                      child: Container(
                        height: 1,
                        color: Colors.black12,
                      ),
                    ),
                    Row(
                      children: <Widget>[
                        Text(
                          'Preço Uni: '
                        ),
                        Text(
                          '${widget.preco}'
                        )
                      ],
                    ),
                    SizedBox(height: 10,),
                    Row(
                      children: <Widget>[
                        Text(
                            'Preço Total: '
                        ),
                        Text(
                            '${(widget.preco* widget.quantidade)}'
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
