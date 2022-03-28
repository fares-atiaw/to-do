import 'package:flutter/material.dart';

void showMessage(BuildContext context, String message, String actionText,
    [VoidCallback? fun]) {
  showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Theme.of(context).colorScheme.onPrimary,
          content: Text(message),
          actions: [
            TextButton(
                onPressed: () {
                  // Navigator.pop(context);
                  fun!();
                },
                child: Text(actionText))
          ],
        );
      });
}

void showLoading(BuildContext context, String message) {
  showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Color.fromRGBO(157, 158, 165, 0.4),
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
// final _formKey = GlobalKey<FormState>(); //As a reference
// void showUpdateDocument(BuildContext context, String message) {
//   showDialog(
//       context: context,
//       builder: (context) {
//         return AlertDialog(
//           backgroundColor: Theme.of(context).colorScheme.onPrimary,
//           content: Text(message),
//           actions: [
//             TextButton(
//                 onPressed: () {
//                   Navigator.pop(context);
//                 },
//                 child: Column(
//                   children: [
//                     Container(
//                         margin: EdgeInsets.all(10),
//                         child: Text('Edit Task',
//                             style: Theme.of(context)
//                                 .textTheme
//                                 .headline3
//                                 ?.copyWith(fontSize: 26))),
//                     Form(
//                       key: _formKey,
//                       child: Column(
//                         children: [
//                           TextFormField(
//                             decoration: InputDecoration(
//                               labelStyle: Theme.of(context)
//                                   .textTheme
//                                   .headline3
//                                   ?.copyWith(fontSize: 20, fontWeight: FontWeight.normal),
//                               labelText: 'Title',
//                             ),
//                             maxLines: 1,
//                             onChanged: (t) => title = t,
//                             textInputAction: TextInputAction.next,
//                             validator: (value) {
//                               if (value == null || value.isEmpty)
//                                 return 'Please enter your task title';
//                               return null;
//                             },
//                           ),
//                           TextFormField(
//                             decoration: InputDecoration(
//                               labelStyle: Theme.of(context)
//                                   .textTheme
//                                   .headline3
//                                   ?.copyWith(fontSize: 20, fontWeight: FontWeight.normal),
//                               labelText: 'Description',
//                             ),
//                             minLines: 1,
//                             maxLines: 4,
//                             onChanged: (t) => description = t,
//                             textInputAction: TextInputAction.done,
//                             validator: (value) {
//                               if (value == null || value.isEmpty)
//                                 return 'Please enter your task description';
//                               return null;
//                             },
//                           ),
//                         ],
//                       ),
//                     ),
//                     SizedBox(height: 16),
//                     Text('Task Date',
//                         style: Theme.of(context)
//                             .textTheme
//                             .headline3
//                             ?.copyWith(fontSize: 18)),
//                     SizedBox(height: 4),
//                     InkWell(
//                       onTap: getDate,
//                       child: Text(DateFormat('d-MMM-yyyy').format(selectedDate)),
//                     ),
//                     SizedBox(height: 8),
//                   ],
//                 ))
//           ],
//         );
//       });
// }