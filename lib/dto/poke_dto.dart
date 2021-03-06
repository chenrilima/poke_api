import '../repositories/api.dart';
import '../model/pokemon.dart';

class PokeDto {
  Future<Pokemon> _pokemon;

  Future<Pokemon> get pokemon => _pokemon;

  fetchPokemon(int number) {
    _pokemon = Api().fetchPokemon(number);
  }
}
