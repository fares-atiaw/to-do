import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Provider/app_provider.dart';
import '../WidgetItems/bottom_sheet_chosen_theme.dart';

class SettingsTab extends StatefulWidget {
  @override
  State<SettingsTab> createState() => _SettingsTabState();
}

class _SettingsTabState extends State<SettingsTab> {
  // late SharedPreferences prefs;
  // late String themeString;
  //
  // @override
  // void initState() {
  //   super.initState();
  //   init_SharedPreferences();
  //   //themeString = prefs.setString('mode', ) ?? 'light');
  // }
  //
  // Future init_SharedPreferences() async {
  //   prefs = await SharedPreferences.getInstance();
  // }
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppProvider>(context);

    return Container(
      margin: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text('Theme', style: Theme.of(context).textTheme.headline2),
          InkWell(
            onTap: (() {
              showThemeBottomSheet();
            }),
            child: Container(
                margin: const EdgeInsets.symmetric(vertical: 10),
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(12)),
                  color: Theme.of(context).colorScheme.surface,
                  border: Border.all(
                      color: Theme.of(context).primaryColor, width: 1.5),
                ),
                child: Text(
                    provider.themeMode == ThemeMode.light ? 'Light' : 'Dark',
                    style: Theme.of(context).textTheme.headline3
                    //?.copyWith(color: MyTheme.c_title),
                    )),
          ),
        ],
      ),
    );
  }

  void showThemeBottomSheet() {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return BS_ChosenTheme();
      },
    );
  }
}
