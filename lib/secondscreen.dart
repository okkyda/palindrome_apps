import 'package:flutter/material.dart';
import 'package:form/thirdscreen.dart'; 

class SecondScreen extends StatefulWidget {
  final String name;

  SecondScreen({required this.name});

  @override
  _SecondScreenState createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  String selectedUserName = "No user selected";

  void chooseUser() async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ThirdScreen()),
    );
    if (result != null) {
      setState(() {
        selectedUserName = result;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Second Screen"),
        backgroundColor: Colors.white,
      ),
      body: Stack(
        children: [
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Welcome",
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  "${widget.name}",
                  style: TextStyle(fontSize: 24,
                  fontWeight: FontWeight.bold
                  ),
                ),
                SizedBox(height: 20),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    "Selected Username",
                    style: TextStyle(fontSize: 25),
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: SizedBox(
                width: double.infinity, 
                child: ElevatedButton(
                  onPressed: chooseUser,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueAccent,
                    padding: EdgeInsets.symmetric(vertical: 15), 
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                  ),
                  child: Text(
                    "Choose User",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
