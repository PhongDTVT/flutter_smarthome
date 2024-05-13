import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  // get collections
  final CollectionReference notes = FirebaseFirestore.instance.collection("mytrack");


  //create
  Future<void> addNote(String note){
    return notes.add({
      'note': note,
      'timestamp': Timestamp.now(),
    });
  }
  //read
  Stream<QuerySnapshot> getNotes() {
    final noteStream = notes.orderBy('PHONE', descending: true).snapshots();
    return noteStream;
  }
  //update

  //delete
}