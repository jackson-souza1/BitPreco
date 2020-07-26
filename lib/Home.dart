import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';



class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  //TextEditingController _controllerBitcoin = TextEditingController();

  String _preco = "0";



  void _recuperarPreco() async {
  
    String url = "https://blockchain.info/ticker";
    http.Response response = await http.get(url);

    Map<String, dynamic> retorno = json.decode(response.body);
   // print("Retorno " + retorno["BRL"]["buy"].toString());
    String novoPreco = retorno["BRL"]["buy"].toString();

    setState(() {
      
      _preco = novoPreco;
      
      
    });
    

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("BitPreço")
      ),
      body: Container(
          padding: EdgeInsets.all(32),
          child: Center(
            child: Column(
              children: <Widget>[
                
                Image.asset("images/bitcoin.png",
                ),
                Padding(padding: EdgeInsets.only(top: 50, bottom: 30),
                child: Text(
                  "R\$ "+ _preco,
                  style: TextStyle(
                    fontSize: 35
                  ),
                )
                ),
                RaisedButton(
                  child: Text("Atualizar",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                     
                    ),
                    
                  ),
                  onPressed: _recuperarPreco,
                  color: Colors.orange,
                  padding: EdgeInsets.fromLTRB(30, 20, 30, 20),
                  

                  
                )
              ],
            ),
          ),
      ),
    );
  }
}