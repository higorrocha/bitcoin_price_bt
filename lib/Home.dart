import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  String _price = "0";

  void _recoverPrice() {

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff558e9f),
      body: Container(
        padding: EdgeInsets.all(32),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("images/bitImage.png"),
              Padding(
                  padding: EdgeInsets.only(top: 30, bottom: 30),
                  child: Text(
                    "R\$" + _price,
                    style: TextStyle(
                      fontSize: 35
                    ),
                  ),
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
                    padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20)
                  ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
