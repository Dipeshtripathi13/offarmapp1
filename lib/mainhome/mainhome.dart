import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
 
class MainHome extends StatelessWidget {
  const MainHome({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return   Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
         leading:IconButton(
             icon: const Icon(Icons.add_chart),
             tooltip: 'Add Item',
             onPressed: () {
               
             },
         ),
         
             
        actions: [
          IconButton(
             icon: const Icon(Icons.search),
             tooltip: 'Search',
             onPressed: () {
               
             },
             
             ),
             const Center(child: Date(),),
        ],

      ),
     
 );
    
    
  }
}
class Date extends StatelessWidget {
  const Date({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
     final DateFormat formatter = DateFormat('MM/dd');
      final String formatted = formatter.format(now);

    return Text(' $formatted',style: const TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.bold,
      color: Colors.white
    ),);
  }
}
