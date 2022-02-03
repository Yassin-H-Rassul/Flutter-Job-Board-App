import 'package:flutter/material.dart';
import 'package:team_game_job_board/Job_Board/jobDetail.dart';
import 'package:team_game_job_board/models/model.dart';
import 'package:team_game_job_board/services/firebase_helper.dart';

class favScreen extends StatefulWidget {
  const favScreen({Key? key}) : super(key: key);

  @override
  _jobBoardState createState() => _jobBoardState();
}

class _jobBoardState extends State<favScreen> {
  _showMyDialog(BuildContext context, ModelJob theModelJob) async {
    return showDialog(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          actions: [
            ElevatedButton(
              child: Text('Close'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
          content: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        child: Row(
                          children: [
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.thumb_up,
                                color: Colors.black87,
                              ),
                            ),
                            Text(' ${theModelJob.numberOfLikes} likes '),
                          ],
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.star,
                          color: Colors.orange,
                          size: 35,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.remove_red_eye,
                          color: Colors.black87,
                        ),
                      ),
                      Text(' ${theModelJob.numberOfViews} views'),
                    ],
                  ),
                ),
                Center(
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(
                          vertical: 40,
                        ),
                        child: Text(
                          theModelJob.description!,
                          style: Theme.of(context).textTheme.headline5,
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(
                          vertical: 10,
                        ),
                        child: Text(
                          theModelJob.salary!,
                          style: Theme.of(context).textTheme.headline5,
                        ),
                      ),
                      Container(
                        alignment: Alignment.center,
                        padding: EdgeInsets.symmetric(
                          vertical: 10,
                        ),
                        child: FittedBox(
                          child: Text(
                            theModelJob.email!,
                            style: Theme.of(context).textTheme.headline5,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  FirebaseHelper _firebaseHelper = FirebaseHelper();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'favorite',
          style: TextStyle(color: Colors.black),
          textAlign: TextAlign.center,
        ),
        backgroundColor: Color(0xFFC5C2C2),
      ),
      body: Container(
        alignment: Alignment.center,
        height: 565,
        child: StreamBuilder<List<ModelJob>>(
            stream: _firebaseHelper.getStreamOfFavJobs(),
            builder: (context, snapshots) {
              if (!snapshots.hasData) {
                return Container(
                  alignment: Alignment.center,
                  width: 100,
                  height: 100,
                  child: CircularProgressIndicator(),
                );
              } else if (snapshots.data!.isEmpty) {
                return Center(
                  child: Text('No favorite jobs yet'),
                );
              } else if (snapshots.hasError) {
                return Text('the error is : ${snapshots.error}');
              }
              return ListView.builder(
                  itemCount: snapshots.data!.length,
                  itemBuilder: (context, index) {
                    return TextButton(
                        onPressed: () {
                          FirebaseHelper help = FirebaseHelper();
                          help.updateJobViews(snapshots.data![index].id!);
                          _showMyDialog(
                            context,
                            snapshots.data![index],
                          );
                        },
                        child: jobCard(snapshots.data![index]));
                  });
            }),
      ),
    );
  }
}
