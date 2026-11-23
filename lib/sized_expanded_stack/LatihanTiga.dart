import 'package:flutter/material.dart';

class Latihantiga extends StatelessWidget {
  const Latihantiga({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
              width: double.infinity,
              height: 70,
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [const Color.fromARGB(255, 194, 218, 238), const Color.fromARGB(255, 248, 200, 236)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(18),
                  bottomRight: Radius.circular(18),
                ),
              ),
              child: Row(children: [
            SizedBox(
              width: 50,
              height:50,
              child: CircleAvatar(
                radius: 40,
                // backgroundColor: Colors.amber),
                backgroundImage: const NetworkImage("https://cdn.vectorstock.com/i/500p/82/33/faceless-woman-placeholder-vector-24138233.jpg")),
            ),        
              SizedBox(width: 12,),
              Expanded(child: Column(
                crossAxisAlignment: CrossAxisAlignment.start, // Teks nama & kelas tetap rata kiri
               mainAxisSize: MainAxisSize.min,
                children: [
                  Text("Zaskia Ramadhani Putri", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: const Color.fromARGB(255, 255, 255, 255)),),
                  SizedBox(height: 1,),
                  Text("XII RPL 1", style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: const Color.fromARGB(255, 255, 255, 255)),),
                ],
              ),
             ),
             Expanded(child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Icon(Icons.notifications, color: const Color.fromARGB(255, 255, 255, 255),),
              ],
             ),
             ),
            ],
          ),     
           
        ),
        SizedBox(height: 10,),
        Container(
          width: double.infinity,
              height: 130,
              padding: EdgeInsets.all(15),
              margin: EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [const Color.fromARGB(255, 194, 218, 238), const Color.fromARGB(255, 248, 200, 236)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.all( Radius.circular(10),
                ),
              ),
              child: Row(children: [
            SizedBox(
              width: 5,),     
              Expanded(child: Column(
                crossAxisAlignment: CrossAxisAlignment.start, // Teks nama & kelas tetap rata kiri
              //  mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: 80,
                    height: 20,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 245, 237, 236),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text("Latihan 4", style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: const Color.fromARGB(255, 0, 0, 0)), textAlign: TextAlign.start, ),
                  ),
                  SizedBox(height: 3,),
                  Text("Belajar Flutter", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: const Color.fromARGB(255, 255, 255, 255)),),
                  SizedBox(height: 3,),
                  Text("Ayo Belajar Flutter sama Pak Candra", style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: const Color.fromARGB(255, 255, 255, 255)),),
                  SizedBox(height: 7,),
                  ElevatedButton(onPressed: () {}, child: Text("Follow"), style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 255, 255, 255),
                    foregroundColor: const Color.fromARGB(255, 0, 0, 0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  ),
                ],
              ),
             ),
             Expanded(child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Icon(Icons.notifications, color: const Color.fromARGB(255, 255, 255, 255),),
              ],
             ),
             ),
            ],
          ),           
        ),
      ],
    );
  }
}