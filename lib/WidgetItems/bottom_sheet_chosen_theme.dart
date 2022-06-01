import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Provider/app_provider.dart';

class BS_ChosenTheme extends StatefulWidget {
  @override
  State<BS_ChosenTheme> createState() => _BS_ChosenThemeState();
}

class _BS_ChosenThemeState extends State<BS_ChosenTheme> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppProvider>(context);

    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          boxShadow: const [
            BoxShadow(
              color: Colors.black26, ////////
              blurRadius: 1.0,
            ),
          ]),
      child: Column(
        children: [
          InkWell(
            child: getThemeRow('Light', provider.themeMode == ThemeMode.light),
            onTap: () {
              Navigator.pop(context);
              provider.changeThemeMode(mode: ThemeMode.light);
            },
          ),
          InkWell(
            child: getThemeRow('Dark', provider.themeMode == ThemeMode.dark),
            onTap: () {
              Navigator.pop(context);
              provider.changeThemeMode(mode: ThemeMode.dark);
            },
          ),
        ],
      ),
    );
  }

  Widget getThemeRow(String text, bool selected) {
    if (selected) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(text, style: Theme
                .of(context)
                .textTheme
                .headline3
                ?.copyWith(fontSize: 18, color: Theme
                .of(context)
                .primaryColor)),
            Icon(Icons.check_circle_outline_rounded, color: Theme
                .of(context)
                .primaryColor),
          ],
        ),
      );
    }
    else {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(text, style: Theme
                .of(context)
                .textTheme
                .headline3
                ?.copyWith(fontSize: 18)),
            const Icon(Icons.check_circle_outline_rounded),
          ],
        ),
      );
    }
  }

}
