import 'package:flutter/material.dart';

class DetailsPage extends StatefulWidget {
  const DetailsPage({super.key});

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(""),),
      body: Column(
        children: [
          Container(width: 400,height: 400,),
           Text("Name"),
           SizedBox(height: 10),
           Text("Cusine"),
           SizedBox(height: 10),
           Text("Ingredients"),
           SizedBox(height: 10),
           Text("Instructions")
            
          
        ],
      ),
    );
  }
}