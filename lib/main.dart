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
Error lib/Models/task.dart : What is primary constructor ?  @@ just a handy syntax and it's called primary constructor
Error lib/WidgetItems/bottom_sheet_add_task.dart ::: I don't know how to resize the DatePicker's words (too small => big).  @@ try headline2

@Big
Error lib/WidgetItems/bottom_sheet_add_task.dart : The max line of the description doesn't work !
Error lib/WidgetItems/bottom_sheet_add_task.dart ::: Top border can't be occurred.
Error lib/WidgetItems/bottom_sheet_add_task.dart ::: how to set a floating action button on a notch from another screen.

@Small
Error lib/Database/firestore_utility.dart : How does this work without a class ?  @@ ok and search for static
Error lib/Database/firestore_utility.dart : Why it's not FirebaseFirestore ???  @@ok
Error lib/Components/task_item.dart : The attributes in the *task_item*, right or wrong (widget.title/description) ?  @@ ok
Error lib/Components/task_item.dart : Is it needed await/sync ?
Error lib/tools.dart : If I make the parameter have a function for onPressed, it will not work ? ifSolved => Delete(no or yes)
Error lib/WidgetItems/bottom_sheet_add_task.dart : How did I know (error){} as it's written just *Function* ?


Error lib/WidgetItems/bottom_sheet_add_task.dart : Can I use circularLoading(and make the user can't click on something during that time) instead of using the dialog(btw if I clicked a double click, it will add twice/triple/..) ?
Error lib/WidgetItems/bottom_sheet_add_task.dart : afterAdding doesn't work ?

Error lib/WidgetItems/bottom_sheet_add_task.dart : *LinearProgressIndicator()* doesn't work ?
Error lib/Tabs/tab_list.dart : .length is not working because of *var* and if I change it, it will cause an error ?
Error lib/Tabs/tab_list.dart : why ? ?
Error lib/Tabs/tab_list.dart : if / if else  cases?
Error lib/Tabs/tab_list.dart : RecyclerView advantage ?

Error lib/Components/task_item.dart : The slideable shape is not like the design ?

Error lib/Components/task_item.dart : dismissible => What type of key should I entered ?



*/