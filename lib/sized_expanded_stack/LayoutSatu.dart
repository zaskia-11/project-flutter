import 'package:flutter/material.dart';

class KartuProfil extends StatelessWidget {
  const KartuProfil({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 72,
      padding: EdgeInsets.all(12),
      margin: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color:const Color.fromARGB(255, 236, 241, 193),
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.black,
            blurRadius: 6,
          ),
        ],
      ),
      child: Row(children: [
        SizedBox(
          width: 60,
          height: 60,
          child: CircleAvatar(
            // backgroundColor: Colors.amber),
            backgroundImage: NetworkImage("data:image/png;base64,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"),
          ),
        ),        
          SizedBox(width: 12,),
          Expanded(child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Zaskia Ramadhani Putri", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
              SizedBox(height: 4,),
              Text("XII RPL 1", style: TextStyle(fontSize: 12, color: Colors.grey),)
            ],
          ),
         ),
        ],
       ),
      )
    );
  }
}