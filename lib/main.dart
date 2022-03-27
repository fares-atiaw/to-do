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
Error WidgetItems/bottom_sheet_add_task.dart ::: Top border can't be occurred.
Error WidgetItems/bottom_sheet_add_task.dart ::: I don't know how to resize the DatePicker's words (too small => big).
Error lib/Models/task.dart : What is primary constructor ?
Error lib/Database/firestore_utility.dart : How does this work without a class ?
Error lib/Database/firestore_utility.dart : Why it's not FirebaseFirestore ???
Error lib/WidgetItems/bottom_sheet_add_task.dart : Can I use circularLoading(and make the user can't click on something during that time) instead of using the dialog ?
Error lib/WidgetItems/bottom_sheet_add_task.dart : afterAdding doesn't work ?
Error lib/WidgetItems/bottom_sheet_add_task.dart : How did I know (error){} ?


*/