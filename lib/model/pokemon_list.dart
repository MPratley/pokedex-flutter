// To parse this JSON data, do
//
//     final pokemonList = pokemonListFromJson(jsonString);

import 'dart:convert';

PokemonList pokemonListFromJson(String str) => PokemonList.fromJson(json.decode(str));

String pokemonListToJson(PokemonList data) => json.encode(data.toJson());

class PokemonList {
    int count;
    String next;
    dynamic previous;
    List<Result> results;

    PokemonList({
        this.count,
        this.next,
        this.previous,
        this.results,
    });

    factory PokemonList.fromJson(Map<String, dynamic> json) => new PokemonList(
        count: json["count"],
        next: json["next"],
        previous: json["previous"],
        results: new List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "count": count,
        "next": next,
        "previous": previous,
        "results": new List<dynamic>.from(results.map((x) => x.toJson())),
    };
}

class Result {
    String name;
    String url;

    Result({
        this.name,
        this.url,
    });

    factory Result.fromJson(Map<String, dynamic> json) => new Result(
        name: json["name"],
        url: json["url"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "url": url,
    };
}
