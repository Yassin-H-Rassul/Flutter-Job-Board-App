import 'package:flutter/material.dart';

class JobInfo extends StatelessWidget {
  const JobInfo({Key? key}) : super(key: key);

  // This widget is the root of your application.

  _showMyDialog(BuildContext context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: 99),
              padding: EdgeInsets.symmetric(
                horizontal: 50,
                vertical: 30,
              ),
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.message_outlined,
                      color: Colors.black87,
                    ),
                  ),
                  Text(' 150 likes '),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: 50,
                vertical: 30,
              ),
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.remove_red_eye,
                      color: Colors.black87,
                    ),
                  ),
                  Text(' 250 views ')
                ],
              ),
            ),
            Center(
              child: Container(
                margin: EdgeInsets.only(top: 90),
                child: Text(
                  'job information',
                  style: Theme.of(context).textTheme.headline3,
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.grey,
        ),
        body: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: 99),
              padding: EdgeInsets.symmetric(
                horizontal: 50,
                vertical: 30,
              ),
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.message_outlined,
                      color: Colors.black87,
                    ),
                  ),
                  Text(' 150 likes '),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: 50,
                vertical: 30,
              ),
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.remove_red_eye,
                      color: Colors.black87,
                    ),
                  ),
                  Text(' 250 views ')
                ],
              ),
            ),
            Center(
              child: Container(
                margin: EdgeInsets.only(top: 90),
                child: Text(
                  'job information',
                  style: Theme.of(context).textTheme.headline3,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
