import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:todos/my_theme.dart';
import 'package:todos/screens/home.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        HomeScreen.routeName: (context) => HomeScreen(),
      },
      initialRoute: HomeScreen.routeName,

      theme: MyTheme.lightTheme,
      //themeMode: Theme.,
    );
  }
}

/*
Error BS_AddTask : Top border can't be occurred.


*/