import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Page"),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/about');
                },
                child: const Text("About Page"),
              ), 
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/container');
                },
                child: const Text("Container"),
              ), 
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/latihan-satu');
                },
                child: const Text("Latihan Satu"),
              ), 
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/colum-widget');
                },
                child: const Text("Column Widget"),
              ), 
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/row-column-widget');
                },
                child: const Text("Row Column Widget"),
              ), 
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/row-widget');
                },
                child: const Text("Row Widget"),
              ), 
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/latihan-1');
                },
                child: const Text("Latihan 1 Row Column"),
              ), 
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/latihan-dua');
                },
                child: const Text("Latihan 2 Row Column"),
              ), 
              SizedBox(height: 10),
        
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/sized-box-widget');
                },
                child: const Text("SizedBox Widget"),
              ), 
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/expanded-widget');
                },
                child: const Text("Expanded Widget"),
              ), 
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/stack-widget');
                },
                child: const Text("Stack Widget"),
              ), 
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/layout-satu');
                },
                child: const Text("Layout Satu"),
              ), 
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/layout-dua');
                },
                child: const Text("Layout Dua"),
              ), 
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/layout-tiga');
                },
                child: const Text("Layout Tiga"),
              ), 
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/layout-empat');
                },
                child: const Text("Layout Empat"),
              ), 
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/latihan-tiga');
                },
                child: const Text("Latihan Tiga"),
              ), 
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/latihan-empat');
                },
                child: const Text("Latihan Empat"),
              ), 
              SizedBox(height: 10),
        
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/list-basic');
                },
                child: const Text("List Basic"),
              ), 
              SizedBox(height: 10),   
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/list-view-builder');
                },
                child: const Text("ListView Builder"),
              ), 
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/list-view-custom');
                },
                child: const Text("ListView Custom"),
              ), 
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/list-view-horizontal');
                },
                child: const Text("ListView Horizontal"),
              ), 
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/list-view-separated');
                },
                child: const Text("ListView Separated"),
              ), 
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/grid-view');
                },
                child: const Text("GridView"),
              ), 
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/grid-basic');
                },
                child: const Text("Grid Basic"),
              ), 
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/grid-product');
                },
                child: const Text("Grid Product"),
              ), 
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/article-list');
                },
                child: const Text("Article List"),
              ), 
              SizedBox(height: 10),
               ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/form-page');
                },
                child: const Text("Form Page"),
              ),
              SizedBox(height: 10),
               ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/input-form');
                },
                child: const Text("Input Form"),
              ), SizedBox(height: 10),
               ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/tugas-form');
                },
                child: const Text("Tugas Form"),
              ),
              SizedBox(height: 10),
               ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/toko-elektronik');
                },
                child: const Text("Toko Elektronik"),
              ),  
              SizedBox(height: 10),
               ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/album');
                },
                child: const Text("Album"),
              ),  
              SizedBox(height: 10),
               ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/post-page');
                },
                child: const Text("Halaman Post"),
              ), 
               SizedBox(height: 10),
               ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/photo-page');
                },
                child: const Text("Halaman Photo"),
              ),       
            ],
          ),
        ),
      )
    );
  }
}