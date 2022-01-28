import 'package:flutter/material.dart';
import 'package:team_game_job_board/models/model.dart';
import 'package:team_game_job_board/services/firebase_helper.dart';

class jobCard extends StatelessWidget {
  final ModelJob theCurrentJob;
  const jobCard(this.theCurrentJob);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(10),
            width: double.infinity,
            height: 100,
            color: Colors.grey[300],
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Text(
                      "job_title: ${theCurrentJob.title}",
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                    Divider(
                      color: Colors.transparent,
                    ),
                    Text(
                      " job_description:  ${theCurrentJob.description}",
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                TextButton(
                  onPressed: () {
                    FirebaseHelper _firebaseHelper = FirebaseHelper();
                    _firebaseHelper.updateJobLikes(theCurrentJob.id!);
                  },
                  child: Container(
                    height: 60,
                    width: 70,
                    color: Colors.grey[400],
                    child: Align(
                      child: Text("${theCurrentJob.numberOfLikes} likes"),
                      alignment: Alignment.center,
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
