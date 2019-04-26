import 'package:flutter/material.dart';
import 'package:pokedex_flutter/model/pokemon.dart';
import 'package:pokedex_flutter/ui/common/pokemon_summary.dart';
import 'package:pokedex_flutter/ui/common/pokemon_type_chip.dart';
import 'package:pokedex_flutter/ui/detail/pokemon_detail_page.dart';

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
              return GestureDetector(
                child: Hero(
                  tag: "pokemon-summary-hero-${snapshot.data.id}",
                  child: PokemonSummary(snapshot.data),
                ),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              PokemonDetailPage(snapshot.data)));
                },
              );
            } else {
              return Container(
                height: 96,
                width: 96,
                child: CircularProgressIndicator()
                );
            }
          },
        ));
  }
}
