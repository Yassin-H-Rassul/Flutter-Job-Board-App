import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:team_game_job_board/models/model.dart';

class FirebaseHelper {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  addAJob(ModelJob theModelJob) {
    _firebaseFirestore.collection('jobs').add(theModelJob.toMap());
  }

  Stream getJobs() {}
}
