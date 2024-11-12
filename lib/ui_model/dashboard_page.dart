import 'package:flutter/material.dart';
//import 'package:moviesapp/ui_model/SearchScreen.dart';
import 'package:moviesapp/ui_model/homepage.dart';
import 'package:moviesapp/ui_model/searchpage.dart';

class DashboardPage extends StatefulWidget {

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}


class _DashboardPageState extends State<DashboardPage> {
int selectedPage=0;
List pages= [HomeScreen(),SearchPage()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[selectedPage],
      bottomNavigationBar:  BottomNavigationBar(
        currentIndex: selectedPage,
        onTap: (item){
          setState(() {
            selectedPage=item;
          });

        },
        items:const [
          BottomNavigationBarItem(icon: Icon(Icons.home,color: Colors.red,size: 35,),label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.search,color: Colors.red,size: 35,), label: "")


        ] ),
    );

  }
}
