import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:flutter/material.dart';
import 'package:todos/Components/task_item.dart';

class ListTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children:[
        CalendarTimeline(
          showYears: true,
          initialDate: DateTime.now(),
          firstDate: DateTime.now().subtract(Duration(days: 365)),
          lastDate: DateTime.now().add(Duration(days: 365)),
          onDateSelected: (date) => print(date),
          leftMargin: 10,
          monthColor: Theme.of(context).colorScheme.onSurface,
          dayColor: Theme.of(context).colorScheme.onSurface,
          activeDayColor: Theme.of(context).primaryColor,
          activeBackgroundDayColor: Theme.of(context).colorScheme.onPrimary,   //Colors.redAccent[100]
          dotsColor: Colors.transparent,
          //selectableDayPredicate: (date) => date.day != 23,
          //locale: 'en_ISO',
        ),
        Expanded(
          child: ListView.builder(
            itemBuilder: (context, index) => TaskItem(),
            itemCount: 3,
          ),
        )
      ],
    );
  }
}
