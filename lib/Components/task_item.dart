import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:todos/Quick_Tools/dialog_messages.dart';
import 'package:todos/my_theme.dart';

import '../Database/firestore_utility.dart';
import '../Models/task.dart';

class TaskItem extends StatefulWidget {
  late String id;
  late String title;
  late String description;
  late int date;
  late bool isDone;

  // late String? id;
  // late String? title;
  // late String? description;
  // late int? date;
  // late bool? isDone;

  TaskItem(Task task) {
    this.id = task.id = "";
    this.title = task.title ?? 'No title';
    this.description = task.description ?? '_';
    this.date = task.dateTime ?? 0;
    this.isDone = task.isDone ?? false;
    // this.id = task.id;
    // this.title = task.title;
    // this.description = task.description;
    // this.date = task.dateTime;
    // this.isDone = task.isDone;
  }

  TaskItem.name(this.id, this.title, this.description, this.date, this.isDone);

  @override
  State<TaskItem> createState() => _TaskItemState();
}

class _TaskItemState extends State<TaskItem> {
  @override
  Widget build(BuildContext context) {
    Color color =
        (widget.isDone) ? MyTheme.c_green : Theme.of(context).primaryColor;

    return Container(
      margin: EdgeInsets.only(left: 20, right: 20, top: 15),
      child: Slidable(
        //key: null,
        child: Container(
          padding: const EdgeInsets.all(10.0),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.onPrimary,
            borderRadius: BorderRadius.circular(10),
            //border: Border(top: BorderSide(width: 1, color: Theme.of(context).primaryColor)),
            border: Border.all(width: 1.5, color: color),
          ),
          child: InkWell(
            onLongPress: () async {
              print('clicked');
              showUpdateTaskMessage(
                  context: context,
                  oldTask: Task(
                      id: widget.id,
                      title: widget.title,
                      description: widget.description,
                      dateTime: widget.date));
              //setState(() {});
            },
            child: Row(
              //mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 4,
                  height: MediaQuery.of(context).size.height * 0.075,
                  decoration: BoxDecoration(
                    color: color,
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(left: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.title,
                          style: Theme.of(context)
                              .textTheme
                              .headline2
                              ?.copyWith(color: color),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              child: Icon(
                                Icons.description_outlined,
                                size: 16,
                                color: Theme.of(context)
                                    .colorScheme
                                    .onSurface
                                    .withOpacity(0.5),
                              ),
                            ),
                            SizedBox(
                              width: 2,
                            ),
                            Text(widget.description,
                                style: Theme.of(context)
                                    .textTheme
                                    .headline3
                                    ?.copyWith(fontWeight: FontWeight.normal))
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    widget.isDone = (widget.isDone) ? false : true;
                    setState(() {});
                  },
                  child: Container(
                      width: MediaQuery.of(context).size.width * 0.15,
                      height: MediaQuery.of(context).size.height * 0.05,
                      decoration: BoxDecoration(
                        color: color,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: ImageIcon(
                        AssetImage('assets/icons/awesome_check.png'),
                        size: 28,
                        color: Theme.of(context).colorScheme.onPrimary,
                      )),
                )
              ],
            ),
          ),
        ),
        closeOnScroll: true,
        startActionPane: ActionPane(
          extentRatio: .20,
          motion: StretchMotion(),
          // dismissible: DismissiblePane(
          //   onDismissed: () {},
          //   closeOnCancel: true,
          // ),
          children: [
            SlidableAction(
              onPressed: deleteTask,
              backgroundColor: Colors.red,
              foregroundColor: Colors.white,
              icon: Icons.delete,
              label: 'Delete',
            ),
          ],
        ),
      ),
    );
  }

  Future<void> deleteTask(BuildContext c) async {
    //هل علشان ماتعطلش الthread الحالي فتأخذ thread خاص تخلص فيه براحتها
    //أنا عملتها ذيادة كدة  //setState هو المفروض أحط ؟
    showLoading(context, 'Loading');
    getTasksCollection().doc(widget.id).delete().then((value) {
      Navigator.pop(context);
      showMessage(context, "Task Deleted", 'ok');
    }).catchError((error) {
      Navigator.pop(context);
      showMessage(context, "Failed to delete the task: $error", 'ok');
    });
  }

  Future<void> updateTask(BuildContext c) async {
    //أنا عملتها ذيادة كدة  //setState هو المفروض أحط ؟
    // showLoading(context, message)
    // Future<int> intTest;
    // int x=await intTest;
    // intTest.then((value) {
    // })
    showLoading(context, 'Loading');
    getTasksCollection().doc(widget.id).update({
      "title": widget.title,
      "description": widget.description,
      "dateTime": widget.date,
      "isDone": widget.isDone,
    }).then((value) {
      Navigator.pop(context);
      showMessage(context, "Task updated", 'ok');
    }).catchError((error) {
      Navigator.pop(context);
      showMessage(context, "Failed to update the task: $error", 'ok');
    });
  }

  Future<void> doneTask(BuildContext c) async {
    //أنا عملتها ذيادة كدة  //setState هو المفروض أحط ؟
    showLoading(context, 'Loading');
    getTasksCollection().doc(widget.id).delete().then((value) {
      Navigator.pop(context);
      showMessage(context, "Task Deleted", 'ok');
    }).catchError((error) {
      Navigator.pop(context);
      showMessage(context, "Failed to delete the task: $error", 'ok');
    });
  }
}
