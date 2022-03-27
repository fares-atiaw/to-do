import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:todos/Components/task_item.dart';

import '../Database/firestore_utility.dart';
import '../Models/task.dart';

class ListTab extends StatefulWidget {
  @override
  State<ListTab> createState() => _ListTabState();
}

class _ListTabState extends State<ListTab> {
  var tasks;
  DateTime selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          CalendarTimeline(
            showYears: true,
            initialDate: selectedDate,
            firstDate: DateTime.now().subtract(Duration(days: 365)),
            lastDate: DateTime.now().add(Duration(days: 365)),
            onDateSelected: (date) {
              selectedDate = date!;
              setState(() {});
            },
            leftMargin: 10,
            monthColor: Theme.of(context).colorScheme.onSurface,
            dayColor: Theme.of(context).colorScheme.onSurface,
            activeDayColor: Theme.of(context).primaryColor,
            activeBackgroundDayColor: Theme.of(context).colorScheme.onPrimary,
            //Colors.redAccent[100]
            dotsColor: Colors.transparent,
            //selectableDayPredicate: (date) => date.day != 23,
            //locale: 'en_ISO',
          ),
          FutureBuilder(
            future: getTasksCollection()
                .where('dateTime',
                    isEqualTo:
                        DateUtils.dateOnly(selectedDate).millisecondsSinceEpoch)
                .get(),
            builder: (BuildContext context,
                AsyncSnapshot<QuerySnapshot<Task>> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Expanded(
                    child: Center(child: CircularProgressIndicator()));
              } else if (snapshot.hasError) {
                return Text(
                    "Something went wrong (${snapshot.error.toString()})");
              } else if (snapshot.hasData &&
                  snapshot.connectionState == ConnectionState.none) {
                return Text("This data does not exist");
              }
              tasks = snapshot.data?.docs.map((x) => x.data()).toList();
              return Expanded(
                child: ListView.builder(
                  itemBuilder: (context, index) => TaskItem(tasks![index]),
                  itemCount: tasks.length,
                ),
              );
            },
          ),
        ],
      ),
      /*floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add, color: Theme.of(context).colorScheme.onPrimary),
        onPressed: () {
          showAddTask();
        },
        shape: const StadiumBorder(
            side: BorderSide(width: 4, color: Colors.white)),
        elevation: 1.5,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,*/
    );
  }

// void showAddTask() {
//   showModalBottomSheet(
//       context: context,
//       builder: (buildContext) {
//         return BS_AddTask();
//       });
// }
}
