import 'package:flutter/material.dart';
import 'package:project_zaskia/row_colum/LatihanDua.dart';

class NavigatorWidget extends StatelessWidget {
  const NavigatorWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) {
                return Latihandua();
              },
            ),
          );
        }, 
        child: Text("List Basic")
        ),
      ],
    );
  }
}