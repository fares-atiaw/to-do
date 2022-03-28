import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todos/Database/firestore_utility.dart';
import 'package:todos/Models/task.dart';
import 'package:todos/tools.dart';

class BS_AddTask extends StatefulWidget {
  @override
  State<BS_AddTask> createState() => _BS_AddTaskState();
}

class _BS_AddTaskState extends State<BS_AddTask> {
  final _formKey = GlobalKey<FormState>(); //As a reference
  String? title;
  String? description;
  DateTime selectedDate = DateTime.now();
  late Future afterAdding;

  @override
  Widget build(BuildContext context) {
    return Container(
      /*decoration: BoxDecoration(
        color: Colors.white,
          borderRadius: BorderRadius.only(topLeft: Radius.circular(10.0), topRight: Radius.circular(10.0))),*/
      padding: EdgeInsets.all(12),
      child: Column(
        children: [
          Container(
              margin: EdgeInsets.all(10),
              child: Text('Add new Task',
                  style: Theme.of(context)
                      .textTheme
                      .headline3
                      ?.copyWith(fontSize: 26))),
          Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  decoration: InputDecoration(
                    labelStyle: Theme.of(context)
                        .textTheme
                        .headline3
                        ?.copyWith(fontSize: 20, fontWeight: FontWeight.normal),
                    labelText: 'Title',
                  ),
                  maxLines: 1,
                  onChanged: (t) => title = t,
                  textInputAction: TextInputAction.next,
                  validator: (value) {
                    if (value == null || value.isEmpty)
                      return 'Please enter your task title';
                    return null;
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelStyle: Theme.of(context)
                        .textTheme
                        .headline3
                        ?.copyWith(fontSize: 20, fontWeight: FontWeight.normal),
                    labelText: 'Description',
                  ),
                  minLines: 1,
                  maxLines: 4,
                  onChanged: (t) => description = t,
                  textInputAction: TextInputAction.done,
                  validator: (value) {
                    if (value == null || value.isEmpty)
                      return 'Please enter your task description';
                    return null;
                  },
                ),
              ],
            ),
          ),
          SizedBox(height: 16),
          Text('Task Date ↴',
              textAlign: TextAlign.start,
              style: Theme.of(context)
                  .textTheme
                  .headline3
                  ?.copyWith(fontSize: 18, fontWeight: FontWeight.normal)),
          SizedBox(height: 4),
          InkWell(
            onTap: getDate,
            child: Text(DateFormat('d-MMM-yyyy').format(selectedDate),
                style: Theme.of(context).textTheme.headline2),
          ),
          SizedBox(height: 8),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.5,
            child: ElevatedButton(
              onPressed: () async {
                if (_formKey.currentState!.validate()) {
                  showLoading(context, 'Loading');
                  await addTaskToFirestore(Task(
                          title: title,
                          description: description?.trim(),
                          dateTime: DateUtils.dateOnly(selectedDate)
                              .millisecondsSinceEpoch))
                      .then((value) {
                    Navigator.pop(context); //close the loading dialog
                    Navigator.pop(context); //close the bottom sheet
                    showMessage(context, "Added Successfully", 'ok');
                  }).catchError((error) {
                    Navigator.pop(context); //close the loading dialog
                    Navigator.pop(context); //close the bottom sheet
                    showMessage(context, "Failed to add task: $error", 'ok');
                    print("Failed to add task: $error");
                  });
                }
                /*afterAdding = await addTaskToFirestore(Task(
                      title: title,
                      description: description,
                      dateTime: selectedDate.millisecondsSinceEpoch));
                  afterAdding.then((value) => print('Added successfully222');
                  afterAdding.catchError(
                      (error) => print("Failed to add user: $error"));
                    */
              },
              child: Text('Add this'),
            ),
          )
        ],
      ),
    );
  }

  void getDate() async {
    selectedDate = (await showDatePicker(
          context: context,
          initialDate: selectedDate,
          firstDate: DateTime.now(),
          lastDate: DateTime.now().add(Duration(days: 365)),
        ) ??
        DateTime.now());
    setState(() {});
  }
}
