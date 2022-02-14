import 'dart:convert';

import 'package:http/http.dart' as http;

import 'pokemon.dart';

class Api {
  Future<Pokemon> fetchPokemon(int number) async {
    final response =
        await http.get(Uri.https('pokeapi.co', '/api/v2/pokemon/$number'));

    if (response.statusCode == 200) {
      return Pokemon.fromJson(jsonDecode(response.body));
    } else {
      return Future.error("Pokémon not Found!");
    }
  }
}
