import 'package:flutter/material.dart';
import 'package:poke_api/view/poke_view.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp( const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: () => const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Poke Api',
        home: PokeView(),
      ),
    );
  }
}
