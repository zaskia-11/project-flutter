import 'package:flutter/material.dart';

class KartuDashboard extends StatelessWidget {
  const KartuDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        children: [
          Expanded(
            child: Container(
              height: 80,
              color: Colors.amber,
              alignment: Alignment.center,
              child: Text("Pemasukan"),
            )
           ),
            SizedBox(width: 10,),
          Expanded(
            child: Container(
              height: 80,
              color: const Color.fromARGB(255, 243, 33, 33),
              alignment: Alignment.center,
              child: Text('Pengeluaran'),
            )),
            SizedBox(width: 10,),
          Expanded(
            child: Container(
              height: 80,
              color: Colors.green,
              alignment: Alignment.center,
              child: Text('Saldo'),
            )), 
            
            ],),
    );
  }
}