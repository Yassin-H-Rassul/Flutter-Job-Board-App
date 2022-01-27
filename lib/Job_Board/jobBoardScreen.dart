import 'package:flutter/material.dart';
import 'package:team_game_job_board/Job_Board/jobDetail.dart';

class jobBoard extends StatefulWidget {
  const jobBoard({ Key? key }) : super(key: key);

  @override
  _jobBoardState createState() => _jobBoardState();
}

class _jobBoardState extends State<jobBoard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar( centerTitle: true,title: Text('Job Board',textAlign: TextAlign.center,),backgroundColor: Colors.grey,
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




        backgroundColor: Colors.white,

        body: Column(
         
          children: [

Container(),
                TextField( 
                  
                  decoration: InputDecoration(
                    fillColor: Colors.grey, filled: true,  
                  labelText: 'Search',   
              ),  
                controller:null ,
              ),

Divider(color: Colors.transparent,),

              ElevatedButton(onPressed: (){}, child: Text("Sort by", )),

            jobCard("jobTitle", "jobDes", 45),
            
             jobCard("jobTitle", "jobDes", 45),
             jobCard("jobTitle", "jobDes", 45),
              
          ],
        )

    );
  }
}