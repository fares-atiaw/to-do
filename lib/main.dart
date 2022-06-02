import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todos/my_theme.dart';
import 'package:todos/screens/home.dart';

import 'Provider/app_provider.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(ChangeNotifierProvider(
      create: (context) => AppProvider(), child: MyApp()));
}

class MyApp extends StatelessWidget {
  late AppProvider provider;
  late SharedPreferences prefs;
  late var modeType;

  @override
  Widget build(BuildContext context) {
    provider = Provider.of<AppProvider>(context);
    init_SharedPreferences();

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        HomeScreen.routeName: (context) => HomeScreen(),
      },
      initialRoute: HomeScreen.routeName,

      theme: MyTheme.lightTheme,
      darkTheme: MyTheme.darkTheme,
      themeMode: provider.themeMode,
      //themeMode: Theme.,
    );
  }

  void init_SharedPreferences() async {
    prefs = await SharedPreferences.getInstance();
    modeType = prefs.getString('themeString') ?? 'light';
    (modeType == 'light')
        ? modeType = ThemeMode.light
        : modeType = ThemeMode.dark;
    provider.changeThemeMode(mode: modeType);
  }
}

/*
@ After finishing
Error lib/Components/task_item.dart : dismissible => What type of key should I entered ? //DismissiblePane
Error lib/WidgetItems/bottom_sheet_add_task.dart ::: Top border can't be occurred.

@Small
Error lib/WidgetItems/bottom_sheet_add_task.dart : I can't read it, also how did I know (error){} as it's written just *Function*?
||
Error lib/Tabs/tab_list.dart : .length is not working because of *var* and if I change it, it will cause an error ?
Error lib/Tabs/tab_list.dart : why ? ?
Error lib/Tabs/tab_list.dart : if / if else  cases?
||
Error lib/WidgetItems/bottom_sheet_add_task.dart
 : *LinearProgressIndicator()* doesn't work ?





*/