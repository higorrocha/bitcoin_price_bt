import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  String _priceBRL = "0";
  String _priceEUR = "0";
  String _priceUSA = "0";

  void _recoverPrice() async {
    //String url = "https://blockchain.info/ticker";
    Uri url = Uri.parse("https://blockchain.info/ticker");
    http.Response response = await http.get(url);

    Map<String, dynamic> retorn = json.decode(response.body);
    setState(() {
      _priceBRL = retorn["BRL"]["buy"].toString();
      _priceEUR = retorn["EUR"]["buy"].toString();
      _priceUSA = retorn["USD"]["buy"].toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff558e9f),
      body: Container(
        padding: EdgeInsets.all(15),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("images/bitImage.png"),
              Padding(
                  padding: EdgeInsets.only(top: 10, bottom: 10),
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 3),
                        child: Text(
                          "R\$ " + _priceBRL,
                          style: TextStyle(
                              fontSize: 20
                          ),
                        ),
                      ),
                      Padding(
                          padding: EdgeInsets.only(top: 3),
                        child: Text(
                          "€ " + _priceEUR,
                          style: TextStyle(
                              fontSize: 20
                          ),
                        ),
                      ),
                      Padding(
                          padding: EdgeInsets.only(top: 3),
                        child: Text(
                          "\$ " + _priceUSA,
                          style: TextStyle(
                              fontSize: 20
                          ),
                        ),
                      )
                    ],
                  )
              ),
              ElevatedButton(
                  onPressed: _recoverPrice,
                  child: Text(
                    "Reload",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xff0d1b36),
                    padding: EdgeInsets.symmetric(horizontal: 25, vertical: 10)
                  ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
