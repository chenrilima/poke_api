import 'dart:math';

import 'package:poke_api/poke_model.dart';

import 'pokemon.dart';

class PokeController {
  final model = PokeModel();

  Future<Pokemon> get pokemon => model.pokemon;

  loadPokemon() {
    model.fetchPokemon(Random().nextInt(1000));
  }
}
