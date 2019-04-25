import 'package:flutter/material.dart';
import 'package:pokedex_flutter/model/pokemon.dart';

class PokemonTypeChip extends StatelessWidget {
  final PokemonType type;
  PokemonTypeChip(this.type);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: _getTypeColour(),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 3, vertical: 1),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              type.type.name,
              style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: Colors.white),
            )
          ],
        ),
      ),
    );
  }

  _getTypeColour() {
    switch (type.type.name) {
      case "normal":
        return Colors.grey;
      case "fire":
        return Colors.orange;
      case "fighting":
        return Colors.red;
      case "water":
        return Colors.blue;
      case "flying":
        return Colors.purple.shade200;
      case "grass":
        return Colors.green;
      case "poison":
        return Colors.deepPurple;
      case "electric":
        return Colors.yellow;
      case "ground":
        return Colors.brown;
      case "psychic":
        return Colors.pink;
      case "rock":
        return Colors.brown.shade700;
      case "ice":
        return Colors.lightBlue;
      case "bug":
        return Colors.green.shade700;
      case "dragon":
        return Colors.purple.shade700;
      case "ghost":
        return Colors.purple.shade600;
      case "dark":
        return Colors.brown.shade800;
      case "steel":
        return Colors.grey.shade700;
      case "fairy":
        return Colors.pink.shade700;
      case "???":
        return Colors.green;
      default:
        return Colors.grey;
    }
  }
}
