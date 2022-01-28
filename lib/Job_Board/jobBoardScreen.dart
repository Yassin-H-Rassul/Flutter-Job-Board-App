import 'package:flutter/material.dart';
import 'package:team_game_job_board/Job_Board/jobDetail.dart';
import 'package:team_game_job_board/models/model.dart';
import 'package:team_game_job_board/services/firebase_helper.dart';

class jobBoard extends StatefulWidget {
  const jobBoard({Key? key}) : super(key: key);

  @override
  _jobBoardState createState() => _jobBoardState();
}

class _jobBoardState extends State<jobBoard> {
  FirebaseHelper _firebaseHelper = FirebaseHelper();
  _showMyDialog(BuildContext context, ModelJob theModelJob) async {
    return showDialog(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          actions: [
            ElevatedButton.icon(
              label: Text('done'),
              icon: Icon(Icons.done),
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
                      Icon(
                        Icons.star,
                        color: Colors.orange,
                        size: 35,
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
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      vertical: 50,
                    ),
                    child: Text(
                      theModelJob.description!,
                      style: Theme.of(context).textTheme.headline5,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {

     




    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Job Board',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.black)),
          backgroundColor: Colors.grey,
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            _showMyDialog(
              context,
              ModelJob(
                category: 'a category',
                id: '1',
                numberOfLikes: 200,
                numberOfViews: 100,
                description: 'this is a description about the job ......',
              ),
            );
          },
          backgroundColor: Colors.black87,
          child: Icon(Icons.add),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.list),
              label: 'List',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              label: 'Favs',
            ),
          ],
        ),
        backgroundColor: Colors.white,
        body: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                fillColor: Colors.grey[300],
                filled: true,
                labelText: 'Search',
              ),
              controller: null,
            ),
            Divider(
              color: Colors.transparent,
            ),
            ElevatedButton(
              onPressed: () {},
              child: Text(
                "Sort by",
              ),
            ),
            Container(
              child: StreamBuilder<List<ModelJob>>(
                  stream: _firebaseHelper.getStreamOfJobs(),
                  builder: (context, snapshots) {
                    if (!snapshots.hasData) {
                      return CircularProgressIndicator();
                    } else if (snapshots.hasError) {
                      return Text('the error is : ${snapshots.error}');
                    }
                    return ListView.builder(
                        itemCount: snapshots.data!.length,
                        itemBuilder: (context, index) {
                          return jobCard(snapshots.data![index]);
                        });
                  }),
            )
          ],
        ));
  }
}
