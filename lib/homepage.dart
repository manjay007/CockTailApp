import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:fluttercocktail/drink_detail.dart';
import 'package:fluttercocktail/main.dart';
import 'package:http/http.dart' as http;

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  var api = "https://www.thecocktaildb.com/api/json/v1/1/filter.php?c=Cocktail";
  var res, drinks;

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  fetchData() async {
    res = await http.get(api);
    drinks = jsonDecode(res.body)["drinks"];
    print(drinks.toString());
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: [myColor, Colors.orange])),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: Center(child: Text("Cocktail App")),
          elevation: 0.0,
        ),
        body: Center(
            child: res != null
                ? ListView.builder(
                    itemCount: drinks.length,
                    itemBuilder: (context, index) {
                      var drink = drinks[index];
                      return ListTile(
                        leading: Hero(
                          tag: drink["idDrink"],
                          child: CircleAvatar(
                            backgroundImage:
                                NetworkImage(drink["strDrinkThumb"]),
                          ),
                        ),
                        title: Text(
                          "${drink["strDrink"]}",
                          style: TextStyle(
                            fontSize: 22,
                            color: Colors.white,
                          ),
                        ),
                        subtitle: Text(
                          "${drink["idDrink"]}",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DrinkDetail(
                                        drink: drink,
                                      )));
                        },
                      );
                    })
                : CircularProgressIndicator(
                    backgroundColor: Colors.white,
                  )),
      ),
    );
  }
}
