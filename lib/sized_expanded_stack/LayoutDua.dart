import 'package:flutter/material.dart';

class Layoutdua extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: 100,
          height: 100,
          decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Icon(Icons.image, size: 60, color: Colors.white),
        ),
        Positioned(
          top: 8,
          left: 8,
          child: Container(
            padding: EdgeInsets.all(8),
            color: Colors.blue,
            child: Text("-20%"),
          ),
        ),
        Positioned(
          bottom: 8,
          right: 8,
          child: Icon(Icons.favorite_border, color: Colors.red)
        )
      ],
    );
  }
}