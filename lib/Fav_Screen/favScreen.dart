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
               title: Text('favorite',
               style: TextStyle(color: Colors.black),
               textAlign: TextAlign.center,),
               backgroundColor: Color(0xFFC5C2C2),
            ),

     /*floating Action Button */
     floatingActionButton: FloatingActionButton(
        
        onPressed: () {},
        tooltip: 'Focus Second Text Field',
        splashColor:  Colors.white,
        hoverColor: Colors.blueGrey,
        backgroundColor: Colors.black,
        child: const Icon(Icons.add),
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
          // jobCard("jobTitle", "jobDes", 45),
          // jobCard("jobTitle", "jobDes", 45),
          // jobCard("jobTitle", "jobDes", 45),
          // jobCard("jobTitle", "jobDes", 45),
        ],
      ),

    );
  }
}
