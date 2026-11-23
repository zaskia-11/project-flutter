// import 'package:flutter/material.dart';

// class HomePage1 extends StatelessWidget {
//   const HomePage1({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Home Page"),
//       ),
//       body: SingleChildScrollView(
//         child: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               ElevatedButton(
//                 onPressed: () {
//                   Navigator.pushNamed(context, '/about');
//                 },
//                 child: const Text("About Page"),
//               ), 
//               SizedBox(height: 10),
//               ElevatedButton(
//                 onPressed: () {
//                   Navigator.pushNamed(context, '/container');
//                 },
//                 child: const Text("Container"),
//               ), 
//               SizedBox(height: 10),
//               ElevatedButton(
//                 onPressed: () {
//                   Navigator.pushNamed(context, '/latihan-satu');
//                 },
//                 child: const Text("Latihan Satu"),
//               ), 
//               SizedBox(height: 10),
//               ElevatedButton(
//                 onPressed: () {
//                   Navigator.pushNamed(context, '/colum-widget');
//                 },
//                 child: const Text("Column Widget"),
//               ), 
//               SizedBox(height: 10),
//               ElevatedButton(
//                 onPressed: () {
//                   Navigator.pushNamed(context, '/row-column-widget');
//                 },
//                 child: const Text("Row Column Widget"),
//               ), 
//               SizedBox(height: 10),
//               ElevatedButton(
//                 onPressed: () {
//                   Navigator.pushNamed(context, '/row-widget');
//                 },
//                 child: const Text("Row Widget"),
//               ), 
//               SizedBox(height: 10),
//               ElevatedButton(
//                 onPressed: () {
//                   Navigator.pushNamed(context, '/latihan-1');
//                 },
//                 child: const Text("Latihan 1 Row Column"),
//               ), 
//               SizedBox(height: 10),
//               ElevatedButton(
//                 onPressed: () {
//                   Navigator.pushNamed(context, '/latihan-dua');
//                 },
//                 child: const Text("Latihan 2 Row Column"),
//               ), 
//               SizedBox(height: 10),
        
//               ElevatedButton(
//                 onPressed: () {
//                   Navigator.pushNamed(context, '/sized-box-widget');
//                 },
//                 child: const Text("SizedBox Widget"),
//               ), 
//               SizedBox(height: 10),
//               ElevatedButton(
//                 onPressed: () {
//                   Navigator.pushNamed(context, '/expanded-widget');
//                 },
//                 child: const Text("Expanded Widget"),
//               ), 
//               SizedBox(height: 10),
//               ElevatedButton(
//                 onPressed: () {
//                   Navigator.pushNamed(context, '/stack-widget');
//                 },
//                 child: const Text("Stack Widget"),
//               ), 
//               SizedBox(height: 10),
//               ElevatedButton(
//                 onPressed: () {
//                   Navigator.pushNamed(context, '/layout-satu');
//                 },
//                 child: const Text("Layout Satu"),
//               ), 
//               SizedBox(height: 10),
//               ElevatedButton(
//                 onPressed: () {
//                   Navigator.pushNamed(context, '/layout-dua');
//                 },
//                 child: const Text("Layout Dua"),
//               ), 
//               SizedBox(height: 10),
//               ElevatedButton(
//                 onPressed: () {
//                   Navigator.pushNamed(context, '/layout-tiga');
//                 },
//                 child: const Text("Layout Tiga"),
//               ), 
//               SizedBox(height: 10),
//               ElevatedButton(
//                 onPressed: () {
//                   Navigator.pushNamed(context, '/layout-empat');
//                 },
//                 child: const Text("Layout Empat"),
//               ), 
//               SizedBox(height: 10),
//               ElevatedButton(
//                 onPressed: () {
//                   Navigator.pushNamed(context, '/latihan-tiga');
//                 },
//                 child: const Text("Latihan Tiga"),
//               ), 
//               SizedBox(height: 10),
//               ElevatedButton(
//                 onPressed: () {
//                   Navigator.pushNamed(context, '/latihan-empat');
//                 },
//                 child: const Text("Latihan Empat"),
//               ), 
//               SizedBox(height: 10),
        
