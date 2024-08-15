import 'package:flutter/material.dart';
import 'package:form/secondscreen.dart'; 

class FirstScreen extends StatefulWidget {
  @override
  _FirstScreenState createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController sentenceController = TextEditingController();

  bool isPalindrome(String text) {
    String processedText = text.replaceAll(RegExp(r'[^A-Za-z0-9]'), '').toLowerCase();
    return processedText == processedText.split('').reversed.join('');
  }

  void checkPalindrome() {
    String sentence = sentenceController.text;
    bool result = isPalindrome(sentence);
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: Text(result ? "isPalindrome" : "not palindrome"),
      ),
    );
  }

  void goToSecondScreen() {
    String name = nameController.text;
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SecondScreen(name: name),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF00C9FF),
              Color(000000),
            ],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.person_add_alt_1,
                size: 70,
                color: Colors.white,
              ),
              SizedBox(height: 40),
              TextField(
                controller: nameController,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  hintText: "Name",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              SizedBox(height: 20),
              TextField(
                controller: sentenceController,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  hintText: "Palindrome",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),

              SizedBox(height: 40),
              ElevatedButton(
                onPressed: checkPalindrome,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF006F9A),
                  padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                ),
                child: Text("CHECK", style: TextStyle(
                  color: Colors.white
                ),),
              ),

              SizedBox(height: 20),
              ElevatedButton(
                onPressed: goToSecondScreen,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF006F9A),
                  padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                ),
                child: Text("NEXT" , style: TextStyle(
                  color: Colors.white
                ),),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
