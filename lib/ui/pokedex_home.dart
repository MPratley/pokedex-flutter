import 'package:flutter/material.dart';
import 'package:pokedex_flutter/services/pokemon_services.dart';
import 'package:pokedex_flutter/ui/pokedex_row.dart';

class PokedexHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Pokédex"),
          centerTitle: true,
        ),
        body: Container(
          child: ListView.builder(
            itemCount: 800,
            itemBuilder: (context, index) {
              final idx = index + 1;
              print(idx.toString());
              return PokedexRow(getPokemon(id: idx.toString()));
            },
          ),
        )
        );
  }
}
