import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue.shade100),
        useMaterial3: true,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Cashy'),
          backgroundColor: Colors.purple.shade100,
        ),
        body: SafeArea(
            child: Container(
              margin: const EdgeInsets.only(
                left: 45.0, 
                top: 0, 
                right: 10.0, 
                bottom: 0
                ),
              padding: const EdgeInsets.only(
                left: 0,
                top: 50.0,
                right: 0,
                bottom: 10.0
              ),
          child : const Column(
            children: <Widget>[
                  Image(
                    image: AssetImage('assets/images/icons.png'),
                    height: 250,
                  ),
                  Text('Rich Together'),
                ],
              ),
            ),
        ),
      ),
    );
  }
}
