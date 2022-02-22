import 'dart:math';


import 'package:poke_api/dto/poke_dto.dart';

import '../model/pokemon.dart';

class PokeController {
  final model = PokeDto();

  Future<Pokemon> get pokemon => model.pokemon;

  loadPokemon() {
    model.fetchPokemon(Random().nextInt(1000));
  }
}
