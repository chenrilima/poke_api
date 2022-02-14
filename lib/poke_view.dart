import 'package:flutter/material.dart';
import 'package:poke_api/poke_controller.dart';

import 'pokemon.dart';

class PokeView extends StatefulWidget {
  const PokeView({Key key}) : super(key: key);

  @override
  _PokeViewState createState() => _PokeViewState();
}

class _PokeViewState extends State<PokeView> {
  final controller = PokeController();

  @override
  Widget build(BuildContext context) {
    return Material(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        FutureBuilder<Pokemon>(
          future: controller.pokemon,
          // ignore: missing_return
          builder: (context, snapshot) {
            if (snapshot.connectionState != ConnectionState.done) {
              return const CircularProgressIndicator();
            }
            if (snapshot.hasData) {
              return Column(
                children: [
                  Image.network(
                    snapshot.data.urlImage,
                    height: 200,
                    fit: BoxFit.cover,
                  ),
                  Text(
                    snapshot.data.nome,
                    style: const TextStyle(
                      fontSize: 25,
                      color: Colors.black,
                    ),
                  ),
                ],
              );
            } else if (snapshot.hasError) {
              return Text(snapshot.error,
                  style: const TextStyle(fontSize: 18, color: Colors.red));
            }
            return const SizedBox.shrink();
          },
        ),
        ElevatedButton(
            onPressed: () {
              setState(() {
                controller.loadPokemon();
              });
            },
            child: const Text('Load Pokémon'))
      ],
    ));
  }
}
