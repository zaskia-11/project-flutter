import 'package:flutter/material.dart';

class StackWidget extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: 200,
          height: 200,
          color: Colors.amber,
        ),
        Positioned(
          bottom: 10,
          right: 10,
          child: Icon(Icons.favorite, color: Colors.pink,)
          ),
          Positioned(
            top: 10,
            left: 10,
            child: Text("Label")),
            Positioned(
              right: 25,
              top: 25,
              left: 25,
              child: Container(color: const Color.fromARGB(255, 241, 193, 231), width: 100, height: 100,)
            ),
      ],
    );
  }
}