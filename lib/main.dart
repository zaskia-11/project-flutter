import 'package:flutter/material.dart';
import 'package:project_zaskia/routes/app_routes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: AppRoutes.routes(),
      // home: Scaffold(
        // appBar: AppBar(
        //   title: Text("Flutter App"),
        //   backgroundColor: const Color.fromARGB(255, 241, 188, 206),
        //   centerTitle: true,
        // ), 
        //  body: GridProductPage(),

      // ), //Scaffold
    ); //MaterialApp
  }
}

class HelloWidget extends StatelessWidget {
  const new({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
     child: Text("Hello, Flutter!", style: TextStyle(
       fontSize: 24,
       fontWeight: FontWeight.bold,
       color: const Color.fromARGB(255, 2, 244, 196),
       backgroundColor: Colors.black ,
     )),
    );
  }
}