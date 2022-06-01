import 'package:flutter/material.dart';
import 'package:todos/Models/task.dart';

import '../Database/firestore_utility.dart';

void showMessage(BuildContext context, String message, String actionText,
    {VoidCallback? fun}) {
  showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Theme.of(context).colorScheme.onPrimary,
          content: Text(message),
          actions: [
            TextButton(
                onPressed: () {
                  (fun == null) ? Navigator.pop(context) : fun();
                },
                child: Text(actionText))
          ],
        );
      });
}

void showLoading(BuildContext context, String message) {
  showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Color.fromRGBO(157, 158, 165, 0.25098039215686274),
          content: Row(
            children: [
              Text(message),
              SizedBox(
                width: 10,
              ),
              CircularProgressIndicator()
              /*Directionality(
                  textDirection: TextDirection.ltr,
                  child: LinearProgressIndicator()),*/
            ],
          ),
        );
      });
}

void showUpdateTaskMessage(
    {required BuildContext context, required Task oldTask}) {
  final _formKey = GlobalKey<FormState>(); //As a reference
  String? newTitle;
  String? newDescription;

  DateTime selectedDate =
      DateTime.fromMillisecondsSinceEpoch(oldTask.dateTime!);
  int? newDate = DateUtils.dateOnly(selectedDate).millisecondsSinceEpoch;

  showDialog(
      context: context,
      builder: (context) => AlertDialog(
            elevation: 2,
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(32.0))),
            //backgroundColor: Theme.of(context).colorScheme.onPrimary,
            title: Container(
                margin:
                    EdgeInsets.only(top: 10, right: 10, left: 10, bottom: 20),
                child: Text('Update your Task',
                    style: Theme.of(context)
                        .textTheme
                        .headline3
                        ?.copyWith(fontSize: 26))),
            content: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        TextFormField(
                          decoration: InputDecoration(
                            labelStyle: Theme.of(context)
                                .textTheme
                                .headline3
                                ?.copyWith(
                                    fontSize: 20,
                                    fontWeight: FontWeight.normal),
                            labelText: 'Updated title',
                          ),
                          initialValue: oldTask.title,
                          maxLines: 1,
                          onChanged: (t) => newTitle = t,
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
                                ?.copyWith(
                                    fontSize: 20,
                                    fontWeight: FontWeight.normal),
                            labelText: 'Updated description',
                          ),
                          initialValue: oldTask.description,
                          minLines: 1,
                          maxLines: 4,
                          onChanged: (t) => newDescription = t,
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
                  // SizedBox(height: 16),
                  // Text('Change date ↴',
                  //     textAlign: TextAlign.start,
                  //     style: Theme.of(context).textTheme.headline3?.copyWith(
                  //         fontSize: 18, fontWeight: FontWeight.normal)),
                  // SizedBox(height: 4),
                  // InkWell(
                  //   onTap: () async {
                  //     selectedDate = (await showDatePicker(
                  //           context: context,
                  //           initialDate: selectedDate,
                  //           firstDate: DateTime.now(),
                  //           lastDate: DateTime.now().add(Duration(days: 365)),
                  //         ) ??
                  //         DateTime.now());
                  //     newDate = DateUtils.dateOnly(selectedDate).millisecondsSinceEpoch;
                  //   },
                  //   child: Text(DateFormat('d-MMM-yyyy').format(selectedDate),
                  //       style: Theme.of(context).textTheme.headline2),
                  // ),
                  //SizedBox(height: 8),
                ],
              ),
            ),
            actions: [
              TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text('cancel')),
              TextButton(
                  onPressed: () async {
                    updateTask(
                        context: context,
                        updatedTask: Task(
                            id: oldTask.id,
                            title: newTitle,
                            description: newDescription,
                            dateTime: newDate));
                    Navigator.pop(context);
                  },
                  child: Text('update'))
            ],
          ));
}

Future<void> updateTask(
    {required BuildContext context, required Task updatedTask}) async {
  //print('updateTask -> date is ${DateTime.fromMillisecondsSinceEpoch(updatedTask.dateTime!).toString()}');
  showLoading(context, 'Loading');
  //print('updateTask -> updatedTask is description ${updatedTask.description}');
  getTasksCollection().doc(updatedTask.id).update({
    "title": updatedTask.title,
    "description": updatedTask.description,
    "dateTime": updatedTask.dateTime,
  }).then((value) {
    print('task updted successfuly');
    Navigator.pop(context);
    showMessage(context, "Task updated", 'ok');
  }).catchError((error) {
    print('failed to update task with error $error');
    Navigator.pop(context);
    showMessage(context, "Failed to update the task: $error", 'ok');
  });
}
