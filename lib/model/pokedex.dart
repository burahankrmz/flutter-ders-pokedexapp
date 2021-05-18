class PokedexPokemonNextEvolution {
  String theNum;
  String name;

  PokedexPokemonNextEvolution({
    this.theNum,
    this.name,
  });
  PokedexPokemonNextEvolution.fromJson(Map<String, dynamic> json) {
    theNum = json["num"]?.toString();
    name = json["name"]?.toString();
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data["num"] = theNum;
    data["name"] = name;
    return data;
  }
}

class PokedexPokemon {
  int id;
  String theNum;
  String name;
  String img;
  List<String> type;
  String height;
  String weight;
  String candy;
  int candyCount;
  String egg;
  double spawnChance;
  int avgSpawns;
  String spawnTime;
  List<double> multipliers;
  List<String> weaknesses;
  List<PokedexPokemonNextEvolution> nextEvolution;

  PokedexPokemon({
    this.id,
    this.theNum,
    this.name,
    this.img,
    this.type,
    this.height,
    this.weight,
    this.candy,
    this.candyCount,
    this.egg,
    this.spawnChance,
    this.avgSpawns,
    this.spawnTime,
    this.multipliers,
    this.weaknesses,
    this.nextEvolution,
  });
  PokedexPokemon.fromJson(Map<String, dynamic> json) {
    id = json["id"]?.toInt();
    theNum = json["num"]?.toString();
    name = json["name"]?.toString();
    img = json["img"]?.toString();
  if (json["type"] != null) {
  var v = json["type"];
  var arr0 = List<String>();
  v.forEach((v) {
  arr0.add(v.toString());
  });
    type = arr0;
    }
    height = json["height"]?.toString();
    weight = json["weight"]?.toString();
    candy = json["candy"]?.toString();
    candyCount = json["candy_count"]?.toInt();
    egg = json["egg"]?.toString();
    spawnChance = json["spawn_chance"]?.toDouble();
    avgSpawns = json["avg_spawns"]?.toInt();
    spawnTime = json["spawn_time"]?.toString();
  if (json["multipliers"] != null) {
  var v = json["multipliers"];
  var arr0 = List<double>();
  v.forEach((v) {
  arr0.add(v.toDouble());
  });
    multipliers = arr0;
    }
  if (json["weaknesses"] != null) {
  var v = json["weaknesses"];
  var arr0 = List<String>();
  v.forEach((v) {
  arr0.add(v.toString());
  });
    weaknesses = arr0;
    }
  if (json["next_evolution"] != null) {
  var v = json["next_evolution"];
  var arr0 = List<PokedexPokemonNextEvolution>();
  v.forEach((v) {
  arr0.add(PokedexPokemonNextEvolution.fromJson(v));
  });
    nextEvolution = arr0;
    }
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data["id"] = id;
    data["num"] = theNum;
    data["name"] = name;
    data["img"] = img;
    if (type != null) {
      var v = type;
      var arr0 = List();
  v.forEach((v) {
  arr0.add(v);
  });
      data["type"] = arr0;
    }
    data["height"] = height;
    data["weight"] = weight;
    data["candy"] = candy;
    data["candy_count"] = candyCount;
    data["egg"] = egg;
    data["spawn_chance"] = spawnChance;
    data["avg_spawns"] = avgSpawns;
    data["spawn_time"] = spawnTime;
    if (multipliers != null) {
      var v = multipliers;
      var arr0 = List();
  v.forEach((v) {
  arr0.add(v);
  });
      data["multipliers"] = arr0;
    }
    if (weaknesses != null) {
      var v = weaknesses;
      var arr0 = List();
  v.forEach((v) {
  arr0.add(v);
  });
      data["weaknesses"] = arr0;
    }
    if (nextEvolution != null) {
      var v = nextEvolution;
      var arr0 = List();
  v.forEach((v) {
  arr0.add(v.toJson());
  });
      data["next_evolution"] = arr0;
    }
    return data;
  }
}

class Pokedex {
  List<PokedexPokemon> pokemon;

  Pokedex({
    this.pokemon,
  });
  Pokedex.fromJson(Map<String, dynamic> json) {
  if (json["pokemon"] != null) {
  var v = json["pokemon"];
  var arr0 = List<PokedexPokemon>();
  v.forEach((v) {
  arr0.add(PokedexPokemon.fromJson(v));
  });
    pokemon = arr0;
    }
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (pokemon != null) {
      var v = pokemon;
      var arr0 = List();
  v.forEach((v) {
  arr0.add(v.toJson());
  });
      data["pokemon"] = arr0;
    }
    return data;
  }
}
