import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:team_game_job_board/Job_Board/jobBoardScreen.dart';
import 'package:team_game_job_board/services/authService.dart';
import 'package:team_game_job_board/services/firebase_helper.dart';

class homeScreen extends StatefulWidget {
  homeScreen({Key? key}) : super(key: key);

  @override
  State<homeScreen> createState() => _homeScreenState();
}

class _homeScreenState extends State<homeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Provider.of<AuthService>(context, listen: false)
                  //     .signInAnonymously();
                  // final FirebaseHelper help = FirebaseHelper();
                  // help.updateJobViews("Ml3ba6fpba3JYEI2GDkl");
                  // help.updateJobLikes("Ml3ba6fpba3JYEI2GDkl");
                },
                child: Text("login anony"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
