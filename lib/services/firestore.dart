import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  //get collection of notes from the data base
  final CollectionReference notes =
      FirebaseFirestore.instance.collection('notes');

  //Create:add a new note
  Future<void> addNote(String note) {
    return notes.add({
      'note': note,
      'timestamp': Timestamp.now(),
    });
  }

  //Read
  Stream<QuerySnapshot> getNotes() {
    final notesStream =
        notes.orderBy('timestamp', descending: true).snapshots();

    return notesStream;
  }

  //Update
  Future<void> updateNote(String docid, String updatednote) {
    return notes.doc(docid).update({
      'note': updatednote,
      'timestamp': Timestamp.now(),
    });
  }

  //delete

   Future<void> deleteNote(String docid) {
    return notes.doc(docid).delete();
  }
}

