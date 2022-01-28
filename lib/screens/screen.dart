import 'package:flutter/material.dart';

class ThirdScreen extends StatefulWidget {
  const ThirdScreen({ Key? key }) : super(key: key);


  @override
  State<ThirdScreen> createState() => _ThirdScreenState();
}

class _ThirdScreenState extends State<ThirdScreen> {
  
  DateTime _dateTime = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return   Scaffold(
  appBar: AppBar(
    title: Text('Add a new job'),
  ),
  body: Column(
    children: [
      Container(
        width: 350,
        child: Card(
          child: Column(
            children: [
              TextField(
                decoration: InputDecoration(
                  labelText: '*Job Title',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  )
                ),
              )
            ]
          )
         // color: Colors.grey,
        ),
      ),

      Container(
         width: 350,
        child: Card(
          child: Column(
            children: [
              TextField(
                decoration: InputDecoration(
                  labelText: '*Category',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  )
                ),
              )
            ]
          )
         // color: Colors.grey,
        ),
      ),
       Container(
         width: 350,
        child: Card(
          child: Column(
            children: [
              TextField(
                decoration: InputDecoration(
                  labelText: '*Company name',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  )
                ),
              )
            ]
          )
         // color: Colors.grey,
        ),
       ),
      Container(
        width: 350,
        child: Card(
          child: Column(
            children: [
              TextField(
                decoration: InputDecoration(
                  labelText: 'Job description',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  )
                ),
              )
            ]
          )
         // color: Colors.grey,
        ),
      ),
       Container(
         width: 350,
        child: Card(
          child: Column(
            children: [
              TextField(
                decoration: InputDecoration(
                  labelText: 'How many Hires',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  )
                ),
              )
            ]
          )
        
        ),
       ),
       Container(
         width: 350,
        child: Card(
          child: Column(
            children: [
              TextField(
                decoration: InputDecoration(
                  labelText: 'Salary estimation',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  )
                ),
              )
            ]
          )
         
        ),
       ),

       Container(
         width: 250,
         margin: EdgeInsets.fromLTRB(0, 0, 98, 0),
         child: InkWell(
           onTap: (){
             onPressed: () async{

           await showDatePicker (
              context: context, 
              initialDate: _dateTime,
              firstDate: DateTime(2000),
              lastDate: DateTime(2050),
            ).then((date)
            {
              setState(){
                _dateTime = date!;
              }
            }
            );
          };
           },
           child: Card(
            child: ListTile(
              title: Text('valid till date'),
            ),
            color: Colors.grey,
                 

               ),
         ),
       ),

       Container(
         width: 350,
        child: Card(
          child: Column(
            children: [
              TextField(
                decoration: InputDecoration(
                  labelText: 'Send CV to email',
                  
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  )
                ),
              )
            ]
          )
         // color: Colors.grey,
        ),
       ),

      Card(
        margin: EdgeInsets.fromLTRB(10, 150, 10, 0),
        color: Colors.greenAccent,
        child: ListTile(
          title: Text('Add New Job'),
        ),
      ),
    ],
    
  ),
);
  }
}
