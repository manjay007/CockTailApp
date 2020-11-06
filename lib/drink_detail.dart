import 'package:flutter/material.dart';
import 'package:fluttercocktail/main.dart';

class DrinkDetail extends StatelessWidget {
  final drink;

  const DrinkDetail({Key key, @required this.drink}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: [myColor, Colors.orange])),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: Text(drink["strDrink"]),
          elevation: 0.0,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Hero(
                tag: drink["idDrink"],
                child: CircleAvatar(
                  radius: 100,
                  backgroundImage: NetworkImage(drink["strDrinkThumb"] ??
                      "https://images.app.goo.gl/SXLygWe5xVGaKSKp9"),
                ),
              ),
              SizedBox(
                height: 30.0,
              ),
              Text(
                "ID: ${drink["idDrink"]}",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              SizedBox(
                height: 30.0,
              ),
              Text(
                "${drink["strDrink"]}",
                style: TextStyle(
                  fontSize: 22,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
