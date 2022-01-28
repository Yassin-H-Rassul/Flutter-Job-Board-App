import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:team_game_job_board/models/model.dart';
import 'package:team_game_job_board/services/firebase_helper.dart';

class ThirdScreen extends StatefulWidget {
  const ThirdScreen({Key? key}) : super(key: key);

  @override
  State<ThirdScreen> createState() => _ThirdScreenState();
}

class _ThirdScreenState extends State<ThirdScreen> {
  DateTime? _selectedDate;
  TextEditingController _titleController = TextEditingController();
  TextEditingController _categoryController = TextEditingController();
  TextEditingController _companyNameController = TextEditingController();
  TextEditingController _descriptionController = TextEditingController();
  TextEditingController _hiresController = TextEditingController();
  TextEditingController _salaryController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add a new job'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: 350,
              child: Card(
                  child: Column(children: [
                TextField(
                  controller: _titleController,
                  decoration: InputDecoration(
                      labelText: '*Job Title',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      )),
                )
              ])
                  // color: Colors.grey,
                  ),
            ),
            Container(
              width: 350,
              child: Card(
                  child: Column(children: [
                TextField(
                  controller: _categoryController,
                  decoration: InputDecoration(
                      labelText: '*Category',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      )),
                )
              ])
                  // color: Colors.grey,
                  ),
            ),
            Container(
              width: 350,
              child: Card(
                  child: Column(children: [
                TextField(
                  controller: _companyNameController,
                  decoration: InputDecoration(
                      labelText: '*Company name',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      )),
                )
              ])
                  // color: Colors.grey,
                  ),
            ),
            Container(
              width: 350,
              child: Card(
                  child: Column(children: [
                TextField(
                  controller: _descriptionController,
                  decoration: InputDecoration(
                      labelText: 'Job description',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      )),
                )
              ])
                  // color: Colors.grey,
                  ),
            ),
            Container(
              width: 350,
              child: Card(
                  child: Column(children: [
                TextField(
                  controller: _hiresController,
                  decoration: InputDecoration(
                      labelText: 'How many Hires',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      )),
                )
              ])),
            ),
            Container(
              width: 350,
              child: Card(
                  child: Column(children: [
                TextField(
                  controller: _salaryController,
                  decoration: InputDecoration(
                      labelText: 'Salary estimation',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      )),
                )
              ])),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: Row(
                // mainAxisAlignment: MainAxisAlignment.spac,
                children: [
                  Expanded(
                    child: Container(
                      // margin: EdgeInsets.fromLTRB(30, 0, 30, 0),
                      child: Card(
                        child: ListTile(
                          title: Text(_selectedDate == null
                              ? 'No Date Chosen!'
                              : '${DateFormat.yMd().format(_selectedDate!)}'),
                        ),
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime.now(),
                        lastDate: DateTime(2050),
                      ).then((pickedDate) {
                        if (pickedDate == null) {
                          return;
                        }
                        setState(() {
                          _selectedDate = pickedDate;
                        });
                      });
                    },
                    icon: Icon(
                      Icons.date_range,
                      size: 35,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: 350,
              child: Card(
                  child: Column(children: [
                TextField(
                  controller: _emailController,
                  decoration: InputDecoration(
                      labelText: 'Send CV to email',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      )),
                )
              ])
                  // color: Colors.grey,
                  ),
            ),
            TextButton(
              onPressed: () {
                FirebaseHelper _firebaseHelper = FirebaseHelper();
                ModelJob theModelJob = ModelJob(
                  category: _categoryController.text,
                  companyName: _companyNameController.text,
                  description: _descriptionController.text,
                  hiers: _hiresController.text,
                  email: _emailController.text,
                  salary: _salaryController.text,
                  title: _titleController.text,
                  validDate: Timestamp.fromDate(_selectedDate!),
                  numberOfLikes: 0,
                  numberOfViews: 0,
                );
                var theDocReferenceId =
                    _firebaseHelper.getTheCurrentDocumentId();
                _firebaseHelper.addAJob(theModelJob);
              },
              child: Card(
                margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
                color: Colors.greenAccent,
                child: ListTile(
                  title: Text(
                    'Add New Job',
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
