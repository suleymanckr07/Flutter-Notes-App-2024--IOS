import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/custom/pages/login_register/login_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  
 /*  final user = FirebaseAuth.instance.currentUser!; */

void signOut() async {
  FirebaseAuth.instance.signOut();
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
      ),
      body: Center(
        child: Column(
          children: [
            const Text('Anasayfa'),
            const SizedBox(
              height: 50,
            ),
             /* Text('Kullanıcı Email adresi : ${user.email}'), */
             const SizedBox(
              height: 50,
            ), /* Text(' Email adresi : ${user.uid}'), */
             const SizedBox(
              height: 50,
            ),
            ElevatedButton(
              child: const Text('Çıkış yap'),
              onPressed: () {
                signOut();
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const LoginPage(),
                    ),
                    (route) => false);
              },
            )
          ],
        ),
      ),
    );
  }
}
