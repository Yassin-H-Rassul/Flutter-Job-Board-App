import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:team_game_job_board/Job_Board/jobBoardScreen.dart';
import 'package:team_game_job_board/services/authService.dart';

class homeScreen extends StatefulWidget {
  homeScreen({Key? key}) : super(key: key);

  @override
  State<homeScreen> createState() => _homeScreenState();
}

class _homeScreenState extends State<homeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Center(
            child: ElevatedButton(
              onPressed: () {
                Provider.of<AuthService>(context, listen: false)
                    .signInAnonymously();
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => jobBoard()));
              },
              child: Text("login anony"),
            ),
          ),
        ],
      ),
    );
  }
}
