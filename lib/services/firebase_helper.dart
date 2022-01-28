import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:team_game_job_board/models/model.dart';

class FirebaseHelper {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  addAJob(ModelJob theModelJob) {
    _firebaseFirestore.collection('jobs').add(theModelJob.toMap());
  }

  // likeIncrement({required String docId}) async {
  //  FirebaseFirestore.instance
  // .collection('users')
  // .where('id', isEqualTo: docId)
  // .get();
  //   print(documentStream.);
  //   // String job = _firebaseFirestore.collection('job').doc(docId).toString();
  //   // List<ModelJob> selectedjob = jsonDecode(job);

  //   // int likes = selectedjob[0].numberOfLikes!;
  //   // _firebaseFirestore
  //   //     .collection('jobs')
  //   //     .doc(docId)
  //   //     .update({"numberOfLikes": likes + 1});
  // }

  //Stream getJobs() {}
}
