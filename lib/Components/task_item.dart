import 'package:flutter/material.dart';
import 'package:todos/my_theme.dart';
import 'package:todos/tools.dart';

import '../Models/task.dart';

class TaskItem extends StatefulWidget {
  late String id;
  late String title;
  late String description;
  late int date;
  late bool isDone;

  TaskItem(Task task) {
    this.id = task.id ?? "";
    this.title = task.title!;
    this.description = task.description!;
    this.date = task.dateTime!;
    this.isDone = task.isDone!;
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
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.onPrimary,
        borderRadius: BorderRadius.circular(10),
        //border: Border(top: BorderSide(width: 1, color: Theme.of(context).primaryColor)),
        border: Border.all(width: 1.5, color: Theme.of(context).primaryColor),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: InkWell(
          onTap: () {
            showMessage(context, widget.description, "ok");
          },
          child: Row(
            //mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 4,
                height: MediaQuery.of(context).size.height * 0.075,
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
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
                        style: Theme.of(context).textTheme.headline2,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            child: Icon(
                              Icons.wb_incandescent_outlined,
                              size: 16,
                            ),
                          ),
                          SizedBox(
                            width: 5,
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
    );
  }
}
