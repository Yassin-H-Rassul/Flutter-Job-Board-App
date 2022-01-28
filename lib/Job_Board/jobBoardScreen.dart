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

      /* app bar */
                appBar: AppBar(
               centerTitle: true,
               title: Text('Job Board',
               style: TextStyle(color: Colors.black),
               textAlign: TextAlign.center,),
               backgroundColor: Color(0xFFC5C2C2),
            ),
     
     /* floating Action Button   */
    floatingActionButton: FloatingActionButton(
       
        onPressed: () {},
        tooltip: 'Focus Second Text Field',
        splashColor:  Colors.white,
        hoverColor: Colors.blueGrey,
        backgroundColor: Colors.black,
        child: const Icon(Icons.add),
      ),

        /*bottom Navigation Bar */
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

         /*  body  */
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            children: [
             Divider(color: Colors.transparent,),// to make a space

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 300,
                        child: TextField( 
                          
                          decoration: InputDecoration(
                            border:  OutlineInputBorder(
                              borderSide:BorderSide(color: Colors.transparent, width: 2.0),
                            ),
                            fillColor:   Color(0xFFDFDFDF), filled: true,  
                            labelText: 'Search',),  

                        controller:null ,

                ),
              ),
        

                TextButton(onPressed: (){}, child: Text("Sort by",style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color:Colors.black), )),
                   
                    ],
                  ),
        
               jobCard("jobTitle", "jobDes", 45,(){}),
               jobCard("jobTitle", "jobDes", 4455,(){}),
               jobCard("jobTitle", "jobDes", 45,(){}),
                jobCard("jobTitle", "jobDes", 45,(){}),
               jobCard("jobTitle", "jobDes", 4455,(){}),
               jobCard("jobTitle", "jobDes", 45,(){}),
                jobCard("jobTitle", "jobDes", 45,(){}),
               jobCard("jobTitle", "jobDes", 4455,(){}),
               jobCard("jobTitle", "jobDes", 45,(){}),
                jobCard("jobTitle", "jobDes", 45,(){}),
               jobCard("jobTitle", "jobDes", 4455,(){}),
               jobCard("jobTitle", "jobDes", 45,(){}),
                
            ],
          ),
        )

    );
  }
}