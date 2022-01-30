import 'package:flutter/material.dart';
import 'package:team_game_job_board/Job_Board/jobDetail.dart';

class favScreen extends StatefulWidget {
  const favScreen({Key? key}) : super(key: key);

  @override
  _jobBoardState createState() => _jobBoardState();
}

class _jobBoardState extends State<favScreen> {
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
      body: Column(
        children: [
          // jobCard("jobTitle", "jobDes", 45),
          // jobCard("jobTitle", "jobDes", 45),
          // jobCard("jobTitle", "jobDes", 45),
          // jobCard("jobTitle", "jobDes", 45),
        ],
      ),
    );
  }
}
