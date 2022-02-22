import 'dart:math';

import 'package:flutter_test/flutter_test.dart';
import 'package:poke_api/dto/poke_model.dart';

void main() {
  test('Receiving all Pokémons', () {
    // preparation
    final model = PokeModel();

    // test - method
    model.fetchPokemon(Random().nextInt(1000));

    // expect
    expect(model.fetchPokemon(null), null); // estou esperando 1000 mas está vindo nullo
  });
}
