import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_application_1/note_app/models/note_data.dart';
import 'package:flutter_application_1/note_app/pages/home_page.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';
import 'package:flutter/material.dart';

void main() async {
  
  await Hive.initFlutter();
  await Hive.openBox('note_database');
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  ChangeNotifierProvider(create: (context) => NoteData(),
    builder: (context, child) => const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    ),);
  }
}
