import 'package:flutter/material.dart';
import 'package:team_game_job_board/Fav_Screen/favScreen.dart';
import 'package:team_game_job_board/Job_Board/jobBoardBody.dart';
import 'package:team_game_job_board/Job_Board/jobDetail.dart';
import 'package:team_game_job_board/models/model.dart';
import 'package:team_game_job_board/screens/screen.dart';
import 'package:team_game_job_board/services/firebase_helper.dart';

class jobBoard extends StatefulWidget {
  const jobBoard({Key? key}) : super(key: key);

  @override
  _jobBoardState createState() => _jobBoardState();
}

class _jobBoardState extends State<jobBoard> {
  FirebaseHelper _firebaseHelper = FirebaseHelper();

  var _selectedIndex = 0;
  static List<Widget> _widgetOptions = <Widget>[
    JobBody(),
    favScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => ThirdScreen()));
        },
        backgroundColor: Colors.black87,
        child: Icon(Icons.add),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
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
      resizeToAvoidBottomInset: false,
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
    );
  }
}
