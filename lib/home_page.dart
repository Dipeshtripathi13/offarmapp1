import 'package:flutter/material.dart';
import 'package:offarmapp/mainhome/mainhome.dart';
import 'package:offarmapp/pricemodel/DataFromAPI.dart';
import 'calculator.dart';
import 'show_weather.dart';

// ignore: camel_case_types
class home_page extends StatefulWidget {
  const home_page({ Key? key }) : super(key: key);

  @override
  State<home_page> createState() => _home_pageState();
}

// ignore: camel_case_types
class _home_pageState extends State<home_page> {

  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
   // ignore: prefer_final_fields
   List<Widget> _widgetOptions = <Widget>[
     const MainHome(),
    //  const Text(
    //   'Index 0: Home',
    //   style: optionStyle,
    // ),
    const CurrentWeatherPage(),
   const Text(
     'Index 2: ToDo DataFromAPI Here',
      style: optionStyle,
      
    ),

    //const DataFromAPI(),//temporyly paused

    
      const silencecalc() //implement calculator
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Nfarmapp"),
        actions: <Widget>[
          IconButton(
             icon: const Icon(Icons.perm_device_information),
             tooltip: 'About Us',
             onPressed: () {
               showDialog();
             },
             
             )
        ],
      ),
      drawer: Drawer(
        child: ListView(children: const [
           DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.purple,
            ),
            child: Text('Header'),
          )
        ],),
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),

        //add the body code here
    
      ),

      //botthmNavigation bar 
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
          backgroundColor: Colors.red,
          ),
           BottomNavigationBarItem(
            icon: Icon(Icons.cloud_circle_outlined),
            label: 'Weather',
            backgroundColor: Colors.green,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.price_change),
            label: 'Price',
            backgroundColor: Colors.purple,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calculate),
            label: 'Calculator',
            backgroundColor: Colors.pink,
            
          ),
      ],
      currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),

      
    );
  }

  //For about dialogue
 void showDialog(){
showAboutDialog(
  context: context,
  applicationName: 'offarmapp',
  applicationIcon: const FlutterLogo(),
applicationVersion: '0.0.1',
applicationLegalese: '@2021 offarmapp',
children: <Widget> [
  const Padding(
  padding: EdgeInsets.only(top: 20),
  child: Text('Developer: .....')
  )
]
  );

 }
}