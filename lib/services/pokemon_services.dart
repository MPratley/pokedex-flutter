import 'package:http/http.dart' as http;
import 'dart:async';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';


import 'package:pokedex_flutter/model/pokemon.dart';

String url = 'https://pokeapi.co/api/v2/pokemon';

// Future<List<Pokemon>> getSeveralPokemon() async {
//   final response = await http.get(url);
//   final pokemonListResponse = pokemonListFromJson(response.body);
//   List<Pokemon> pokemonList;
//   for (Result p in pokemonListResponse.results) {
//     pokemonList.add(await getPokemon(id: p.name));
//   }
//   return pokemonList;
// }

Future<List<Pokemon>> getSeveralPokemon({int start = 1, int length = 20}) async {
  var pokemonList = List<Pokemon>();
  for (int i = start; i <= length+start; i++) {
    pokemonList.add(await getPokemon(id: i.toString()));
  }
  return pokemonList;
}

List<Future<Pokemon>> getSeveralFuturePokemon({int start = 1, int length = 20}) {
  var pokemonList = List<Future<Pokemon>>();
  for (int i = start; i <= length+start; i++) {
    pokemonList.add(getPokemon(id: i.toString()));
  }
  return pokemonList;
}

Future<Pokemon> getPokemon({String id = "1"}) async {
  final response = await DefaultCacheManager().getSingleFile('https://pokeapi.co/api/v2/pokemon/$id');
  return pokemonFromJson(response.readAsStringSync());
}
