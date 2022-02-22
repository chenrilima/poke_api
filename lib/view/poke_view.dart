import 'package:flutter/material.dart';
import 'package:poke_api/controller/poke_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


import '../model/pokemon.dart';

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
                    height: 200.h,
                    fit: BoxFit.cover,
                  ),
                  Text(
                    snapshot.data.nome,
                    style:  TextStyle(
                      fontSize: 25.sp,
                      color: Colors.black,
                    ),
                  ),
                ],
              );
            } else if (snapshot.hasError) {
              return Text(snapshot.error,
                  style:  TextStyle(fontSize: 18.sp, color: Colors.red));
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
