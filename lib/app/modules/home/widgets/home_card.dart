// ignore_for_file: library_private_types_in_public_api, prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';

class MyCardView extends StatefulWidget {
  const MyCardView({Key? key}) : super(key: key);

  @override
  _MyCardView createState() => _MyCardView();
}

class _MyCardView extends State<MyCardView> {
  
  @override
  Widget build(BuildContext context) {
    return Card(
      borderOnForeground: true,
      elevation: 100,
      margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage('assets/images/dawood.jpg'),
                ),
                SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Name: freas',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        'City: maan',
                        style: TextStyle(fontSize: 16),
                      ),
                      SizedBox(height: 4),
                      Text(
                        'Interests: Python',
                        style: TextStyle(fontSize: 16),
                      ),
                      SizedBox(height: 4),
                      Text(
                        'City: maan',
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Divider(
            height: 0,
            thickness: 1,
            color: Colors.grey,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Lorem ipsum dolor sit amet, consectetur                       vsdbsdbsdbsddbsdbsdbsd                        adipiscing elit. Sed eget justo eu elit congue eleifend.',
              style: TextStyle(fontSize: 16),
            ),
            
          ), Divider(
            height: 0,
            thickness: 1,
            color: Colors.black,
          ),
        
          SizedBox(height: 8),
          
          SizedBox(height: 12,),
       Divider(
            height: 0,
            thickness: 1,
            color: Colors.black,
          ), ],
        
      ),
    );
    
  }
}
