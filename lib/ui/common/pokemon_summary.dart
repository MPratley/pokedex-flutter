import 'package:flutter/material.dart';
import 'package:pokedex_flutter/model/pokemon.dart';
import 'package:pokedex_flutter/ui/common/pokemon_type_chip.dart';

class PokemonSummary extends StatelessWidget {
  final Pokemon pokemon;
  PokemonSummary(this.pokemon);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        PokemonCard(pokemon),
        PokemonThumbnail(pokemon.id)
      ],
    );
  }
}

class PokemonThumbnail extends StatelessWidget {
  final int id;
  final String url;
  final String fileType;

  PokemonThumbnail(this.id, {this.url = "https://www.serebii.net/art/th/", this.fileType = ".png"});

  @override
  Widget build(BuildContext context) {
    final _imageSize = 92.0;
    return Hero(
      tag: 'pokemon-thumb-$id',
      child: Container(
      margin: EdgeInsets.symmetric(vertical: 16),
      alignment: FractionalOffset.center,
      child: Image.network(url + id.toString() + fileType),
      height: _imageSize,
      width: _imageSize,
    ),
    );
  }
}

class PokemonCard extends StatelessWidget {
  final Pokemon pokemon;
  PokemonCard(this.pokemon);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 124,
      width: double.infinity,
      child: Card(
        elevation: 2,
        margin: EdgeInsets.only(left: 46),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text(
              pokemon.name.toUpperCase(),
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.w600,
              ),
            ),
            Wrap(
              children: _getTypeChips(),
              spacing: 3,
            )
          ],
        ),
      ),
    );
  }

  List<Widget> _getTypeChips() {
    var widgetList = List<Widget>();
    for (var type in pokemon.types) {
      widgetList.add(PokemonTypeChip(type));
    }
    return widgetList;
  }
}