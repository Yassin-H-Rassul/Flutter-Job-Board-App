import 'package:flutter/material.dart';
import 'package:team_game_job_board/Job_Board/jobDetail.dart';
import 'package:team_game_job_board/models/model.dart';
import 'package:team_game_job_board/services/firebase_helper.dart';

class JobBody extends StatefulWidget {
  JobBody({Key? key}) : super(key: key);

  @override
  State<JobBody> createState() => _JobBodyState();
}

class _JobBodyState extends State<JobBody> {
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

  String dropdwonvale = 'Sort by';
  String search = "";
  String sortBy = "";
  TextEditingController _searchController = TextEditingController();
  FirebaseHelper _firebaseHelper = FirebaseHelper();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Job Board'),
        backgroundColor: Colors.grey[200],
        foregroundColor: Colors.black,
      ),
      body: Column(
        children: [
          Row(
            children: [
              Container(
                margin: EdgeInsets.only(top: 10, left: 10, right: 10),
                width: 240,
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    fillColor: Colors.grey[200],
                    filled: true,
                    labelText: 'Search',
                  ),
                  controller: _searchController,
                  onChanged: (value) {
                    setState(() {
                      if (value.length < 1) {
                        search = "";
                      }

                      search = value;
                    });
                  },
                ),
              ),
              Divider(
                color: Colors.transparent,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                color: Colors.black,
                child: DropdownButton(
                  iconEnabledColor: Colors.white,
                  elevation: 8,
                  dropdownColor: Colors.black,
                  value: dropdwonvale,
                  items: const [
                    DropdownMenuItem(
                      value: "Sort by",
                      child: Text(
                        "Sort by",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    DropdownMenuItem(
                      value: "date",
                      child: Text(
                        "Date",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    DropdownMenuItem(
                      value: "salary",
                      child: Text(
                        "Salary",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                  onChanged: (value) {
                    if (value.toString() != "Sort by") {
                      setState(() {
                        print(value);
                        dropdwonvale = value.toString();
                        sortBy = value.toString();
                        print("this is sortby $sortBy");
                      });
                    } else {
                      setState(() {
                        sortBy = "";
                      });
                    }
                  },
                ),
              ),
            ],
          ),
          Container(
            height: 565,
            child: StreamBuilder<List<ModelJob>>(
                stream: _firebaseHelper.streamOfJobs(
                    searchWord: search.isNotEmpty ? search : null,
                    sortby: sortBy.isNotEmpty ? sortBy : null),
                builder: (context, snapshots) {
                  if (!snapshots.hasData) {
                    return CircularProgressIndicator();
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
        ],
      ),
    );
  }
}
