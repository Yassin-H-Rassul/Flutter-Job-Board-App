import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:team_game_job_board/models/model.dart';

class FirebaseHelper {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  addAJob(ModelJob theModelJob) {
    _firebaseFirestore.collection('jobs').add(theModelJob.toMap());
  }

  Stream<List<ModelJob>> getStreamOfJobs() {
    return _firebaseFirestore.collection('jobs').snapshots().map(
          (v) => v.docs
              .map(
                (e) => ModelJob.fromMap(e.data()),
              )
              .toList(),
        );
  }

  Stream<List<ModelJob>>? streamOfJobsWithSortedAndSearched(
      {String? searchWord, String? sortby}) {
    String? fieldName;

    if (searchWord != null) {
      return _firebaseFirestore
          .collection('jobs')
          .where('name', isEqualTo: searchWord)
          .snapshots()
          .map(
            (docValue) => docValue.docs
                .map(
                  (e) => ModelJob.fromMap(
                    e.data(),
                  ),
                )
                .toList(),
          );
    } else if (sortby != null) {
      if (sortby == 'date') fieldName = 'validDate';
      if (sortby == 'salary') fieldName = 'salary';

      return _firebaseFirestore
          .collection('jobs')
          .orderBy(fieldName!)
          .snapshots()
          .map(
            (docValue) => docValue.docs
                .map(
                  (e) => ModelJob.fromMap(
                    e.data(),
                  ),
                )
                .toList(),
          );
    }
  }
}
