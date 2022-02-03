import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:team_game_job_board/models/model.dart';
import 'package:team_game_job_board/services/firebase_helper.dart';

class Updatejob extends StatefulWidget {
  Updatejob({
    Key? key,
    required this.job,
  }) : super(key: key);
  final ModelJob job;
  @override
  State<Updatejob> createState() => _UpdatejobState();
}

class _UpdatejobState extends State<Updatejob> {
  @override
  TextEditingController _titleController = TextEditingController();
  TextEditingController _categoryController = TextEditingController();
  TextEditingController _companyNameController = TextEditingController();
  TextEditingController _descriptionController = TextEditingController();
  TextEditingController _hiresController = TextEditingController();
  TextEditingController _salaryController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  DateTime? _selectedDate;
  void initState() {
    // TODO: implement initState

    super.initState();
    _selectedDate = DateTime.parse(widget.job.validDate!.toDate().toString());

    _titleController = TextEditingController(text: widget.job.title);
    _categoryController = TextEditingController(text: widget.job.category);
    _companyNameController =
        TextEditingController(text: widget.job.companyName);
    _descriptionController =
        TextEditingController(text: widget.job.description);
    _hiresController = TextEditingController(text: widget.job.hiers);
    _salaryController = TextEditingController(text: widget.job.salary);
    _emailController = TextEditingController(text: widget.job.email);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Update Job'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(top: 16),
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
                  id: widget.job.id,
                  category: _categoryController.text,
                  companyName: _companyNameController.text,
                  description: _descriptionController.text,
                  hiers: _hiresController.text,
                  email: _emailController.text,
                  salary: _salaryController.text,
                  title: _titleController.text,
                  validDate: Timestamp.fromDate(_selectedDate!),
                  numberOfLikes: widget.job.numberOfLikes,
                  numberOfViews: widget.job.numberOfViews,
                  isFav: widget.job.isFav,
                );
                _firebaseHelper.updateAJob(theModelJob);
              },
              child: Card(
                margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
                color: Colors.greenAccent,
                child: ListTile(
                  title: Text(
                    'Update  Job',
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
