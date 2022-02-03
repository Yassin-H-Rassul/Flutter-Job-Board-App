import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:team_game_job_board/models/model.dart';
import 'package:team_game_job_board/services/firebase_helper.dart';

class jobCard extends StatelessWidget {
  final ModelJob theCurrentJob;
  const jobCard(this.theCurrentJob);

  @override
  Widget build(BuildContext context) {
    return Slidable(
      key: const ValueKey(0),

      // The start action pane is the one at the left or the top side.
      startActionPane: ActionPane(
        // A motion is a widget used to control how the pane animates.
        motion: const ScrollMotion(),

        // All actions are defined in the children parameter.
        children: [
          // A SlidableAction can have an icon and/or a label.
          SlidableAction(
            onPressed: (value) {
              FirebaseHelper helper = FirebaseHelper();
              helper.deleteJobById(theCurrentJob.id!);
            },
            backgroundColor: Color(0xFFFE4A49),
            foregroundColor: Colors.white,
            icon: Icons.delete,
            label: 'Delete',
          ),
          SlidableAction(
            onPressed: (value) {
              print('updated');
            },
            backgroundColor: Color(0xFF21B7CA),
            foregroundColor: Colors.white,
            icon: Icons.update,
            label: 'update',
          ),
        ],
      ),
      child: Container(
        padding: EdgeInsets.all(8),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(8),
              width: double.infinity,
              height: 100,
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    offset: Offset(0, 1),
                    blurRadius: 2,
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        " ${theCurrentJob.title}",
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                      Divider(
                        color: Colors.transparent,
                      ),
                      Container(
                        width: 170,
                        child: Text(
                          "${theCurrentJob.description}",
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          softWrap: false,
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                      ),
                    ],
                  ),
                  IconButton(
                    onPressed: () {
                      FirebaseHelper helper = FirebaseHelper();
                      helper.updateJobIsFave(
                          theCurrentJob.id!, theCurrentJob.isFav!);
                    },
                    icon: theCurrentJob.isFav == true
                        ? Icon(Icons.favorite)
                        : Icon(Icons.favorite_border),
                    color: Colors.redAccent,
                  ),
                  TextButton(
                    onPressed: () {
                      FirebaseHelper _firebaseHelper = FirebaseHelper();
                      _firebaseHelper.updateJobLikes(theCurrentJob.id!);
                    },
                    child: Container(
                      height: 60,
                      width: 70,
                      decoration: BoxDecoration(
                        color: Colors.grey[100],
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey,
                            offset: Offset(0, 1),
                            blurRadius: 2,
                          ),
                        ],
                      ),
                      child: Align(
                        child: Text(
                          " likes \n ${theCurrentJob.numberOfLikes} ",
                          textAlign: TextAlign.center,
                        ),
                        alignment: Alignment.center,
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
