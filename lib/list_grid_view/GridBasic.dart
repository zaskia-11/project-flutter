import 'package:flutter/material.dart';

class Gridbasic extends StatelessWidget {
  Gridbasic({super.key});

  @override
  Widget build(BuildContext context) {
    // media query fungsinya untuk menentukan ketinggian dan kelebaran
    // dari Layout yang kita buat agar responsive
    var mediaQueryData = MediaQuery.of(context);
    final double widthScreen = mediaQueryData.size.width;
    final double heightScreen = mediaQueryData.size.width;

    return Container(
    );
  }
}