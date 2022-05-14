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
    return Column(
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
          StreamBuilder(
            stream: getTasksCollection()
                .where('dateTime',
                    isEqualTo:
                        DateUtils.dateOnly(selectedDate).millisecondsSinceEpoch)
                .snapshots(),
            builder: (BuildContext context,
                AsyncSnapshot<QuerySnapshot<Task>> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
              return Expanded(
                  child: Center(child: CircularProgressIndicator()));
            } else if (snapshot.hasError) {
              print('Error while fetching data ');
              return Center(
                  child: Column(
                children: [
                  ImageIcon(
                    AssetImage('assets/images/error.png'),
                    size: MediaQuery.of(context).size.width * 0.4,
                    color: Theme.of(context).colorScheme.onPrimary,
                  ),
                  Text("${snapshot.error.toString()}"),
                  ElevatedButton(
                      onPressed: () => setState(() {
                            print("${snapshot.error.toString()}");
                          }),
                      child: Text("Try again !"))
                ],
              ));
            } else if (snapshot.hasData &&
                snapshot.connectionState == ConnectionState.none) {
              return Text("This data does not exist");
            }
            //print('builder');
            tasks = snapshot.data?.docs.map((x) => x.data()).toList();
            print(
                "👍 StreamBuilder Did not enter any error conditions, $tasks");
            return (tasks ==
                    null) ///////////////////////////////////////////////////////  .length ???? / ! .hasData
                ? Center(
                    child: Column(
                    children: [
                      ImageIcon(
                        AssetImage('assets/images/empty_data.webp'),
                        /////////////////////////// why ?
                        size: MediaQuery.of(context).size.width * 0.8,
                        //color: Theme.of(context).colorScheme.onPrimary,
                      ),
                      Text("${snapshot.error.toString()}"),
                    ],
                    ))
                : Expanded(
                    child: ListView.builder(
                      itemBuilder: (context, index) => TaskItem(tasks[index]),
                      itemCount: tasks.length,
                    ),
                  );
          },
        ),
      ],
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

/*FutureBuilder(
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
          ),*/
