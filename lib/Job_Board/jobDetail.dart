import 'package:flutter/material.dart';

class jobCard extends StatelessWidget {
  final String jobTitle;
final String jobDes;
final num likes;
final Function func;

const jobCard(this.jobTitle,this.jobDes,this.likes,this.func);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: func(),
      child: Container(
            padding: EdgeInsets.all(8),
            child: Column(
              children: [
                Container( 
                  padding: EdgeInsets.all(10),
                  width: double.infinity,
                  height: 100,
                  color: Color(0xFFDFDFDF),
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
                         height: 90,
                         width: 90,
                         decoration: BoxDecoration(
                           borderRadius: BorderRadius.circular(8),
                           color: Color(0xFFC5C2C2),
                           shape:BoxShape.rectangle,
                         ),

                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("$likes likes",textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.bold),),
                          ],
                        ),
  
                      ),
                    )
                    ],
                  ),
                )
              ],
            ),
          ),
    );
  }
}