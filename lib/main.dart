import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:irrshed/screens/loginPage.dart';
import 'package:irrshed/screens/managerPage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const irrshed());
}

class irrshed extends StatefulWidget {
  const irrshed({Key? key}) : super(key: key);

  @override
  State<irrshed> createState() => _irrshetState();
}

class _irrshetState extends State<irrshed> {
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.lightGreen,
        primaryColor: Colors.green,
      ),
      home: loginPage(),
    );
  }
}
