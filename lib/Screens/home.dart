import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:todos/tabs/tab_list.dart';

import '../WidgetItems/bottom_sheet_add_task.dart';
import '../tabs/tab_settings.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;
  double myNotch = 8;
  List<Widget> tabs = [ListTab(), SettingsTab()];

  @override
  void initState() {
    super.initState();
    initialization();
  }

  void initialization() async {
    await Future.delayed(const Duration(milliseconds: 500));
    print('go!');
    FlutterNativeSplash.remove();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'To Do App',
          style: Theme.of(context).textTheme.headline1?.copyWith(fontSize: 20),
        ),
      ),
      body: tabs[currentIndex],
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: myNotch,
        elevation: 0,
        child: BottomNavigationBar(
          currentIndex: currentIndex,
          onTap: (i) {
            currentIndex = i;
            (currentIndex == 0) ? myNotch = 8 : myNotch = 36;
            setState(() {});
          },
          elevation: 0,
          backgroundColor: Colors.transparent,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.list), label: 'Tasks'),
            BottomNavigationBarItem(
                icon: Icon(Icons.settings), label: 'Settings'),
          ],
          showSelectedLabels: false,
          showUnselectedLabels: false,
        ),
      ),
      floatingActionButton: Visibility(
        visible: (currentIndex == 0) ? true : false,
        child: FloatingActionButton(
          child:
              Icon(Icons.add, color: Theme.of(context).colorScheme.onPrimary),
          onPressed: () {
            justPractice();
            showAddTask();
          },
          shape: const StadiumBorder(
              side: BorderSide(width: 4, color: Colors.white)),
          elevation: 1.5,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  void showAddTask()
  {
    showModalBottomSheet(
        context: context,
        builder: (buildContext) {
          return Container(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: BS_AddTask(),
          );
        });
    setState(() {});
  }

  Future justPractice() async {
    await Future.delayed(Duration(seconds: 6));
    print('justPractice \n justPractice');
  }
}
