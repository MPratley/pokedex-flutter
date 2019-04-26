import 'package:flutter/material.dart';
import 'package:pokedex_flutter/model/pokemon.dart';
import 'package:pokedex_flutter/ui/common/pokemon_summary.dart';

class PokemonDetailPage extends StatelessWidget {
  final Pokemon pokemon;
  PokemonDetailPage(this.pokemon);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 30),
        child: Stack(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 60),
              child: ConstrainedBox(
                child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(45),
                            topRight: Radius.circular(45))),
                    child: Card(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[Text("I haven't gotten round to putting any data here yet")],),
                    )),
                constraints: BoxConstraints.expand(),
              ),
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: PokemonThumbnail(pokemon.id - 1),
                  flex: 1,
                ),
                Expanded(
                  child: PokemonThumbnail(pokemon.id),
                  flex: 6,
                ),
                Expanded(
                  child: PokemonThumbnail(pokemon.id + 1),
                  flex: 1,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
