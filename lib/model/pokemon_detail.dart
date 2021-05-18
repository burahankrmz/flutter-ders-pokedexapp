import 'package:flutter/material.dart';
import 'package:pokedex/model/pokedex.dart';

class PokemonDetail extends StatelessWidget {
  PokedexPokemon pokemon;

  PokemonDetail({this.pokemon});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepOrange,
      appBar: AppBar(
        elevation: 0,
        title: Text(
          pokemon.name,
          textAlign: TextAlign.center,
        ),
      ),
      body: OrientationBuilder(
        builder: (context, orientation) {
          if (orientation == Orientation.portrait) {
            return dikeyBody(context);
          } else {
            return yatayBody(context);
          }
        },
      ),
    );
  }

  Stack dikeyBody(BuildContext context) {
    return Stack(
      children: <Widget>[
        Positioned(
          height: MediaQuery.of(context).size.height * (2 / 3),
          width: MediaQuery.of(context).size.width - 20,
          left: 10,
          top: MediaQuery.of(context).size.height * 0.1,
          child: Card(
            elevation: 6,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                SizedBox(
                  height: 70,
                ),
                Text(
                  pokemon.name,
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
                Text(
                  "Height : " + pokemon.height,
                ),
                Text(
                  "Weight : " + pokemon.weight,
                ),
                Text(
                  "Types : ",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: pokemon.type
                      .map((tip) => Chip(
                          backgroundColor: Colors.orange,
                          label: Text(
                            tip,
                            style: TextStyle(color: Colors.white),
                          )))
                      .toList(),
                ),
                Text(
                  "Next Evolution : ",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: (pokemon.nextEvolution != null)
                      ? pokemon.nextEvolution
                          .map((evolution) => Chip(
                              backgroundColor: Colors.orange,
                              label: Text(
                                evolution.name,
                                style: TextStyle(color: Colors.white),
                              )))
                          .toList()
                      : [Text("Son Hali")],
                ),
                Text(
                  "Weakness : ",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: (pokemon.weaknesses != null)
                      ? pokemon.weaknesses
                          .map((weakness) => Chip(
                              backgroundColor: Colors.orange,
                              label: Text(
                                weakness,
                                style: TextStyle(color: Colors.white),
                              )))
                          .toList()
                      : [Text("Zayıflığı Yok")],
                ),
              ],
            ),
          ),
        ),
        Align(
          alignment: Alignment.topCenter,
          child: Hero(
            tag: pokemon.img,
            child: Container(
              width: 150,
              height: 150,
              child: Image.network(
                pokemon.img,
                fit: BoxFit.contain,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget yatayBody(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width - 20,
      height: MediaQuery.of(context).size.height * (3 / 4),
      margin: EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white),
        borderRadius: BorderRadius.circular(15),
        color: Colors.white,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Expanded(
            flex: 2,
            child: Hero(
              tag: pokemon.img,
              child: Container(
                width: 150,
                height: 150,
                child: Image.network(
                  pokemon.img,
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 4,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text(
                    pokemon.name,
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "Height : " + pokemon.height,
                  ),
                  Text(
                    "Weight : " + pokemon.weight,
                  ),
                  Text(
                    "Types : ",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: pokemon.type
                        .map((tip) => Chip(
                            backgroundColor: Colors.orange,
                            label: Text(
                              tip,
                              style: TextStyle(color: Colors.white),
                            )))
                        .toList(),
                  ),
                  Text(
                    "Next Evolution : ",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: (pokemon.nextEvolution != null)
                        ? pokemon.nextEvolution
                            .map((evolution) => Chip(
                                backgroundColor: Colors.orange,
                                label: Text(
                                  evolution.name,
                                  style: TextStyle(color: Colors.white),
                                )))
                            .toList()
                        : [Text("Son Hali")],
                  ),
                  Text(
                    "Weakness : ",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: (pokemon.weaknesses != null)
                        ? pokemon.weaknesses
                            .map((weakness) => Chip(
                                backgroundColor: Colors.orange,
                                label: Text(
                                  weakness,
                                  style: TextStyle(color: Colors.white),
                                )))
                            .toList()
                        : [Text("Zayıflığı Yok")],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
