import 'package:flutter/material.dart';

class jobCard extends StatelessWidget {
  final String jobTitle;
final String jobDes;
final num likes;
const jobCard(this.jobTitle,this.jobDes,this.likes);

  @override
  Widget build(BuildContext context) {
    return Container(
          padding: EdgeInsets.all(8),
          child: Column(
            children: [
              Container( 
                padding: EdgeInsets.all(10),
                width: double.infinity,
                height: 100,
                color: Colors.grey,
                child: Row(
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                     
                      children: [
                       Text("job_title: $jobTitle",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                      Divider(
                        color: Colors.transparent,
                      ),
                      Text(" job_description: $jobDes",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),)
                    ],
                    ),
                  
                  Center(
                    child: Container(
                      child: Text("$likes likes",textAlign: TextAlign.center,),
                      color: Colors.blueGrey,
                      height: 90,
                      width: 90,
                    ),
                  )
                  ],
                ),
              )
            ],
          ),
        );
  }
}