//               ElevatedButton(
//                 onPressed: () {
//                   Navigator.pushNamed(context, '/list-basic');
//                 },
//                 child: const Text("List Basic"),
//               ), 
//               SizedBox(height: 10),   
//               ElevatedButton(
//                 onPressed: () {
//                   Navigator.pushNamed(context, '/list-view-builder');
//                 },
//                 child: const Text("ListView Builder"),
//               ), 
//               SizedBox(height: 10),
//               ElevatedButton(
//                 onPressed: () {
//                   Navigator.pushNamed(context, '/list-view-custom');
//                 },
//                 child: const Text("ListView Custom"),
//               ), 
//               SizedBox(height: 10),
//               ElevatedButton(
//                 onPressed: () {
//                   Navigator.pushNamed(context, '/list-view-horizontal');
//                 },
//                 child: const Text("ListView Horizontal"),
//               ), 
//               SizedBox(height: 10),
//               ElevatedButton(
//                 onPressed: () {
//                   Navigator.pushNamed(context, '/list-view-separated');
//                 },
//                 child: const Text("ListView Separated"),
//               ), 
//               SizedBox(height: 10),
//               ElevatedButton(
//                 onPressed: () {
//                   Navigator.pushNamed(context, '/grid-view');
//                 },
//                 child: const Text("GridView"),
//               ), 
//               SizedBox(height: 10),
//               ElevatedButton(
//                 onPressed: () {
//                   Navigator.pushNamed(context, '/grid-basic');
//                 },
//                 child: const Text("Grid Basic"),
//               ), 
//               SizedBox(height: 10),
//               ElevatedButton(
//                 onPressed: () {
//                   Navigator.pushNamed(context, '/grid-product');
//                 },
//                 child: const Text("Grid Product"),
//               ), 
//               SizedBox(height: 10),
//               ElevatedButton(
//                 onPressed: () {
//                   Navigator.pushNamed(context, '/article-list');
//                 },
//                 child: const Text("Article List"),
//               ), 
//               SizedBox(height: 10),
//                ElevatedButton(
//                 onPressed: () {
//                   Navigator.pushNamed(context, '/form-page');
//                 },
//                 child: const Text("Form Page"),
//               ),
//               SizedBox(height: 10),
//                ElevatedButton(
//                 onPressed: () {
//                   Navigator.pushNamed(context, '/input-form');
//                 },
//                 child: const Text("Input Form"),
//               ), SizedBox(height: 10),
//                ElevatedButton(
//                 onPressed: () {
//                   Navigator.pushNamed(context, '/tugas-form');
//                 },
//                 child: const Text("Tugas Form"),
//               ),
//               SizedBox(height: 10),
//                ElevatedButton(
//                 onPressed: () {
//                   Navigator.pushNamed(context, '/toko-elektronik');
//                 },
//                 child: const Text("Toko Elektronik"),
//               ),  
//               SizedBox(height: 10),
//                ElevatedButton(
//                 onPressed: () {
//                   Navigator.pushNamed(context, '/album');
//                 },
//                 child: const Text("Album"),
//               ),  
//               SizedBox(height: 10),
//                ElevatedButton(
//                 onPressed: () {
//                   Navigator.pushNamed(context, '/post-page');
//                 },
//                 child: const Text("Halaman Post"),
//               ), 
//                SizedBox(height: 10),
//                ElevatedButton(
//                 onPressed: () {
//                   Navigator.pushNamed(context, '/photo-page');
//                 },
//                 child: const Text("Halaman Photo"),
//               ),       
//             ],
//           ),
//         ),
//       )
//     );
//   }
// }

import 'package:flutter/material.dart';
import '../models/user_model.dart';
import '../services/auth_service.dart';
import 'login_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _auth = AuthService();
  late Future<UserModel> _futureUser;

  @override
  void initState() {
    super.initState();
    _futureUser = _auth.getUser();
  }

  Future<void> _logout() async {
    await _auth.logout();
    if (!mounted) return;
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (_) => const LoginPage()),
      (_) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        actions: [
          IconButton(onPressed: _logout, icon: const Icon(Icons.logout)),
        ],
      ),
      body: Center(
        child: FutureBuilder<UserModel>(
          future: _futureUser,
          builder: (context, snap) {
            if (snap.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            }
            if (snap.hasError) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(snap.error.toString()),
                  const SizedBox(height: 12),
                  ElevatedButton(
                    onPressed: _logout,
                    child: const Text('Kembali ke Login'),
                  ),
                ],
              );
            }
            final user = snap.data!;
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Halo, ${user.name}',
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                Text(user.email),
              ],
            );
          },
        ),
      ),
    );
  }
}