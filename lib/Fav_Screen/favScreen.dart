import 'package:flutter/material.dart';
import 'package:team_game_job_board/Job_Board/jobDetail.dart';

class favScreen extends StatefulWidget {
  const favScreen({ Key? key }) : super(key: key);

  @override
  _jobBoardState createState() => _jobBoardState();
}

class _jobBoardState extends State<favScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
            appBar: AppBar(centerTitle: true,title: Text('favs'),backgroundColor: Colors.grey,
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


body: Column(
  children: [

    
  jobCard("jobTitle", "jobDes", 45),
  jobCard("jobTitle", "jobDes", 45),
  jobCard("jobTitle", "jobDes", 45),
  jobCard("jobTitle", "jobDes", 45),
  ],
),

    );
  }
}