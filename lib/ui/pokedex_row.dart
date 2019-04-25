import 'package:flutter/material.dart';
import 'package:pokedex_flutter/model/pokemon.dart';
import 'package:pokedex_flutter/ui/common/pokemon_summary.dart';
import 'package:pokedex_flutter/ui/common/pokemon_type_chip.dart';

class PokedexRow extends StatelessWidget {
  final Future<Pokemon> pokemon;
  PokedexRow(this.pokemon);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(vertical: 16, horizontal: 24),
        height: 120,
        child: FutureBuilder<Pokemon>(
          future: pokemon,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return PokemonSummary(snapshot.data);
            } else {
              return CircularProgressIndicator();
            }
          },
        ));
  }
}