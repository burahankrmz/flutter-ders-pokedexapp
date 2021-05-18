import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:pokedex/model/pokemon_detail.dart';

import 'pokedex.dart';

class PokemonList extends StatefulWidget {
  @override
  _PokemonListState createState() => _PokemonListState();
}

class _PokemonListState extends State<PokemonList> {
  String url =
      "https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/pokedex.json";
  Pokedex pokedex;
  Future<Pokedex> veri;

  Future<Pokedex> _pokemonlariGetir() async {
    var response = await http.get(Uri.parse(url));
    var decodedJson = json.decode(response.body);
    pokedex = Pokedex.fromJson(decodedJson);
    return pokedex;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    veri = _pokemonlariGetir();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pokedex"),
      ),
      body: OrientationBuilder(builder: (context, orientation) {
        if (orientation == Orientation.portrait) {
          return FutureBuilder(
            future: veri,
            builder: (context, AsyncSnapshot<Pokedex> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else if (snapshot.connectionState == ConnectionState.done) {
                return GridView.count(
                  crossAxisCount: 2,
                  children: snapshot.data.pokemon.map((poke) {
                    return InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) =>
                                PokemonDetail(pokemon: poke)));
                      },
                      child: Hero(
                        tag: poke.img,
                        child: Card(
                          elevation: 6,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Container(
                                  height: 150,
                                  width: 200,
                                  child: (poke.img != null)
                                      ? Image.network(
                                          poke.img,
                                          fit: BoxFit.contain,
                                          loadingBuilder: (context, child,
                                                  loadingProgress) =>
                                              (loadingProgress == null)
                                                  ? child
                                                  : CircularProgressIndicator(),
                                          errorBuilder: (context, error,
                                                  stackTrace) =>
                                              Image.asset("assets/loading.gif"),
                                        )
                                      : Image.asset("assets/loading.gif")),
                              Text(
                                poke.name,
                                style: TextStyle(
                                    fontSize: 22,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                );
              }
            },
          );
        } else {
          return FutureBuilder(
            future: veri,
            builder: (context, AsyncSnapshot<Pokedex> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else if (snapshot.connectionState == ConnectionState.done) {
                return GridView.extent(
                  maxCrossAxisExtent: 300,
                  children: snapshot.data.pokemon.map((poke) {
                    return InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) =>
                                PokemonDetail(pokemon: poke)));
                      },
                      child: Hero(
                        tag: poke.img,
                        child: Card(
                          elevation: 6,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Container(
                                  height: 150,
                                  width: 200,
                                  child: (poke.img != null)
                                      ? Image.network(
                                          poke.img,
                                          fit: BoxFit.contain,
                                          loadingBuilder: (context, child,
                                                  loadingProgress) =>
                                              (loadingProgress == null)
                                                  ? child
                                                  : CircularProgressIndicator(),
                                          errorBuilder: (context, error,
                                                  stackTrace) =>
                                              Image.asset("assets/loading.gif"),
                                        )
                                      : Image.asset("assets/loading.gif")),
                              Text(
                                poke.name,
                                style: TextStyle(
                                    fontSize: 22,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                );
              }
            },
          );
        }
      }),
    );
  }
}
