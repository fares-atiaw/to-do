import 'package:cloud_firestore/cloud_firestore.dart';

import '../Models/task.dart';

CollectionReference<Task> getTasksCollection() {
  // Why it's not FirebaseFirestore ???
  return FirebaseFirestore.instance.collection('tasks').withConverter<Task>(
      fromFirestore: (snapshot, _) => Task.fromJson(snapshot.data()!),
      toFirestore: (task, _) => task.toJson());
}

Future addTaskToFirestore(Task task) {
  var collection = getTasksCollection();
  //collection.add(task);
  var document = collection
      .doc(); //creating new document in the database with a generated id
  task.id =
      document.id; //setting the generated id of the new document to the task
  return document.set(
      task); //adding the rest of the task's attributes inside that new document
}
