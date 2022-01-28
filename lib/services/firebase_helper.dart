import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:team_game_job_board/models/model.dart';

class FirebaseHelper {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  addAJob(ModelJob theModelJob) {
    _firebaseFirestore.collection('jobs').add(theModelJob.toMap());
  }

  getTheCurrentDocumentId() {
    final theDocReference = _firebaseFirestore.collection('jobs').doc();
    return theDocReference;
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

  //get a job by id and convert it to a list of model job
  Stream<List<ModelJob>> getStreamOfJobById(String id) {
    return _firebaseFirestore
        .collection('jobs')
        .where('id', isEqualTo: id)
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

  // update numberOfViews by 1
  updateJobViews(String id) {
    _firebaseFirestore.collection('jobs').doc(id).update(
      {'numberOfViews': FieldValue.increment(1)},
    );
  }

  // update numberOfLikes by 1
  updateJobLikes(String id) {
    _firebaseFirestore.collection('jobs').doc(id).update(
      {'numberOfLikes': FieldValue.increment(1)},
    );
  }
}
