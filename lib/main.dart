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
@Solved

@ After finishing
Error lib/Components/task_item.dart : dismissible => What type of key should I entered ?
Error lib/Components/task_item.dart : The attributes in the *task_item*, Comparing with the session ?
Error lib/WidgetItems/bottom_sheet_add_task.dart ::: Top border can't be occurred.

@Small
Error lib/dialog_messages.dart : update  function ? @@ أظبطها
Error lib/WidgetItems/bottom_sheet_add_task.dart : How did I know (error){} as it's written just *Function* ?
Error lib/WidgetItems/bottom_sheet_add_task.dart : The max line of the description doesn't work !
Error lib/Components/task_item.dart : Is it needed *Future<void> .. async{}* or it is fine if I just *void .. {}* ?
||
Error lib/Tabs/tab_list.dart : .length is not working because of *var* and if I change it, it will cause an error ?
Error lib/Tabs/tab_list.dart : why ? ?
Error lib/Tabs/tab_list.dart : if / if else  cases?
||
Error lib/WidgetItems/bottom_sheet_add_task.dart
 : *LinearProgressIndicator()* doesn't work ?
Error lib/WidgetItems/bottom_sheet_add_task.dart
 : Can I use circularLoading(and make the user can't click on something during that time) instead of using the dialog
 (btw if I clicked a double click, this will let the user have the ability to  add twice/triple/..) ?

Error lib/WidgetItems/bottom_sheet_add_task.dart : afterAdding doesn't work ?








*/