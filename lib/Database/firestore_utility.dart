import 'package:cloud_firestore/cloud_firestore.dart';

import '../Models/task.dart';

CollectionReference<Task> getTasksCollection() {
  // it opens another thread automatically so there is no need to write async when you use it
  return FirebaseFirestore.instance.collection('tasks').withConverter<Task>(
      fromFirestore: (snapshot, _) => Task.fromJson(snapshot.data()!),
      toFirestore: (task, _) => task.toJson());
}

Future addTaskToFirestore(Task task) {
  var collection = getTasksCollection(); //collection.add(task);
  var document = collection
      .doc(); //or create new document in the database with a generated id (in case if "id" needed)
  task.id =
      document.id; //setting the generated id of the new document to the task
  return document.set(
      task); //adding the rest of the task's attributes inside that new document
}

// Future<QuerySnapshot<Task>> getTasksFromFirestore()
// {
//   return getTasksCollection().get();
// }

// Widget gettingData(List<Task>? tasks, DateTime day) {
//   return FutureBuilder(
//     future: getTasksCollection().where('dateTime', isEqualTo: day).get(),
//     builder:
//         (BuildContext context, AsyncSnapshot<QuerySnapshot<Task>> snapshot) {
//       if (snapshot.connectionState == ConnectionState.waiting) {
//         return CircularProgressIndicator();
//       } else if (snapshot.hasError) {
//         return Text("Something went wrong (${snapshot.error.toString()})");
//       } else if (snapshot.hasData &&
//           snapshot.connectionState == ConnectionState.none) {
//         return Text("This data does not exist");
//       }
//       tasks = snapshot.data?.docs.map((x) => x.data()).toList();
//       return Expanded(
//         child: ListView.builder(
//           itemBuilder: (context, index) => TaskItem(tasks![index]),
//           itemCount: tasks?.length,
//         ),
//       );
//     },
//   );
// }
