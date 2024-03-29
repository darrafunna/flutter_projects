import 'package:cozy_app/pages/splash_page.dart';
import 'package:cozy_app/providers/space_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashPage(),
    );
    // return ChangeNotifierProvider(
    //   create: (context) => SpaceProvider(),
    //   child: MaterialApp(
    //   debugShowCheckedModeBanner: false,
    //   home: SplashPage(),
    //   )
    // );
  }
}
