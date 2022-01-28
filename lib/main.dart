import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:team_game_job_board/screens/homescreen.dart';
import 'package:team_game_job_board/screens/job_info.dart';
import 'package:team_game_job_board/screens/screen.dart';
import 'package:team_game_job_board/services/authService.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp().then((value) => print('firebase succeedeed.'));
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AuthService()),
      ],
      child: MaterialApp(
        home: homeScreen(),
      ),
    ),
  );
}
